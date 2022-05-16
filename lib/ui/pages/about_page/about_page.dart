import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/bloc/applied_bloc/appeal_bloc.dart';
import 'package:najot/data/config/const/decoration_const.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/pages/notification_page/notification_page.dart';
import 'package:najot/ui/widgets/app_text_field.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import 'edit_show_success.dart';

class AboutPage extends StatelessWidget {
  static const String routeName = '/aboutPage';

  AboutPage({Key? key}) : super(key: key);
  AppealBloc appealBloc = AppealBloc();
  Key _key=Key("");

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appealBloc,
      child: Scaffold(
        key: UniqueKey(),
      backgroundColor: AppColorUtils.BACKGROUND,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              child: SvgPicture.asset(
                AppImageUtils.MENU,
                height: 35.w,
                width: 35.w,
              ),
              onTap: () {
                HomePage.globalKey.currentState!.openDrawer();
              },
            ),
            AppWidgets.textLocale(
              text: LocaleKeys.about_us,
              fontSize: 26.sp,
              fontWeight: FontWeight.w600,
            ),
            InkWell(
              onTap: () {
                NavigatorService.to.pushNamed(
                  NotificationPage.routeName,
                );
              },
              child: SvgPicture.asset(
                AppImageUtils.NOTIFICATION,
                height: 35.w,
                width: 35.w,
                fit: BoxFit.fill,
              ),
            )
          ],
        ).paddingSymmetric(horizontal: 20),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppWidgets.imageAsset(
              path: AppImageUtils.IMG_ABOUT,
              width: context.width,
            ).paddingOnly(top: 30, left: 20, right: 20),
            AppWidgets.text(
              text:
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              maxLines: 100,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: AppColorUtils.DARK3,
              height: 1.5,
            ).paddingSymmetric(horizontal: 20, vertical: 9),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppWidgets.imageSvg(path: AppImageUtils.IC_LOCATION),
                Expanded(
                  child: AppWidgets.text(
                    textAlign: TextAlign.start,
                    text:
                    "Toshkent viloyati, Toshkent Shahar, Yunusobod Tumani, Alisher novoiy ko’chasi 4",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                    color: AppColorUtils.KRAUDFANDING,
                    maxLines: 10,
                  ).paddingOnly(left: 8),
                )
              ],
            ).paddingSymmetric(horizontal: 20, vertical: 9),
            Row(
              children: [
                AppWidgets.imageSvg(path: AppImageUtils.IC_PHONE),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppWidgets.text(
                      textAlign: TextAlign.start,
                      text: "998 99 999 99 99",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                      color: AppColorUtils.KRAUDFANDING,
                      maxLines: 10,
                    ),
                    AppWidgets.text(
                      textAlign: TextAlign.start,
                      text: "998 99 999 99 99",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                      color: AppColorUtils.KRAUDFANDING,
                      maxLines: 10,
                    ),
                  ],
                ).paddingOnly(left: 8)
              ],
            ).paddingSymmetric(horizontal: 20, vertical: 9),
            BlocBuilder<AppealBloc, AppealState>(
              bloc: appealBloc,
              builder: (context, state) {
                return Container(
                  width: context.width,
                  decoration: DecorationConst.DEC_WITH_SHADOW,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidgets.text(
                        text: LocaleKeys.contact_us.tr(),
                        fontWeight: FontWeight.w600,
                        fontSize: 22.sp,
                        color: AppColorUtils.DARK2,
                      ).paddingOnly(top: 24),
                      AppTextField(
                        isFill:
                        context
                            .read<AppealBloc>()
                            .state
                            .firstNameFill,
                        hintText: "(abdumalik)",
                        key: _key,
                        initialText: state.name,
                        onChanged: (v) {
                          context
                              .read<AppealBloc>()
                              .add(AppealNameChanged(v));
                        },
                        title: LocaleKeys.name.tr(),
                      ).paddingOnly(top: 18),
                      AppTextField(
                        textInputType: TextInputType.phone,
                        isFill: context
                            .read<AppealBloc>()
                            .state
                            .phoneFill,
                        hintText: "+998",
                        inputFormatter:
                        context
                            .read<AppealBloc>()
                            .phoneNumberFormatter,
                        initialText: state.phoneNumber,
                        key: _key,
                        onChanged: (v) {
                          context
                              .read<AppealBloc>()
                              .add(AppealPhoneChanged(v));
                        },
                        title: LocaleKeys.phone_number.tr(),
                      ).paddingOnly(top: 18),
                      AppTextField(
                        isFill: context
                            .read<AppealBloc>()
                            .state
                            .applyFill,
                        isMultiLine: true,
                        height: 154.w,
                        initialText: state.content,
                        key: _key,
                        hintText: LocaleKeys.write_your_application.tr(),
                        onChanged: (v) {
                          context
                              .read<AppealBloc>()
                              .add(AppealTextChanged(v));
                        },
                        textInputType: TextInputType.multiline,
                        title: LocaleKeys.your_application.tr(),
                      ).paddingOnly(top: 18),
                      AppWidgets.appButton(
                        title: LocaleKeys.str_registration.tr(),
                        onTap: () async {
                          _key=UniqueKey();
                          await showDialog(
                              context: context,
                              builder: (context) =>
                                  EditShowSuccessSend(
                                    appealBloc: appealBloc,
                                  ),
                          );
                        },
                        textColor: Colors.white,
                        color:
                        context
                            .read<AppealBloc>()
                            .state
                            .isNextBtnActive
                            ? AppColorUtils.PERCENT_COLOR
                            : AppColorUtils.GREEN_BTN,
                      ).paddingSymmetric(vertical: 25),
                    ],
                  ).paddingOnly(
                    left: 20,
                    right: 20,
                  ),
                );
              },
            ).paddingOnly(top: 15),
          ],
        ),
      ),
    ),);
  }
}
