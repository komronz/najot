import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RippleButton extends StatelessWidget {
  double? width;
  double? height;
  Widget? child;
  GestureTapCallback? onTap;
  GestureTapCallback? onDoubleTap;
  GestureLongPressCallback? onLongPress;
  GestureTapDownCallback? onTapDown;
  GestureTapCancelCallback? onTapCancel;
  ValueChanged<bool>? onHighlightChanged;
  ValueChanged<bool>? onHover;
  MouseCursor? mouseCursor;
  Color? focusColor;
  Color? hoverColor;
  Color? highlightColor;
  MaterialStateProperty<Color?>? overlayColor;
  Color? splashColor;
  InteractiveInkFeatureFactory? splashFactory;
  double? radius;
  BorderRadius? borderRadius;
  ShapeBorder? customBorder;
  bool? enableFeedback = true;
  bool excludeFromSemantics;
  FocusNode? focusNode;
  bool canRequestFocus;
  ValueChanged<bool>? onFocusChange;
  bool autofocus;

  RippleButton({
    Key? key,
    this.width,
    this.height,
    this.autofocus = false,
    this.canRequestFocus = true,
    this.child,
    this.customBorder,
    this.enableFeedback,
    this.excludeFromSemantics = false,
    this.focusColor,
    this.focusNode,
    this.highlightColor,
    this.hoverColor,
    this.mouseCursor,
    this.onDoubleTap,
    this.onFocusChange,
    this.onHighlightChanged,
    this.onHover,
    this.onLongPress,
    this.onTap,
    this.onTapCancel,
    this.onTapDown,
    this.overlayColor,
    this.radius,
    this.borderRadius,
    this.splashColor,
    this.splashFactory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (child != null) child!,
          if (onTap != null)
            Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: onTap,
                onDoubleTap: onDoubleTap,
                onLongPress: onLongPress,
                onTapDown: onTapDown,
                onTapCancel: onTapCancel,
                onHighlightChanged: onHighlightChanged,
                onHover: onHover,
                mouseCursor: mouseCursor,
                focusColor: focusColor,
                hoverColor: hoverColor,
                highlightColor: highlightColor,
                overlayColor: overlayColor,
                splashColor: splashColor,
                splashFactory: splashFactory,
                radius: radius,
                borderRadius: borderRadius,
                customBorder: customBorder,
                enableFeedback: enableFeedback,
                excludeFromSemantics: excludeFromSemantics,
                focusNode: focusNode,
                canRequestFocus: canRequestFocus,
                onFocusChange: onFocusChange,
                autofocus: autofocus,
              ),
            ),
        ],
      ),
    );
  }
}