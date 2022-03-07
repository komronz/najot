import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroPageOneWidget extends StatelessWidget {
  IntroPageOneWidget({
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
        Container(
          margin: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 252.w, height: 267.h, child: Image.asset(image)),
              SizedBox(height: 68),
              Container(
                width: 110.w,
                height: 39.h,
                child: Text(
                  title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: 310.w,
                height: 52.h,
                child: Text(
                  content,
                  style: const TextStyle(
                      color: Color(0xFF5D7B73),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
