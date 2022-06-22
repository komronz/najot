import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/config/const/size_const.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    required this.onPress,
    required this.text,
    this.color = AppColorUtils.white,
    this.textColor = AppColorUtils.black,
    this.width = 25.0,
    this.height = 25.0,
    this.borderRadius = 10,
    this.textSize = SizeConst.font16,
    this.elevation = 0,
    this.fontWeight = FontWeight.bold,
    this.borderWidth = 0,
    this.borderColor,
    this.visibleIcon = false,
    Key? key,
    this.addIcon = AppImageUtils.edit,
    this.iconColor = AppColorUtils.black,
  }) : super(key: key);

  final VoidCallback onPress;
  final String text;
  final Color color;
  final Color textColor;
  final double width;
  final double height;
  final double borderRadius;
  final double textSize;
  final double elevation;
  final FontWeight fontWeight;
  final double borderWidth;
  final Color? borderColor;
  final String addIcon;
  final bool visibleIcon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: color,
        ),
        child: InkWell(
          key: key,
          onTap: onPress,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            height: height,
            width: width,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: visibleIcon,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 18.w,
                          height: 17.w,
                          child: SvgPicture.asset(
                            addIcon,
                            color: iconColor,
                          ),
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),
                  ),
                  AppWidgets.textLocale(
                    fontWeight: fontWeight,
                    text: text,
                    color: textColor,
                    fontSize: textSize,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
