import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profil_update_bloc.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profil_update_state.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/user.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/ui/widgets/app_text_field.dart';

import '../../../../data/bloc/my_profile_bloc/my_profil_update_bloc.dart';
import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_widgets.dart';
import '../my_profile_widget/app_disable_text_field.dart';
import '../my_profile_widget/number_update_step1_page.dart';

class NumberUpdatePage extends StatelessWidget {
  static const String routeName = "/numberUpdatePage";

  NumberUpdatePage({Key? key}) : super(key: key);
  bool isVisible = true;
  User? user = HiveService.to.getUser();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          MyProfileUpdateBloc()..add(MyProfileLoad()),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColorUtils.WHITE,
          body: BlocBuilder<MyProfileUpdateBloc, MyProfileUpdateState>(
              builder: (context, state) {
            return Column(
              children: [
                Container(
                  color: AppColorUtils.BACKGROUND,
                  child: AppWidgets.appBarMenu(
                    title: LocaleKeys.edit_my_profile.tr(),
                    onTapMenu: () {},
                    visibleIcon: true,
                    onTapIcon: () {
                      Navigator.of(context).pop();
                    },
                    icon: AppImageUtils.REMOVE,
                  ),
                ).paddingOnly(top: 10),
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
                                hintText: user == null
                                    ? user.toString()
                                    : user!.phone.toString(),
                                onChanged: (v) {},
                                title: LocaleKeys.phone_number,
                              ).paddingOnly(
                                bottom: 23.h,
                                top: 20.h,
                              ),
                              AppTextField(
                                isFill: context
                                    .read<MyProfileUpdateBloc>()
                                    .state
                                    .phoneNumberFill,
                                initialText: context
                                    .read<MyProfileUpdateBloc>()
                                    .state
                                    .phoneNumber,
                                hintText: "+998",
                                onChanged: (v) {
                                  context
                                      .read<MyProfileUpdateBloc>()
                                      .add(PhoneChanged(v));
                                },
                                title: LocaleKeys.new_phone_number,
                              ).paddingOnly(bottom: 23.h),
                            ],
                          ).paddingOnly(
                            left: 20.w,
                            right: 20.w,
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
                                    context
                                        .read<MyProfileUpdateBloc>()
                                        .add(SendCode());
                                  },
                                  child: context
                                          .read<MyProfileUpdateBloc>()
                                          .state
                                          .isVisible
                                      ? Visibility(
                                          visible: context
                                              .read<MyProfileUpdateBloc>()
                                              .state
                                              .isVisible,
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
                                                color: AppColorUtils.WHITE,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w600,),
                                          ),
                                        )
                                      : NumberUpdateStep1(),
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
