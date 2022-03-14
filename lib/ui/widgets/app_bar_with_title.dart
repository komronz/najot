import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class AppBarWithTitle extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onPress;
  final List<Widget>? action;

  const AppBarWithTitle({
    required this.title,
    required this.onPress,
    this.action,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            child: Container(
              width: 31.w,
              height: 34.w,
              decoration: BoxDecoration(
                color: AppColorUtils.BACK_BUTTON,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: AppColorUtils.IC_GREEN2,
                size: 20.w,
              ),
            ),
            onTap: onPress,
          ),
        ],
      ).paddingOnly(left: 24.w),
      title: AppWidgets.textLocale(
        text: title,
        fontWeight: FontWeight.w600,
        color: AppColorUtils.BLACK,
        fontSize: 20.sp,
        textAlign: TextAlign.center,
      ),
      actions: action != null ? action : [SizedBox()],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
