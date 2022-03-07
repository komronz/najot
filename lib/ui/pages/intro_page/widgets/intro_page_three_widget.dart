import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroPageThreeWidget extends StatelessWidget {
  IntroPageThreeWidget({
    required this.image,
    required this.title,
    required this.content,
    Key? key,
  }) : super(key: key);
  String image;
  String title;
  String content;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -63,
          left: -111,
          child: Container(
            alignment: Alignment.center,
            width: 589.w,
            height: 589.h,
            decoration: BoxDecoration(
              color: Color(0xFFEEFFFB),
              borderRadius: BorderRadius.circular(240),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(left: 30),
                width: 279.67,
                height: 332,
                child: Image.asset(image)),
            SizedBox(height: 115.h),
            Container(
              margin: EdgeInsets.only(left: 30),
              width: 195.w,
              height: 43.h,
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              margin: EdgeInsets.only(left: 30),
              width: 310.w,
              height: 52.h,
              child: Text(
                content,
                style: const TextStyle(
                    color: Color(0xFF5D7B73),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
