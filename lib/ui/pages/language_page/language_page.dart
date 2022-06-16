import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/bloc/app_page_cubit/app_page_cubit.dart';
import 'package:najot/data/bloc/language_cubit/language_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../intro_page/intro_page.dart';

class LanguagePage extends StatefulWidget {
  LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  // LanguageCubit cubit = LanguageCubit();

  int val = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LanguageCubit, LanguageState>(
        bloc:LanguageCubit.to,
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppWidgets.text(
                  color: AppColorUtils.BLACK,
                  text: "Выберите язык / Tilni tanlang / Choose language",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  maxLines: 2,
                ).paddingOnly(bottom: 25.w),
                GestureDetector(
                  onTap: (){
                    LanguageCubit.to.change(Locale('uz', 'UZ'));
                    setState(() {
                      val = 1;
                    });
                  },
                  child: Container(
                    height: 44.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColorUtils.LANG_BACK),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(AppImageUtils.UZ_FLAG),
                            SizedBox(
                              width: 12.w,
                            ),
                            AppWidgets.text(
                                text: "O'zbek tili",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColorUtils.DARK2)
                          ],
                        ),
                        Radio(
                          value: 1,
                          groupValue: val,
                          activeColor: AppColorUtils.PERCENT_COLOR,
                          onChanged: (value) {
                            LanguageCubit.to.change(Locale('uz', 'UZ'));
                            setState(() {
                              val = 1;
                            });
                          },
                        )
                      ],
                    ),
                  ).paddingOnly(bottom: 18.w),
                ),
                GestureDetector(
                  onTap: (){
                    LanguageCubit.to.change(Locale('ru', 'RU'));
                    setState(() {
                      val = 2;
                    });
                  },
                  child: Container(
                    height: 44.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColorUtils.LANG_BACK),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(AppImageUtils.RUS_FLAG),
                            SizedBox(
                              width: 12.w,
                            ),
                            AppWidgets.text(
                                text: "Русский язык",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColorUtils.DARK2,
                            )
                          ],
                        ),
                        Radio(
                          value: 2,
                          groupValue: val,
                          activeColor: AppColorUtils.PERCENT_COLOR,
                          onChanged: (value) {
                            LanguageCubit.to.change(Locale('ru', 'RU'));
                            setState(() {
                              val = 2;
                            });
                          },
                        ),
                      ],
                    ),
                  ).paddingOnly(bottom: 24.w),
                ),
                GestureDetector(
                  onTap: () {
                    if (val != 0) {
                      // NavigatorService.to.pushNamed(IntroPage.routeName);
                      NavigatorService.to.pushNamed(
                        IntroPage.routeName,
                      );
                    }
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
                      color: val == 0
                          ? AppColorUtils.DIVIDER_COLOR
                          : AppColorUtils.PERCENT_COLOR,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
