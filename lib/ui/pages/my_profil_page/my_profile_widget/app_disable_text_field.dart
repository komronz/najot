import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/utils/app_color_utils.dart';

class AppDisableTextField extends StatefulWidget {
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

  AppDisableTextField(
      {required this.hintText,
      required this.onChanged,
      required this.title,
      this.isMultiLine = false,
      this.inputFormatter,
      this.textInputType,
      this.isPassword = false,
      this.enabled = false,
      this.isFill = false,
      this.initialText = '',
      this.hasError = false,
      this.height});

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppDisableTextField> {
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
            borderSide: BorderSide(
              width: 2,
              color: AppColorUtils.RED,
            ),
          )
        : OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              width: 1,
              color: AppColorUtils.BORDER,
            ),
          );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.isFill
                ? const SizedBox()
                : AppWidgets.textLocale(
                    text: "",
                    color: AppColorUtils.RED,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
            AppWidgets.textLocale(
              text: widget.title,
              color: AppColorUtils.DARK_4,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ).paddingOnly(top: 4),
          ],
        ).paddingOnly(bottom: 8),
        Container(
          height: widget.height,
          decoration: BoxDecoration(
            color: AppColorUtils.REG_BACK,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            inputFormatters:
                widget.inputFormatter != null ? [widget.inputFormatter!] : null,
            expands: widget.isMultiLine ? true : false,
            textAlignVertical: TextAlignVertical.top,
            maxLines: widget.isMultiLine ? null : 1,
            controller: _textEditingController,
            enabled: widget.enabled,
            style: GoogleFonts.inter(
              fontSize: 15.sp,
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
                fontWeight: FontWeight.w500,
                color: AppColorUtils.REG_TEXT,
              ),
            ),
            onChanged: (v) => widget.onChanged(v),
          ),
        )
      ],
    );
  }
}
