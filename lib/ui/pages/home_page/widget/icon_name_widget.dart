import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class IconAndName extends StatelessWidget {
  IconAndName(
      {required this.icon,
      required this.text,
      required this.voidCallback,
      this.color = Colors.black,
      this.fontWeight = FontWeight.w500,
      this.fontsize = 18});

  String icon;
  String text;
  Color color;
  double fontsize;
  FontWeight fontWeight;
  VoidCallback voidCallback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: voidCallback,
      child: Column(
        children: [
          SizedBox(
            height: 85.h,
            width: 85.h,
            child: SvgPicture.asset(
              icon,
            ),
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
