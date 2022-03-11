import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/utils/app_color_utils.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      child: RichText(
        text: TextSpan(
          text: "Men ",
          style: TextStyle(
            color: AppColorUtils.BLACK,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          children: [
            TextSpan(
              text: 'loyiha shartlari',
              style: TextStyle(
                color: AppColorUtils.GREEN_APP,
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(
              text: " bilan tanishib chiqdim va ularga roziman",
            )
          ],
        ),
      ),
    );
  }
}