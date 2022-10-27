import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/login_bloc/login_bloc.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/verification_page/widgets/pin_put_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:pinput/pinput.dart';
import 'package:super_rich_text/super_rich_text.dart';

import '../../../data/bloc/app_page_cubit/app_page_cubit.dart';
import '../../../data/bloc/home_cubit/home_cubit.dart';
import '../../../data/localization/locale_keys.g.dart';
import '../home_page/home_page.dart';

class VerificationPage extends StatefulWidget with SmartAuth {
  VerificationPage({required this.loginBloc});

  static const String routeName = '/verificationPage';
  LoginBloc loginBloc;

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  @override
  void dispose() {
    _pinPutController.dispose();
    _pinPutFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.loginBloc.add(CheckPhoneNumberChanged(0));
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColorUtils.BACKGROUND,
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) async {
            if (state.loginSuccess) {
              HomeCubit.to.getModel();
              await NavigatorService.to.pushNamedAndRemoveUntil(
                HomePage.routeName,
                arguments: AppPageType.MAIN,
              );
            }
          },
          bloc: widget.loginBloc,
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  AppWidgets.appBarWidget(
                    onTap: () async {
                      widget.loginBloc.add(CheckPhoneNumberChanged(0));
                      NavigatorService.to.pop();
                    },
                    title: LocaleKeys.code_verification.tr(),
                  ).paddingOnly(top: 58.h),
                  Column(
                    children: [
                      AppWidgets.textLocale(
                          text: LocaleKeys.enter_6_digit_code,
                          color: AppColorUtils.DARK3,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          maxLines: 3,
                          args: ["${state.phone}"],
                          richText: true,
                          othersMarkers: [
                            MarkerText(
                              marker: "&",
                              style: TextStyle(
                                color: AppColorUtils.BLACK,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ]).paddingSymmetric(horizontal: 60.w),
                      PinPutWidget(
                        pinPutFocusNode: _pinPutFocusNode,
                        pinPutController: _pinPutController,
                      ).paddingOnly(top: 20),
                      state.codeError
                          ? AppWidgets.starTextWidget(
                              text: LocaleKeys.code_entered_incorrectly.tr(),
                              fontSize: 12.w,
                            ).paddingOnly(left: 120.w, top: 10)
                          : SizedBox(),
                      state.sendCodeDuration
                          ? CircularProgressIndicator().paddingOnly(top: 10)
                          : TextButton(
                              onPressed: () {
                                widget.loginBloc
                                    .add(CheckPhoneNumberChanged(0));
                                widget.loginBloc.add(ResendCode());
                              },
                              child: AppWidgets.textLocale(
                                text: LocaleKeys.send_again,
                                color: AppColorUtils.TEXT_BLUE,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                textAlign: TextAlign.center,
                              ),
                            ),
                      AppWidgets.appButton(
                        title: LocaleKeys.next,
                        onTap: () {
                          if (_pinPutController.text.isNotEmpty) {
                            int a =
                                int.parse(_pinPutController.text.toString());
                            widget.loginBloc.add(
                              LoginEnd(a, callBack: () {
                                NavigatorService.to
                                    .pushNamed(HomePage.routeName);
                              }),
                            );
                          } else {
                            AppWidgets.showText(
                              text: LocaleKeys.enter_confirmation_code.tr(),
                            );
                          }
                        },
                      ).paddingOnly(
                        top: 20.h,
                        left: 20,
                        right: 20,
                      ),
                      AppWidgets.appButton(
                        title: LocaleKeys.enter_another_number.tr(),
                        onTap: () {
                          widget.loginBloc.add(CheckPhoneNumberChanged(0));
                          NavigatorService.to.pop();
                        },
                        color: Colors.transparent,
                        textColor: AppColorUtils.TEXT_GREEN,
                      ).paddingOnly(
                        top: 10.h,
                        left: 20,
                        right: 20,
                      ),
                    ],
                  ).paddingOnly(top: 100.h)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
