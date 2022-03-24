import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profil_update_bloc.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profil_update_bloc.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profil_update_state.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profile_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/ui/widgets/app_text_field.dart';

import '../../../../data/bloc/my_profile_bloc/my_profil_update_bloc.dart';
import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_widgets.dart';
import '../my_profile_widget/app_disable_text_field.dart';
import '../my_profile_widget/number_update_step1_page.dart';
import '../my_profile_widget/number_update_step2_page.dart';

class NumberUpdatePage extends StatelessWidget {
  static const String routeName = "/numberUpdatePage";

  NumberUpdatePage({Key? key}) : super(key: key);
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MyProfileUpdateBloc()..add(MyProfileLoad()),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColorUtils.WHITE,
          body: BlocBuilder<MyProfileUpdateBloc, MyProfileUpdateState>(
              builder: (context, state) {
            return Column(
              children: [
                Container(
                  color: Color(0xFFF6FCFA),
                  height: 80,
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: SvgPicture.asset(AppImageUtils.MENU),
                        onTap: () {},
                      ),
                      AppWidgets.textLocale(
                        text: LocaleKeys.edit_my_profile,
                        fontSize: 23.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF414042),
                      ),
                      InkWell(
                        child: SvgPicture.asset(AppImageUtils.REMOVE),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      width: 375.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColorUtils.WHITE,
                      ),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppDisableTextField(
                                isFill: false,
                                hintText: context.read<MyProfileUpdateBloc>().state.phoneNumber,
                                onChanged: (v) {

                                },
                                title: LocaleKeys.phone_number,
                              ).paddingOnly(bottom: 23.h, top: 20.h, left: 20,right: 20),
                              AppTextField(
                                isFill: context.read<MyProfileUpdateBloc>().state.phoneNumberFill,
                                hintText: "+998",
                                onChanged: (v) {
                                  context.read<MyProfileUpdateBloc>().add(PhoneChanged(v));
                                },
                                title: LocaleKeys.new_phone_number,
                              ).paddingOnly(bottom: 23.h),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                SizedBox(height: 8.h),
                                InkWell(
                                  onTap: () {
                                    context.read<MyProfileUpdateBloc>().add(SendCode());
                                  },
                                  child:
                                  // state.isVisibled ?
                                  Visibility(
                                          visible: isVisible,
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                top: 10,
                                                bottom: 13,
                                                right: 10,
                                                left: 10),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: Color(0xFF1F6ADE),
                                            ),
                                            child: AppWidgets.textLocale(
                                                text: LocaleKeys.send_code,
                                                textAlign: TextAlign.center,
                                                color: Color(0xFFFFFFFF),
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )
                                       // NumberUpdateStep1(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
