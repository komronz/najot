
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:najot/ui/pages/verification_page/pin_put/pin_put.dart';


class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

extension on ThemeData {
  InputDecoration get hiddenPinputDecoration {
    final hiddenTextStyle = TextStyle(
      color: Colors.transparent,
      fontSize: 0,
      height: 0,
    );

    return InputDecoration(
      border: InputBorder.none,
      contentPadding: EdgeInsets.zero,
      counterText: '',
      errorText: '',
      hintText: '',
      labelText: '',
      helperText: '',
      prefixText: '',
      suffixText: '',
      errorStyle: hiddenTextStyle,
      counterStyle: hiddenTextStyle,
      labelStyle: hiddenTextStyle,
      helperStyle: hiddenTextStyle,
      prefixStyle: hiddenTextStyle,
      floatingLabelStyle: hiddenTextStyle,
      suffixStyle: hiddenTextStyle,
      hintStyle: hiddenTextStyle,
    );
  }
}

class PinPutState extends State<PinPut>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  late ValueNotifier<String> _textControllerValue;

  int get selectedIndex => _controller.value.text.length;

  late Animation _cursorAnimation;
  AnimationController? _cursorAnimationController;

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
    _textControllerValue = ValueNotifier<String>(_controller.value.text);
    _controller.addListener(_textChangeListener);

    _focusNode.addListener(() {
      if (mounted) setState(() {});
    });

    if (widget.withCursor) {
      _cursorAnimationController = AnimationController(
          vsync: this, duration: Duration(milliseconds: 500));
      _cursorAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          curve: Curves.linear, parent: _cursorAnimationController!));

      _cursorAnimationController!.addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          _cursorAnimationController!.repeat(reverse: true);
        }
      });
      _cursorAnimationController!.forward();
    }

    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  void _textChangeListener() {
    final pin = _controller.value.text;
    if (pin != _textControllerValue.value) {
      try {
        _textControllerValue.value = pin;
      } catch (e) {
        _textControllerValue = ValueNotifier(_controller.value.text);
      }
      if (pin.length == widget.fieldsCount) widget.onSubmit?.call(pin);
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) _controller.dispose();
    if (widget.focusNode == null) _focusNode.dispose();

    _cursorAnimationController?.dispose();
    _textControllerValue.dispose();
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState appLifecycleState) {
    if (appLifecycleState == AppLifecycleState.resumed ||
        widget.checkClipboard) {
      _checkClipboard();
    }
  }

  Future<void> _checkClipboard() async {
    final ClipboardData? clipboardData = await Clipboard.getData('text/plain');
    if (clipboardData?.text?.length == widget.fieldsCount) {
      widget.onClipboardFound?.call(clipboardData!.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        _fields,
        _hiddenTextField,
      ],
    );
  }

  void _handleTap() {
    final focus = FocusScope.of(context);
    if (_focusNode.hasFocus) _focusNode.unfocus();
    if (focus.hasFocus) focus.unfocus();
    focus.requestFocus(FocusNode());
    Future.delayed(Duration.zero, () => focus.requestFocus(_focusNode));
    if (widget.onTap != null) widget.onTap!();
  }

  TextStyle get textStyle => widget.textStyle ?? const TextStyle();

  Widget get _hiddenTextField {
    return TextFormField(
      key: widget.key,
      controller: _controller,
      onTap: widget.onTap,
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
      textInputAction: widget.textInputAction,
      focusNode: _focusNode,
      enabled: widget.enabled,
      autofocus: widget.autofocus,
      readOnly: !widget.useNativeKeyboard,
      obscureText: widget.obscureText != null,
      autofillHints: widget.autofillHints,
      keyboardAppearance: widget.keyboardAppearance,
      keyboardType: widget.keyboardType,
      textCapitalization: widget.textCapitalization,
      inputFormatters: widget.inputFormatters,
      toolbarOptions: widget.toolbarOptions,
      enableSuggestions: widget.enableSuggestions,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      autocorrect: false,
      showCursor: false,
      maxLines: 1,
      maxLength: widget.fieldsCount,
      scrollPadding: EdgeInsets.zero,
      decoration:
          widget.inputDecoration ?? Theme.of(context).hiddenPinputDecoration,
      style: textStyle.copyWith(color: Colors.transparent),
    );
  }

  Widget get _fields {
    return ValueListenableBuilder<String>(
      valueListenable: _textControllerValue,
      builder: (BuildContext context, value, Widget? child) {
        return GestureDetector(
          onTap: _handleTap,
          child: Row(
            mainAxisSize: widget.mainAxisSize,
            mainAxisAlignment: widget.fieldsAlignment,
            children: _buildFieldsWithSeparator(),
          ),
        );
      },
    );
  }

  List<Widget> _buildFieldsWithSeparator() {
    final fields = Iterable<int>.generate(widget.fieldsCount).map((index) {
      return _getField(index);
    }).toList();

    for (final int i in widget.separatorPositions) {
      if (i <= widget.fieldsCount) {
        final List<int> smaller =
            widget.separatorPositions.where((int d) => d < i).toList();
        fields.insert(i + smaller.length, widget.separator);
      }
    }

    return fields;
  }

  Widget _getField(int index) {
    final String pin = _controller.value.text;
    return AnimatedContainer(
      width: widget.eachFieldWidth,
      height: widget.eachFieldHeight,
      alignment: widget.eachFieldAlignment,
      duration: widget.animationDuration,
      curve: widget.animationCurve,
      padding: widget.eachFieldPadding,
      margin: widget.eachFieldMargin,
      constraints: widget.eachFieldConstraints,
      decoration: _fieldDecoration(index),
      child: AnimatedSwitcher(
        switchInCurve: widget.animationCurve,
        switchOutCurve: widget.animationCurve,
        duration: widget.animationDuration,
        transitionBuilder: (child, animation) {
          return _getTransition(child, animation);
        },
        child: _buildFieldContent(index, pin),
      ),
    );
  }

  Widget _buildFieldContent(int index, String pin) {
    if (index < pin.length) {
      return Text(
        widget.obscureText ?? pin[index],
        key: ValueKey<String>(index < pin.length ? pin[index] : ''),
        style: textStyle,
      );
    }

    final isActiveField = index == pin.length;
    final focused = _focusNode.hasFocus || !widget.useNativeKeyboard;

    if (widget.withCursor && isActiveField && focused) {
      return _buildCursor();
    }

    if (widget.preFilledWidget != null)
      return SizedBox(
        key: ValueKey<String>(index < pin.length ? pin[index] : ''),
        child: widget.preFilledWidget,
      );
    return Text(
      '',
      key: ValueKey<String>(index < pin.length ? pin[index] : ''),
      style: textStyle,
    );
  }

  BoxDecoration? _fieldDecoration(int index) {
    if (!widget.enabled) return widget.disabledDecoration;
    if (index < selectedIndex &&
        (_focusNode.hasFocus || !widget.useNativeKeyboard)) {
      return widget.submittedFieldDecoration;
    }
    if (index == selectedIndex &&
        (_focusNode.hasFocus || !widget.useNativeKeyboard)) {
      return widget.selectedFieldDecoration;
    }
    return widget.followingFieldDecoration;
  }

  Widget _getTransition(Widget child, Animation animation) {
    switch (widget.pinAnimationType) {
      case PinAnimationType.none:
        return child;
      case PinAnimationType.fade:
        return FadeTransition(
          opacity: animation as Animation<double>,
          child: child,
        );
      case PinAnimationType.scale:
        return ScaleTransition(
          scale: animation as Animation<double>,
          child: child,
        );
      case PinAnimationType.slide:
        return SlideTransition(
          position: Tween<Offset>(
            begin: widget.slideTransitionBeginOffset ?? Offset(0.8, 0),
            end: Offset.zero,
          ).animate(animation as Animation<double>),
          child: child,
        );
      case PinAnimationType.rotation:
        return RotationTransition(
          turns: animation as Animation<double>,
          child: child,
        );
    }
  }

  Widget _buildCursor() {
    return AnimatedBuilder(
      animation: _cursorAnimationController!,
      builder: (context, child) {
        return Center(
          child: Opacity(
            opacity: _cursorAnimation.value,
            child: widget.cursor ?? Text('|', style: textStyle),
          ),
        );
      },
    );
  }
}
