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
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/widgets/app_text_field.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../widgets/app_error_widget.dart';
import 'edit_show_success.dart';

class AboutView extends StatelessWidget {
  static const String routeName = '/aboutPage';

  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppealBloc()..add(GetAboutDataEvent()),
      child: AboutPage(),
    );
  }
}

class AboutPage extends StatelessWidget {
  AboutPage({Key? key}) : super(key: key);

  Key _key = Key("");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

              SizedBox(
                width: 35.w,
                height: 35.w,
              ),

              /// Change later
              ///
              // InkWell(
              //   onTap: () {
              //     NavigatorService.to.pushNamed(
              //       NotificationPage.routeName,
              //     );
              //   },
              //   child: SvgPicture.asset(
              //     AppImageUtils.NOTIFICATION,
              //     height: 35.w,
              //     width: 35.w,
              //     fit: BoxFit.fill,
              //   ),
              // )
            ],
          ).paddingSymmetric(horizontal: 20),
        ),
        body: BlocBuilder<AppealBloc, AppealState>(
          bloc: context.read<AppealBloc>(),
          builder: (context, state) {
            if (state.internetConnection) {
              if (state.isLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                ).paddingOnly(top: 300.h);
              } else if (state.list.isNotEmpty) {
                List<String> _addressList =
                    (state.list[0].address ?? "").split(",");
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppWidgets.networkImage(
                              url: state.list[0].cover!,
                              width: 400,
                              height: 360,
                            ).paddingOnly(
                              top: 30,
                              left: 20,
                              right: 20,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              children: [
                                AppWidgets.imageSvg(
                                  path: AppImageUtils.IC_LOCATION,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppWidgets.text(
                                          textAlign: TextAlign.start,
                                          text: _addressList[0].trim(),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          height: 1.2,
                                          color: AppColorUtils.KRAUDFANDING,
                                          maxLines: 10,
                                        ).paddingOnly(left: 8),
                                        AppWidgets.text(
                                          textAlign: TextAlign.start,
                                          text: _addressList[1].trim(),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          height: 1.2,
                                          color: AppColorUtils.KRAUDFANDING,
                                          maxLines: 10,
                                        ).paddingOnly(left: 8),
                                        AppWidgets.text(
                                          textAlign: TextAlign.start,
                                          text: _addressList[2].trim(),
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                          height: 1.2,
                                          color: AppColorUtils.KRAUDFANDING,
                                          maxLines: 10,
                                        ).paddingOnly(left: 8),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ).paddingSymmetric(horizontal: 20, vertical: 9),
                            Row(
                              children: [
                                AppWidgets.imageSvg(
                                  path: AppImageUtils.IC_PHONE,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppWidgets.text(
                                      textAlign: TextAlign.start,
                                      text: state.list[0].phone1 ?? "",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      height: 1.5,
                                      color: AppColorUtils.KRAUDFANDING,
                                      maxLines: 10,
                                    ),
                                    AppWidgets.text(
                                      textAlign: TextAlign.start,
                                      text: state.list[0].phone2 ?? "",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2,
                                      color: AppColorUtils.KRAUDFANDING,
                                      maxLines: 10,
                                    ),
                                  ],
                                ).paddingOnly(left: 8)
                              ],
                            ).paddingSymmetric(
                              horizontal: 20,
                              vertical: 9,
                            ),
                          ],
                        ),
                      ),
                      Container(
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
                              key: _key,
                              isFill: context
                                  .read<AppealBloc>()
                                  .state
                                  .firstNameFill,
                              hintText: "(abdumalik)",
                              initialText: state.firstName,
                              onChanged: (v) {
                                context
                                    .read<AppealBloc>()
                                    .add(AppealNameChanged(v));
                              },
                              title: LocaleKeys.name.tr(),
                            ).paddingOnly(top: 18),
                            AppTextField(
                              key: _key,
                              textInputType: TextInputType.phone,
                              isFill:
                                  context.read<AppealBloc>().state.phoneFill,
                              hintText: "+998",
                              inputFormatter: context
                                  .read<AppealBloc>()
                                  .phoneNumberFormatter,
                              initialText: state.phoneNumber,
                              onChanged: (v) {
                                context
                                    .read<AppealBloc>()
                                    .add(AppealPhoneChanged(v));
                              },
                              title: LocaleKeys.phone_number.tr(),
                            ).paddingOnly(top: 18),
                            AppTextField(
                              key: _key,
                              isFill:
                                  context.read<AppealBloc>().state.applyFill,
                              isMultiLine: true,
                              height: 154.w,
                              initialText: state.content,
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
                              title: LocaleKeys.send.tr(),
                              onTap: () async {
                                _key = UniqueKey();

                                await showDialog(
                                  context: context,
                                  builder: (con) => EditShowSuccessSend(
                                    appealBloc: context.read<AppealBloc>(),
                                  ),
                                );
                              },
                              textColor: Colors.white,
                              color: context
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
                      ),
                    ],
                  ),
                );
              } else {
                return Container();
              }
            } else {
              return AppErrorWidget(
                onTap: () async {
                  AppWidgets.isLoading(true);
                  await context.read<AppealBloc>()
                    ..add(GetAboutDataEvent());
                  AppWidgets.isLoading(false);
                },
              );
            }
          },
        ).paddingOnly(top: 15));
  }
}
