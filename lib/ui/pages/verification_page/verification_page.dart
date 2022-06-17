import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/login_bloc/login_bloc.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/verification_page/widgets/pin_put_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../data/bloc/app_page_cubit/app_page_cubit.dart';
import '../../../data/localization/locale_keys.g.dart';
import '../home_page/home_page.dart';

class VerificationPage extends StatelessWidget {
  VerificationPage({required this.loginBloc});

  static const String routeName = '/verificationPage';
  LoginBloc loginBloc;


  @override
  Widget build(BuildContext context) {
    final TextEditingController _pinPutController = TextEditingController();
    final FocusNode _pinPutFocusNode = FocusNode();


    return WillPopScope(
      onWillPop: () async {
        loginBloc.add(CheckPhoneNumberChanged(0));
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColorUtils.BACKGROUND,
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context,state){
            if(state.loginSuccess){
              NavigatorService.to.pushNamedAndRemoveUntil(
                HomePage.routeName,
                arguments: AppPageType.MAIN,
              );
            }
          },
            bloc: loginBloc,
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    AppWidgets.appBarWidget(
                      onTap: () {
                        loginBloc.add(CheckPhoneNumberChanged(0));
                        NavigatorService.to.pop();
                      },
                      title: LocaleKeys.personal_information,
                    ).paddingOnly(top: 58.h),
                    Column(
                      children: [
                        AppWidgets.textLocale(
                          textAlign: TextAlign.center,
                          text: LocaleKeys.enter_6_digit_code,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          args: ["${state.phone}"],
                          maxLines: 3,
                        ).paddingSymmetric(horizontal: 40.w),
                        PinPutWidget(
                          pinPutFocusNode: _pinPutFocusNode,
                          pinPutController: _pinPutController,
                        ).paddingOnly(top: 20),
                        AppWidgets.starTextWidget(
                                text: "Kod notug'ri kiritilgan", fontSize: 12.w)
                            .paddingOnly(left: 120.w),
                        TextButton(
                          onPressed: () {},
                          child: AppWidgets.textLocale(
                              text: LocaleKeys.send_again,
                              color: AppColorUtils.TEXT_BLUE,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              textAlign: TextAlign.center),
                        ),
                        AppWidgets.appButton(
                          title: LocaleKeys.next,
                          onTap: () {
                            int a=int.parse(_pinPutController.text.toString());
                            loginBloc.add(
                              LoginEnd(a),
                            );
                          },
                        ).paddingOnly(
                          top: 100.h,
                          left: 20,
                          right: 20,
                        ),
                        AppWidgets.appButton(
                          title: "Boshqa raqam kiritish",
                          onTap: () {},
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
            }),
      ),
    );
  }
}
