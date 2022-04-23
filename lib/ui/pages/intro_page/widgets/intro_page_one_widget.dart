import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';

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
              Image.asset(image).paddingOnly(bottom: 65.w),
              Container(
                height: 39.w,
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
                height: 50.w,
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
