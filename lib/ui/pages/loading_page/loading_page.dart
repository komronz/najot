import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/styles/app_colors.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class LoadingPage extends StatelessWidget {
  static const String routeName = "/loadingPage";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 15.0,
            sigmaY: 15.0,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: AppColors.MAIN,
                ),
                AppWidgets.textLocale(
                  text: LocaleKeys.please_wait.tr(),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.BLACK,
                ).paddingOnly(top: 14.w),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
