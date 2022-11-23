import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:najot/data/utils/app_color_utils.dart';

class TextFieldWidget extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final String title;
  final bool isFill;
  final TextInputFormatter? inputFormatter;
  final TextInputType? textInputType;
  final bool isPassword;
  final bool enabled;
  final String initialText;
  final bool hasError;
  final bool isMultiLine;
  final double? height;

  TextFieldWidget({
    required this.hintText,
    required this.onChanged,
    required this.title,
    this.isMultiLine=false,
    this.inputFormatter,
    this.textInputType,
    this.isPassword = false,
    this.enabled = true,
    this.isFill = false,
    this.initialText = '',
    this.hasError = false,
    this.height
  });

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late TextEditingController _textEditingController;
  late bool obscureText;

  @override
  void initState() {
    _textEditingController = TextEditingController(text: widget.initialText);
    obscureText = widget.isPassword;
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    InputBorder _border = widget.hasError
        ? OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(width: 2, color: AppColorUtils.RED,),
    )
        : OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(width: 2, color: AppColorUtils.BORDER_COLOR,),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: widget.height,
          decoration: BoxDecoration(
            color: AppColorUtils.WHITE,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            expands: widget.isMultiLine?true:false,
            textAlignVertical: TextAlignVertical.top,
            maxLines: widget.isMultiLine?null:1,
            controller: _textEditingController,
            enabled: widget.enabled,
            style: GoogleFonts.inter(
              fontSize: 16.sp,
            ),
            decoration: InputDecoration(
              // border: _border,
              disabledBorder: _border,
              focusedBorder: _border,
              enabledBorder: _border,
              contentPadding: EdgeInsets.all(14),
              hintText: widget.hintText,
              hintStyle: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColorUtils.GRAY_4,
              ),
              suffixIcon: widget.isPassword
                  ? InkWell(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                ),
              )
                  : null,
            ),
            obscureText: obscureText,
            keyboardType: widget.textInputType,
            onChanged: (v) => widget.onChanged(v),
            inputFormatters: widget.inputFormatter == null
                ? null
                : [
              widget.inputFormatter!,
            ],
          ),
        )
      ],
    );
  }
}
