import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/intro_page_bloc/intro_cubit.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/auth_page/auth_page.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/bloc/intro_page_bloc/intro_state.dart';
import '../../login_page/custom_shape.dart';

Widget viewOfOnePage(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      AppWidgets.textLocale(
        text: LocaleKeys.skip,
        color: AppColorUtils.textGreen,
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
        textAlign: TextAlign.center,
      ),
      GestureDetector(
        onTap: () {
          context.read<IntroCubit>().pageController.nextPage(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOutQuart);
        },
        child: Container(
          height: 40.w,
          width: 40.w,
          decoration: BoxDecoration(
              color: AppColorUtils.percentColor,
              borderRadius: BorderRadius.circular(25.0)),
          child:
              Icon(Icons.chevron_right, color: AppColorUtils.white, size: 34.w),
        ),
      ),
    ],
  );
}

Widget viewOfTwoPage(BuildContext context, IntroPageNextState state) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      AppWidgets.textLocale(
        text: LocaleKeys.skip,
        color: AppColorUtils.textGreen,
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
        textAlign: TextAlign.center,
      ),
      Row(
        children: [
          GestureDetector(
            onTap: () {
              context.read<IntroCubit>().pageController.animateToPage(
                  state.currentIndex - 1,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOutQuart);
            },
            child: Container(
              height: 40.w,
              width: 40.w,
              decoration: BoxDecoration(
                  color: AppColorUtils.percentColor,
                  borderRadius: BorderRadius.circular(25.0)),
              child: Icon(Icons.chevron_left,
                  color: AppColorUtils.white, size: 34.w),
            ).paddingOnly(right: 15.w),
          ),
          GestureDetector(
            onTap: () {
              context.read<IntroCubit>().pageController.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOutQuart);
            },
            child: Container(
              height: 40.w,
              width: 40.w,
              decoration: BoxDecoration(
                  color: AppColorUtils.percentColor,
                  borderRadius: BorderRadius.circular(25.0)),
              child: Icon(Icons.chevron_right,
                  color: AppColorUtils.white, size: 34.w),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget viewOfThreePage(BuildContext context, IntroPageNextState state) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GestureDetector(
        onTap: () {
          context.read<IntroCubit>().pageController.animateToPage(
              state.currentIndex - 1,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOutQuart);
        },
        child: Container(
          height: 40.w,
          width: 40.w,
          decoration: BoxDecoration(
              color: AppColorUtils.percentColor,
              borderRadius: BorderRadius.circular(25.0)),
          child:
              Icon(Icons.chevron_left, color: AppColorUtils.white, size: 34.w),
        ),
      ),
      Row(
        children: [
          AppWidgets.textLocale(
            text: LocaleKeys.str_registration,
            color: AppColorUtils.textGreen,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ).paddingOnly(right: 15.w),
          GestureDetector(
            onTap: () {
              NavigatorService.to.pushNamedAndRemoveUntil(AuthPage.routeName);
            },
            child: Container(
              height: 40.w,
              width: 40.w,
              decoration: BoxDecoration(
                  color: AppColorUtils.greenApp,
                  borderRadius: BorderRadius.circular(25.0)),
              child: Icon(Icons.chevron_right,
                  color: AppColorUtils.white, size: 34.w),
            ),
          ),
        ],
      ),
    ],
  );
}

class IntroClipPathWidget extends StatelessWidget {
  final double height;

  const IntroClipPathWidget({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomShape(),
      child: Container(
        width: context.width,
        height: height,
        color: AppColorUtils.greenIntro,
      ),
    );
  }
}
