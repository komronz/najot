import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/intro_page_bloc/intro_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/auth_page/auth_page.dart';

import '../../../../data/bloc/intro_page_bloc/intro_state.dart';

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
              LocaleKeys.skip.tr(),
              style: TextStyle(
                  color: AppColorUtils.TEXT_GREEN,
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
              height: 40.w,
              width: 40.w,
              child: Icon(Icons.chevron_right, color: Colors.white, size: 35),
              decoration: BoxDecoration(
                  color: Color(0xFF0BBF90),
                  borderRadius: BorderRadius.circular(25.0)),
            ),
          ),
        ]),
  ).paddingOnly(bottom: 35.w);
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
            LocaleKeys.skip.tr(),
            style: const TextStyle(
                color: AppColorUtils.TEXT_GREEN,
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
                height: 40.w,
                width: 40.w,
                child: Icon(Icons.chevron_left, color: Colors.white, size: 35),
                decoration: BoxDecoration(
                    color: AppColorUtils.GREEN_APP,
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
                height: 40.w,
                width: 40.w,
                child: Icon(Icons.chevron_right, color: Colors.white, size: 35),
                decoration: BoxDecoration(
                    color: AppColorUtils.GREEN_APP,
                    borderRadius: BorderRadius.circular(25.0)),
              ),
            ),
          ],
        ),
      ],
    ),
  ).paddingOnly(bottom: 35.w);
}

Widget viewOfThreePage(BuildContext context, IntroPageNextState state) {
  return Container(
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
            height: 40.w,
            width: 40.w,
            child: Icon(Icons.chevron_left, color: Colors.white, size: 35),
            decoration: BoxDecoration(
                color: AppColorUtils.GREEN_APP,
                borderRadius: BorderRadius.circular(25.0)),
          ),
        ),
        Row(
          children: [
            Container(
              child: Text(
                LocaleKeys.str_registration.tr(),
                style: const TextStyle(
                    color: AppColorUtils.TEXT_GREEN,
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
                height: 40.w,
                width: 40.w,
                child: Icon(Icons.chevron_right, color: Colors.white, size: 35,),
                decoration: BoxDecoration(
                    color: AppColorUtils.GREEN_APP,
                    borderRadius: BorderRadius.circular(25.0)),
              ),
            ),
          ],
        ),
      ],
    ),
  ).paddingOnly(bottom: 35.w);
}
