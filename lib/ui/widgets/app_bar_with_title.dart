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
      backgroundColor: AppColorUtils.background,
      elevation: 0,
      leading: InkWell(
        onTap: onPress,
        child: Container(
          width: 31.w,
          height: 34.w,
          decoration: BoxDecoration(
            color: AppColorUtils.backButton,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColorUtils.icGreen2,
            size: 20.w,
          ),
        ),
      ).paddingOnly(
        left: 24.w,
        top: 10.w,
        bottom: 10.w,
      ),
      title: AppWidgets.textLocale(
        text: title,
        fontWeight: FontWeight.w600,
        color: AppColorUtils.black,
        fontSize: 20.sp,
        textAlign: TextAlign.center,
      ),
      actions: action ?? [const SizedBox()],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
