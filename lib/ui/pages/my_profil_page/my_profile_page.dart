import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profil_update_bloc.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profil_update_state.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/ui/pages/language_page/choose_lang.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_widget/app_disable_text_field.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_widget/profile_delete_dialog.dart';
import '../../../data/localization/locale_keys.g.dart';
import '../../../data/services/navigator_service.dart';
import '../../../data/utils/app_color_utils.dart';
import '../../../data/utils/app_image_utils.dart';
import '../../widgets/app_widgets.dart';
import '../home_page/home_page.dart';
import 'my_profile_pages/number_update_page.dart';
import 'my_profile_pages/user_update_page.dart';
import 'my_profile_widget/my_radio_button_static.dart';

class MyProfilePage extends StatelessWidget {
  static const String routeName = "/myProfilePage";

  MyProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyProfileUpdateBloc()..add(MyProfileLoad()),
      child: BlocConsumer<MyProfileUpdateBloc, MyProfileUpdateState>(
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
                              width: 130.w,
                              height: 130.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: CachedNetworkImage(
                                  placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  imageUrl: state.imageUrl,
                                  errorWidget: (context, url, error) =>
                                      SvgPicture.asset(AppImageUtils.USER),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ).paddingOnly(
                              top: 25.h,
                              bottom: 12.h,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppWidgets.textLocale(
                                    text: LocaleKeys.degree.tr() + ":",
                                    textAlign: TextAlign.center,
                                    fontSize: 15.sp,
                                    color: AppColorUtils.GRAY_4,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  // Container(
                                  //   padding: EdgeInsets.only(top: 1, bottom: 1),
                                  //   child: InkWell(
                                  //     onTap: () {
                                        // NavigatorService.to.pushNamed(
                                        //   UserDegreePage.routeName,
                                        // );
                                  //     },
                                  //     child: SvgPicture.asset(
                                  //       AppImageUtils.FAQ,
                                  //       color: AppColorUtils.WHITE_GREEN8,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ).paddingOnly(bottom: 6.h),
                            state.isVolunteer
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(AppImageUtils.HANDS),
                                      Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: AppWidgets.textLocale(
                                          text: LocaleKeys.volunteer,
                                          color: AppColorUtils.TEXT_GREEN,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  )
                                : Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          AppImageUtils.PERSON,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: AppWidgets.textLocale(
                                            text: LocaleKeys.normal_user,
                                            color: AppColorUtils.TEXT_BLUE,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    ),
                                  ).paddingOnly(bottom: 24.h),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppWidgets.textLocale(
                                    text: LocaleKeys.phone_number,
                                    color: AppColorUtils.DARK_4,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                  ).paddingOnly(bottom: 8.h),
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
                                              hintText: state.phone,
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
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppDisableTextField(
                                    isFill: false,
                                    hintText: state.firstName,
                                    onChanged: (v) {},
                                    title: LocaleKeys.name.tr(),
                                  ).paddingOnly(bottom: 23.h),
                                  AppDisableTextField(
                                    isFill: false,
                                    hintText: state.lastName,
                                    onChanged: (v) {},
                                    title: LocaleKeys.surname.tr(),
                                  ).paddingOnly(bottom: 23.h),
                                  state.gender != null ? MyRadioButtonStatic(
                                    initial: state.gender ?? "",
                                  ).paddingOnly(top: 20) : SizedBox(),
                                ],
                              ),
                            ).paddingOnly(bottom: 24.h),
                            Divider(
                              thickness: 2,
                              color: AppColorUtils.GREEN_8,
                            ).paddingOnly(bottom: 24.h),
                            AppWidgets.deleteProfile(
                              context,
                              () {
                                showDialog(
                                  context: context,
                                  builder: (con) {
                                    return ProfileDeleteDialog(
                                      myProfileUpdateBloc:
                                          context.read<MyProfileUpdateBloc>(),
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
            return UserUpdatePage(bloc: context.read<MyProfileUpdateBloc>());
          } else {
            return NumberUpdatePage(bloc: context.read<MyProfileUpdateBloc>());
          }
        },
      ),
    );
  }
}
