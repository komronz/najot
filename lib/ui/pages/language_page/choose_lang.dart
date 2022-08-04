

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/bloc/language_cubit/language_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';

import '../../../../data/services/navigator_service.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../widgets/app_bar_with_title.dart';
import '../../widgets/app_widgets.dart';

class ChooseLangPage extends StatefulWidget {
  const ChooseLangPage({Key? key}) : super(key: key);
  static const String routeName = "/chooseLangPage";

  @override
  State<ChooseLangPage> createState() => _ChooseLangPageState();
}

class _ChooseLangPageState extends State<ChooseLangPage> {

  @override
  Widget build(BuildContext context) {

    int val= context.locale==Locale('uz','UZ')?1:2;

    return Scaffold(
      appBar: AppBarWithTitle(
        title: LocaleKeys.language.tr(),
        onPress: () {
          Navigator.pop(context);
        },
      ),
      body: BlocBuilder<LanguageCubit,LanguageState>(
        bloc: LanguageCubit.to,
        builder: (context,state){
          return Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
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
              ],
            ),

          );
        },
      ),
    );
  }
}
