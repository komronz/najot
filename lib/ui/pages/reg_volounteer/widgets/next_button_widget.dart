import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class NextButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final bool isActive;

  const NextButtonWidget({
    required this.onTap,
    this.isActive = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color =
        isActive ? AppColorUtils.KRAUDFANDING : AppColorUtils.DISABLE_BC;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AppWidgets.text(
          text: "Keyingisi",
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: color,
        ).paddingOnly(right: 10.w),
        GestureDetector(
          onTap: isActive
              ? onTap
              : () {
                  AppWidgets.showText(text: "maydonlarni to'liq to'ldiring");
                },
          child: CircleAvatar(
            radius: 20,
            backgroundColor: color,
            child: Icon(
              Icons.arrow_forward,
              color: AppColorUtils.WHITE,
            ),
          ),
        ),
      ],
    );
  }
}
