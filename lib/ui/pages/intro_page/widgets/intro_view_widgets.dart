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
import 'package:najot/ui/widgets/app_widgets.dart';
import '../../../../data/bloc/intro_page_bloc/intro_state.dart';

Widget viewOfOnePage(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Material(
        color: AppColorUtils.GREEN_APP,
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
          onTap: () {
            NavigatorService.to.pushNamedAndRemoveUntil(AuthPage.routeName);
          },
          borderRadius: BorderRadius.circular(12.0),
          child: Ink(
            width: 260,
            height: 50,
            decoration: BoxDecoration(
              color: AppColorUtils.GREEN_APP,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppWidgets.textLocale(
                    textAlign: TextAlign.center,
                    text: LocaleKeys.str_registration.tr(),
                    color: AppColorUtils.WHITE,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],

    ///CTAU
    ///
    // AppWidgets.textLocale(
    //   text: LocaleKeys.skip,
    //   color: AppColorUtils.TEXT_GREEN,
    //   fontSize: 13.sp,
    //   fontWeight: FontWeight.w400,
    //   textAlign: TextAlign.center,
    // ),

    // GestureDetector(
    //   onTap: () {
    //     NavigatorService.to.pushNamedAndRemoveUntil(AuthPage.routeName);

    ///Change this
    ///
    // context.read<IntroCubit>().pageController.nextPage(
    //       duration: Duration(milliseconds: 400),
    //       curve: Curves.easeInOutQuart,
    //     );
    // },
    //     child: Container(
    //       height: 40.w,
    //       width: 40.w,
    //       child: Icon(
    //         Icons.chevron_right,
    //         color: AppColorUtils.WHITE,
    //         size: 34.w,
    //       ),
    //       decoration: BoxDecoration(
    //           color: AppColorUtils.PERCENT_COLOR,
    //           borderRadius: BorderRadius.circular(25.0)),
    //     ),
    //   ),
  );
}

Widget viewOfTwoPage(
  BuildContext context,
  IntroPageNextState state,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      AppWidgets.textLocale(
        text: LocaleKeys.skip,
        color: AppColorUtils.TEXT_GREEN,
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
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeInOutQuart,
                  );
            },
            child: Container(
              height: 40.w,
              width: 40.w,
              child: Icon(Icons.chevron_left,
                  color: AppColorUtils.WHITE, size: 34.w),
              decoration: BoxDecoration(
                  color: AppColorUtils.PERCENT_COLOR,
                  borderRadius: BorderRadius.circular(25.0)),
            ).paddingOnly(right: 15.w),
          ),
          GestureDetector(
            onTap: () {
              context.read<IntroCubit>().pageController.nextPage(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeInOutQuart,
                  );
            },
            child: Container(
              height: 40.w,
              width: 40.w,
              child: Icon(
                Icons.chevron_right,
                color: AppColorUtils.WHITE,
                size: 34.w,
              ),
              decoration: BoxDecoration(
                  color: AppColorUtils.PERCENT_COLOR,
                  borderRadius: BorderRadius.circular(25.0)),
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
                duration: Duration(milliseconds: 400),
                curve: Curves.easeInOutQuart,
              );
        },
        child: Container(
          height: 40.w,
          width: 40.w,
          child: Icon(
            Icons.chevron_left,
            color: AppColorUtils.WHITE,
            size: 34.w,
          ),
          decoration: BoxDecoration(
            color: AppColorUtils.PERCENT_COLOR,
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
      Row(
        children: [
          AppWidgets.textLocale(
            text: LocaleKeys.str_registration,
            color: AppColorUtils.TEXT_GREEN,
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
              child: Icon(
                Icons.chevron_right,
                color: AppColorUtils.WHITE,
                size: 34.w,
              ),
              decoration: BoxDecoration(
                color: AppColorUtils.GREEN_APP,
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
