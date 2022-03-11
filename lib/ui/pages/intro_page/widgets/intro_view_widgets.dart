import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/intro_page_bloc/intro_cubit.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/ui/pages/auth_page/auth_page.dart';

Widget viewOfOnePage(BuildContext context) {
  return Container(
    height: 770.h,
    margin: EdgeInsets.only(right: 20, left: 20),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            child: Text(
              "O'tkazib yuborish",
              style: TextStyle(
                  color: Color(0xFF048D6A),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            margin: EdgeInsets.only(bottom: 11.0),
          ),
          GestureDetector(
            onTap: () {
              context.read<IntroCubit>().pageController.nextPage(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOutQuart);
            },
            child: Container(
              height: 40.h,
              width: 40.w,
              child: Icon(Icons.chevron_right, color: Colors.white, size: 35),
              decoration: BoxDecoration(
                  color: Color(0xFF0BBF90),
                  borderRadius: BorderRadius.circular(25.0)),
            ),
          ),
        ]),
  );
}

Widget viewOfTwoPage(BuildContext context, IntroPageNextState state) {
  return Container(
    height: 770.h,
    margin: EdgeInsets.only(right: 20, left: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          child: Text(
            "O'tkazib yuborish",
            style: const TextStyle(
                color: Color(0xFF048D6A),
                fontSize: 14,
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          margin: EdgeInsets.only(bottom: 11),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                context.read<IntroCubit>().pageController.animateToPage(
                    state.currentIndex - 1,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeInOutQuart);
              },
              child: Container(
                height: 40.h,
                width: 40.w,
                child: Icon(Icons.chevron_left, color: Colors.white, size: 35),
                decoration: BoxDecoration(
                    color: Color(0xFF0BBF90),
                    borderRadius: BorderRadius.circular(25.0)),
              ),
            ),
            SizedBox(width: 15.w),
            GestureDetector(
              onTap: () {
                context.read<IntroCubit>().pageController.nextPage(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeInOutQuart);
              },
              child: Container(
                height: 40.h,
                width: 40.w,
                child: Icon(Icons.chevron_right, color: Colors.white, size: 35),
                decoration: BoxDecoration(
                    color: Color(0xFF0BBF90),
                    borderRadius: BorderRadius.circular(25.0)),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget viewOfThreePage(BuildContext context, IntroPageNextState state) {
  return Container(
    height: 770.h,
    margin: EdgeInsets.only(right: 20, left: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            context.read<IntroCubit>().pageController.animateToPage(
                state.currentIndex - 1,
                duration: Duration(milliseconds: 400),
                curve: Curves.easeInOutQuart);
          },
          child: Container(
            height: 40.h,
            width: 40.w,
            child: Icon(Icons.chevron_left, color: Colors.white, size: 35),
            decoration: BoxDecoration(
                color: Color(0xFF0BBF90),
                borderRadius: BorderRadius.circular(25.0)),
          ),
        ),
        Row(
          children: [
            Container(
              child: Text(
                "Ro'yxatdan o'tish",
                style: const TextStyle(
                    color: Color(0xFF048D6A),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              margin: EdgeInsets.only(bottom: 2),
            ),
            SizedBox(width: 15.w),
            GestureDetector(
              onTap: () {
                NavigatorService.to.pushNamedAndRemoveUntil(AuthPage.routeName);
              },
              child: Container(
                height: 40.h,
                width: 40.w,
                child: Icon(Icons.chevron_right, color: Colors.white, size: 35),
                decoration: BoxDecoration(
                    color: Color(0xFF0BBF90),
                    borderRadius: BorderRadius.circular(25.0)),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
