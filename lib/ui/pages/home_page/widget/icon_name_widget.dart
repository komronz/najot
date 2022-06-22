import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class IconAndName extends StatelessWidget {
  const IconAndName({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.color = Colors.black,
    this.fontWeight = FontWeight.w500,
    this.fontsize = 18,
  }) : super(key: key);

  final String icon;
  final String text;
  final Color color;
  final double fontsize;
  final FontWeight fontWeight;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: 85.h,
            width: 85.h,
            child: SvgPicture.asset(
              icon,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          AppWidgets.textLocale(
              text: text,
              color: color,
              fontSize: fontsize,
              fontWeight: fontWeight)
        ],
      ),
    );
  }
}
