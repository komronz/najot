import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class AppSearchWidget extends StatefulWidget {
  final ValueChanged<String> onChange;
  final VoidCallback search;

  const AppSearchWidget({
    required this.onChange,
    required this.search,
    Key? key,
  }) : super(key: key);

  @override
  _AppSearchWidgetState createState() => _AppSearchWidgetState();
}

InputBorder get _border => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColorUtils.BORDER_COLOR, width: 1),
    );

class _AppSearchWidgetState extends State<AppSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColorUtils.ITEM_ORDERS_CARD,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 50,
      child: TextField(
        cursorColor: AppColorUtils.GREEN_APP,
        enableSuggestions: true,
        onChanged: widget.onChange,
        decoration: InputDecoration(
          enabledBorder: _border,
          border: _border,
          disabledBorder: _border,
          focusedBorder: _border,
          focusColor: AppColorUtils.BORDER_COLOR,
          suffixIcon: InkWell(
            onTap: widget.search,
            child: AppWidgets.imageSvg(
              path: AppImageUtils.IC_SEARCH,
              height: 14.w,
              width: 14.w,
              fit: BoxFit.none,
            ),
          ),
          hintText: LocaleKeys.enter_project_name.tr(),
          hintStyle: TextStyle(
            color: AppColorUtils.GRAY_4,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
