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

  const AppDisableTextField(
      {Key? key,
      required this.hintText,
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
      this.height})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
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
    InputBorder border = widget.hasError
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              width: 2,
              color: AppColorUtils.red,
            ),
          )
        : OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              width: 1,
              color: AppColorUtils.border,
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
                    color: AppColorUtils.red,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
            AppWidgets.textLocale(
              text: widget.title,
              color: AppColorUtils.dark4,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ).paddingOnly(top: 4),
          ],
        ).paddingOnly(bottom: 8),
        Container(
          height: widget.height,
          decoration: BoxDecoration(
            color: AppColorUtils.regBack,
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
              disabledBorder: border,
              focusedBorder: border,
              enabledBorder: border,
              contentPadding: const EdgeInsets.all(14),
              hintText: widget.hintText,
              hintStyle: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColorUtils.regText,
              ),
            ),
            onChanged: (v) => widget.onChanged(v),
          ),
        )
      ],
    );
  }
}
