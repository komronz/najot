import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/app_page_cubit/app_page_cubit.dart';
import 'package:najot/data/bloc/login_bloc/login_bloc.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/pages/login_page/custom_shape.dart';
import 'package:najot/ui/widgets/app_text_field.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:super_rich_text/super_rich_text.dart';

import '../reg_page/reg_page.dart';
import '../verification_page/verification_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  static const String routeName = '/loginPage';

  bool fullNumber = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.phone.length == 12) {
            print("dddddd");

          }
          if (state.checkPhoneNumber) {
            NavigatorService.to.pushNamed(
              VerificationPage.routeName,
              arguments: context.read<LoginBloc>(),
            );
            context.read<LoginBloc>().add(LoginAuthSuccess(false));
          }
          // else{
          //   NavigatorService.to.pushNamed(
          //     RegPage.routeName,
          //     arguments: context.read<LoginBloc>(),
          //   );
          //   context.read<LoginBloc>().add(LoginAuthSuccess(false));
          // }
        },
        builder: (context, state) => Scaffold(
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipPathWidget(height: context.height * 0.5),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppWidgets.appBarWidget(
                          onTap: () {
                            NavigatorService.to.pop();
                          },
                          title: LocaleKeys.sign_in,
                          color: AppColorUtils.GREEN_BACK_SPLASH,
                          textColor: AppColorUtils.WHITE,
                        ),
                      ],
                    ).paddingOnly(top: 40.h),
                  ],
                ),
                AppTextField(
                  hasError: context.read<LoginBloc>().state.hasError,
                  isFill: context.read<LoginBloc>().state.phoneFill,
                  hintText: "",
                  onChanged: (v) {
                    context.read<LoginBloc>().add(LoginPhoneChanged(v));
                  },
                  title: LocaleKeys.phone_number,
                  textInputType: TextInputType.number,
                  inputFormatter:
                      context.read<LoginBloc>().phoneNumberFormatter,
                  phoneNumberCode: true,
                ).paddingOnly(
                  top: 24,
                  left: 20,
                  right: 20,
                ),
               state.hasError ? AppWidgets.starTextWidget(
                  text: "Telefon raqamni to'liq kiriting",
                  color: AppColorUtils.RED
                ).paddingOnly(left: 20) : SizedBox(),
                AppWidgets.appButton(
                  title: LocaleKeys.enter,
                  color: AppColorUtils.GREEN_APP,
                  onTap: () {
                      context.read<LoginBloc>().add(CheckPhoneNumber());


                  },
                ).paddingSymmetric(vertical: 24.h, horizontal: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginRegBtnWidget extends StatelessWidget {
  final bool hasError;
  final VoidCallback onTap;

  const LoginRegBtnWidget({
    required this.onTap,
    this.hasError = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return hasError
        ? Column(
            children: [
              AppWidgets.text(
                text: LocaleKeys.you_not_registered.tr(),
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColorUtils.DARK_6,
              ),
              AppWidgets.appButton(
                      title: LocaleKeys.str_registration,
                      onTap: onTap,
                      color: AppColorUtils.BLUE)
                  .paddingOnly(top: 10),
            ],
          ).paddingOnly(bottom: 100)
        : SizedBox();
  }
}

class LoginErrorTextWidget extends StatelessWidget {
  final bool hasError;

  const LoginErrorTextWidget({
    this.hasError = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return hasError
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '*',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColorUtils.RED,
                ),
              ),
              SizedBox(
                width: context.width * 0.85,
                child: AppWidgets.text(
                  richText: true,
                  othersMarkers: [
                    MarkerText(
                      marker: LocaleKeys.phone_number.tr(),
                      style: TextStyle(color: AppColorUtils.RED),
                    ),
                  ],
                  text: LocaleKeys
                      .information_not_found
                      .tr(),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  maxLines: 3,
                  color: AppColorUtils.GRAY_4,
                  height: 1.2,
                ),
              ),
            ],
          ).paddingOnly(
            left: 20,
            right: 20,
            top: 8,
          )
        : SizedBox();
  }
}

class ClipPathWidget extends StatelessWidget {
  final double height;

  ClipPathWidget({required this.height});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomShape(),
      child: Container(
        width: context.width,
        height: height,
        color: AppColorUtils.GREEN_APP,
      ),
    );
  }
}
