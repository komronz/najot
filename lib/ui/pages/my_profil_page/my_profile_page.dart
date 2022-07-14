import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profil_update_bloc.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profil_update_state.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_widget/app_disable_text_field.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_widget/profile_delete_dialog.dart';

import '../../../data/localization/locale_keys.g.dart';
import '../../../data/services/navigator_service.dart';
import '../../../data/utils/app_color_utils.dart';
import '../../../data/utils/app_image_utils.dart';
import '../../widgets/app_widgets.dart';
import '../edit_volunteer_page/widgets/choose_lang.dart';
import '../home_page/home_page.dart';
import 'my_profile_pages/number_update_page.dart';
import 'my_profile_pages/user_degree_page.dart';
import 'my_profile_pages/user_update_page.dart';
import 'my_profile_widget/my_profile_radio_button.dart';

class MyProfilePage extends StatelessWidget {
  static const String routeName = "/myProfilePage";

  MyProfilePage({Key? key}) : super(key: key);
  MyProfileUpdateBloc myProfileUpdateBloc=MyProfileUpdateBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => myProfileUpdateBloc..add(MyProfileLoad()),
      child: BlocConsumer<MyProfileUpdateBloc, MyProfileUpdateState>(
        bloc: myProfileUpdateBloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state.changePage == 1) {
              return Scaffold(
                body: Column(
                  children: [
                    AppWidgets.appBarMenu(
                      title: LocaleKeys.my_profile,
                      onTapMenu: () {
                        HomePage.globalKey.currentState!.openDrawer();
                      },
                      visibleIcon: true,
                      onTapIcon: () {
                        context
                            .read<MyProfileUpdateBloc>()
                            .add(EditProfileChangePage(2));
                        // NavigatorService.to.pushNamed(UserUpdatePage.routeName,
                        //     arguments: context.read<MyProfileUpdateBloc>());
                        // NavigatorService.to.pushNamedAndRemoveUntil(
                        //   HomePage.routeName,
                        //   arguments: AppPageType.USER_UPDATE,
                        // );
                      },
                      icon: AppImageUtils.EDIT,
                    ).paddingOnly(top: 10),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 19,
                            right: 20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColorUtils.WHITE,
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: 107.w,
                                height: 107.h,
                                child: SvgPicture.asset(AppImageUtils.USER),
                              ).paddingOnly(
                                top: 25.h,
                                bottom: 12.h,
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AppWidgets.textLocale(
                                      text: LocaleKeys.degree,
                                      textAlign: TextAlign.center,
                                      fontSize: 12.sp,
                                      color: AppColorUtils.GRAY_4,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.only(top: 1, bottom: 1),
                                      child: InkWell(
                                        onTap: () {
                                          NavigatorService.to.pushNamed(
                                              UserDegreePage.routeName);
                                        },
                                        child: SvgPicture.asset(
                                          AppImageUtils.FAQ,
                                          color: AppColorUtils.WHITE_GREEN8,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ).paddingOnly(bottom: 6.h),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(AppImageUtils.PERSON),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: AppWidgets.textLocale(
                                          text: LocaleKeys.normal_user,
                                          color: AppColorUtils.TEXT_BLUE,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              ).paddingOnly(bottom: 24.h),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppDisableTextField(
                                      isFill: false,
                                      hintText: context
                                          .read<MyProfileUpdateBloc>()
                                          .state
                                          .name,
                                      onChanged: (v) {},
                                      title: LocaleKeys.name.tr(),
                                    ).paddingOnly(bottom: 23.h),
                                    AppDisableTextField(
                                      isFill: false,
                                      hintText: context.read<MyProfileUpdateBloc>().state.sureName,
                                      onChanged: (v) {},
                                      title: LocaleKeys.surname.tr(),
                                    ).paddingOnly(bottom: 23.h),
                                    MyProfileRadioButton(
                                      initial: context
                                          .read<MyProfileUpdateBloc>()
                                          .state
                                          .gender??"",
                                    ).paddingOnly(top: 20),
                                  ],
                                ),
                              ).paddingOnly(bottom: 24.h),
                              Divider(
                                thickness: 2,
                                color: AppColorUtils.GREEN_8,
                              ).paddingOnly(bottom: 24.h),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppWidgets.textLocale(
                                            text: LocaleKeys.phone_number,
                                            color: AppColorUtils.DARK_4,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w400)
                                        .paddingOnly(bottom: 8.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            width: 283.w,
                                            padding: EdgeInsets.only(left: 18),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              color: AppColorUtils.GREEN_9,
                                              border: Border.all(
                                                width: 1,
                                                color: AppColorUtils.BORDER,
                                              ),
                                            ),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                enabled: false,
                                                hintText: context
                                                    .read<MyProfileUpdateBloc>()
                                                    .state
                                                    .phoneNumber,
                                                border: InputBorder.none,
                                                hintStyle: TextStyle(
                                                  color: AppColorUtils.GRAY_4,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            context
                                                .read<MyProfileUpdateBloc>()
                                                .add(EditProfileChangePage(3));
                                          },
                                          child: Container(
                                            height: 33.w,
                                            width: 33.w,
                                            child: AppWidgets.imageSvg(
                                              path: AppImageUtils.EDIT,
                                            ),
                                          ).paddingOnly(left: 10.w),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 2,
                                color: AppColorUtils.GREEN_8,
                              ).paddingOnly(
                                bottom: 24.w,
                                top: 24.w,
                              ),
                              AppWidgets.selectLangWidget(
                                context,
                                () {
                                  NavigatorService.to
                                      .pushNamed(ChooseLangPage.routeName);
                                },
                              ),
                              AppWidgets.deleteProfile(
                                context,
                                    () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return ProfileDeleteDialog(
                                            myProfileUpdateBloc: myProfileUpdateBloc,
                                          );
                                        },
                                      );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state.changePage == 2) {
              return UserUpdatePage(bloc: MyProfileUpdateBloc());
            } else {
              return NumberUpdatePage();
            }
          }),
    );
  }
}
