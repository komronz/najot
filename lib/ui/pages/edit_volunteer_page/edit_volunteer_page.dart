import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/bloc/edit_volunteer_bloc/edit_volunteer_bloc.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/edit_volunteer_page/widgets/number_update_volunteer_page.dart';
import 'package:najot/ui/pages/edit_volunteer_page/widgets/user_update_volunteer_page.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_widget/app_disable_text_field.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_widget/show_picker_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../data/services/navigator_service.dart';
import '../my_profil_page/my_profile_pages/user_degree_page.dart';

class EditVolunteerPage extends StatelessWidget {
  const EditVolunteerPage({Key? key}) : super(key: key);

  static const String routeName = "/editVolunteerPage";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditVolunteerBloc()..add(const MyProfileLoad()),
      child: BlocConsumer<EditVolunteerBloc, EditVolunteerState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.changePage == 1) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColorUtils.background,
                titleSpacing: 0,
                elevation: 0,
                automaticallyImplyLeading: false,
                title: Container(
                  color: AppColorUtils.waitColor,
                  child: AppWidgets.appBarMenu(
                    title: LocaleKeys.my_profile.tr(),
                    onTapMenu: () {
                      HomePage.globalKey.currentState!.openDrawer();
                    },
                    visibleIcon: true,
                    onTapIcon: () {
                      context
                          .read<EditVolunteerBloc>()
                          .add(const EditProfileChangePage(2));
                    },
                    icon: AppImageUtils.edit,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 19,
                    right: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColorUtils.white,
                  ),
                  child: Column(
                    children: [
                      const ShowPickerWidget(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppWidgets.textLocale(
                            text: LocaleKeys.degree,
                            textAlign: TextAlign.center,
                            fontSize: 12.sp,
                            color: AppColorUtils.gray4,
                            fontWeight: FontWeight.w400,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                              top: 1,
                              bottom: 1,
                              left: 5.w,
                            ),
                            child: InkWell(
                              onTap: () {
                                NavigatorService.to
                                    .pushNamed(UserDegreePage.routeName);
                              },
                              child: SvgPicture.asset(
                                AppImageUtils.faq,
                                color: AppColorUtils.green1,
                              ),
                            ),
                          ),
                        ],
                      ).paddingOnly(bottom: 6.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppImageUtils.hands),
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            child: AppWidgets.textLocale(
                                text: LocaleKeys.volunteer,
                                color: AppColorUtils.textGreen,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ).paddingOnly(bottom: 24.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppWidgets.textLocale(
                                      text: LocaleKeys.phone_number,
                                      color: AppColorUtils.dark4,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400)
                                  .paddingOnly(bottom: 8.w),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 283.w,
                                    padding: const EdgeInsets.only(left: 18),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: AppColorUtils.green9,
                                      border: Border.all(
                                        width: 1,
                                        color: AppColorUtils.border,
                                      ),
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        enabled: false,
                                        hintText: state.phoneNumber,
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                          color: AppColorUtils.regText,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      context
                                          .read<EditVolunteerBloc>()
                                          .add(const EditProfileChangePage(3));
                                    },
                                    child: SizedBox(
                                      height: 33.w,
                                      width: 33.w,
                                      child: AppWidgets.imageSvg(
                                        path: AppImageUtils.edit,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 2,
                            color: AppColorUtils.green8,
                          ).paddingSymmetric(vertical: 24.w),
                          AppDisableTextField(
                            isFill: false,
                            hintText:
                                context.read<EditVolunteerBloc>().state.name,
                            onChanged: (v) {},
                            title: LocaleKeys.name.tr(),
                          ).paddingOnly(bottom: 23.w),
                          AppDisableTextField(
                            isFill: false,
                            hintText: context
                                .read<EditVolunteerBloc>()
                                .state
                                .sureName,
                            onChanged: (v) {},
                            title: LocaleKeys.surname.tr(),
                          ).paddingOnly(bottom: 23.w),
                          AppWidgets.textLocale(
                            text: LocaleKeys.gender,
                            color: AppColorUtils.dark4,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ).paddingOnly(bottom: 10.w),
                          Row(
                            children: [
                              Container(
                                height: 48.h,
                                decoration: BoxDecoration(
                                  color: AppColorUtils.regBack,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: AppColorUtils.border,
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Radio(
                                      activeColor: AppColorUtils.border,
                                      value: 1,
                                      groupValue: 1,
                                      onChanged: (v) {},
                                    ),
                                    AppWidgets.textLocale(
                                      text: LocaleKeys.man,
                                      color: AppColorUtils.regText,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ).paddingOnly(right: 18.w),
                              ),
                              Container(
                                height: 48.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColorUtils.regBack,
                                  border: Border.all(
                                    color: AppColorUtils.border,
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Radio(
                                      fillColor: MaterialStateColor.resolveWith(
                                          (states) => AppColorUtils.border),
                                      value: 2,
                                      groupValue: 0,
                                      onChanged: (v) {},
                                    ),
                                    AppWidgets.textLocale(
                                      text: LocaleKeys.woman,
                                      color: AppColorUtils.regText,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ).paddingOnly(right: 18.w),
                              ).paddingOnly(left: 20),
                            ],
                          ).paddingOnly(bottom: 23.w),
                          AppDisableTextField(
                            isFill: false,
                            hintText: "25.08.2022",
                            onChanged: (v) {},
                            title: LocaleKeys.date_of_birth.tr(),
                          ).paddingOnly(bottom: 23.w),
                          AppDisableTextField(
                            isFill: false,
                            hintText: "Farg'ona shahar, Farg'ona viloyati dsfd",
                            onChanged: (v) {},
                            title: LocaleKeys.address.tr(),
                          ).paddingOnly(bottom: 23.w),
                        ],
                      ).paddingOnly(bottom: 24.h),
                    ],
                  ),
                ),
              ),
            );
          } else if (state.changePage == 2) {
            return const UserUpdateVolunteerPage();
          } else {
            return const NumberUpdateVolunteerPage();
          }
        },
      ),
    );
  }
}
