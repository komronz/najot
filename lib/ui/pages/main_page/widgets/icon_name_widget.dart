import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class IconAndName extends StatelessWidget {
  IconAndName({
    required this.icon,
    required this.text,
    required this.onTap,
    this.color = Colors.black,
    this.fontWeight = FontWeight.w500,
    this.fontsize = 18,
    this.minFontSize = 10,
  });

  String icon;
  String text;
  Color color;
  double fontsize;
  double minFontSize;
  FontWeight fontWeight;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: 85.w,
            width: 85.w,
            child: SvgPicture.asset(
              icon,
            ),
          ),
          SizedBox(
            height: 5.w,
          ),
          SizedBox(
            width: 115.w,
            child: AppWidgets.AutoSizeText(
              minFontSize: minFontSize = 10,
              text: text,
              color: color,
              fontSize: fontsize,
              fontWeight: fontWeight,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
