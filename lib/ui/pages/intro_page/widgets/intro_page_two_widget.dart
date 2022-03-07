import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroPageTwoWidget extends StatelessWidget {
  IntroPageTwoWidget({
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
          top: -84,
          left: -175,
          child: Container(
            alignment: Alignment.center,
            width: 758.r,
            height: 758.r,
            decoration: BoxDecoration(
              color: Color(0xFFEEFFFB),
              borderRadius: BorderRadius.circular(370),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 230.w,
              height: 50.h,
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
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
            SizedBox(height: 62),
            Container(
                width: 364.w, height: 265.21.h, child: Image.asset(image)),
          ],
        ),
      ],
    );
  }
}
