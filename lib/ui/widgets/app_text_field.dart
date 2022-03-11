import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class AppTextField extends StatefulWidget {
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

  AppTextField({
    required this.hintText,
    required this.onChanged,
    required this.title,
    this.inputFormatter,
    this.textInputType,
    this.isPassword = false,
    this.enabled = true,
    this.isFill = false,
    this.initialText = '',
    this.hasError = false,
  });

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
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
      borderSide: BorderSide(width: 2, color: AppColorUtils.RED),
    )
        : OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(width: 2, color: AppColorUtils.BORDER_COLOR),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.isFill
                ? SizedBox()
                : AppWidgets.textLocale(
                    text: "*",
                    color: AppColorUtils.RED,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
            AppWidgets.text(
              text: widget.title,
              color: AppColorUtils.DARK_4,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ).paddingOnly(top: 4),
          ],
        ).paddingOnly(bottom: 8),
        Container(
          decoration: BoxDecoration(
              color: AppColorUtils.WHITE,
              borderRadius: BorderRadius.circular(12)),
          child: TextField(
            controller: _textEditingController,
            enabled: widget.enabled,
            style: GoogleFonts.inter(
              fontSize: 16,
            ),
            decoration: InputDecoration(
              // border: _border,
              disabledBorder: _border,
              focusedBorder: _border,
              enabledBorder: _border,
              contentPadding: EdgeInsets.all(14),
              hintText: widget.hintText,
              hintStyle: GoogleFonts.inter(fontSize: 16),
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
    ).paddingSymmetric(horizontal: 20);
  }
}