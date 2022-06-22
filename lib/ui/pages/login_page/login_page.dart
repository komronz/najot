import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/login_bloc/login_bloc.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_logger_util.dart';
import 'package:najot/ui/pages/login_page/custom_shape.dart';
import 'package:najot/ui/widgets/app_text_field.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:super_rich_text/super_rich_text.dart';

import '../verification_page/verification_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String routeName = '/loginPage';

  final bool fullNumber = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.phone.length == 12) {
            AppLoggerUtil.i("dddddd");
          }
          if (state.checkPhoneNumber) {
            NavigatorService.to.pushNamed(
              VerificationPage.routeName,
              arguments: context.read<LoginBloc>(),
            );
            context.read<LoginBloc>().add(const LoginAuthSuccess(false));
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
            physics: const ClampingScrollPhysics(),
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
                          color: AppColorUtils.greenBackSplash,
                          textColor: AppColorUtils.white,
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
                state.hasError
                    ? AppWidgets.starTextWidget(
                            text: "Telefon raqamni to'liq kiriting",
                            color: AppColorUtils.red)
                        .paddingOnly(left: 20)
                    : const SizedBox(),
                AppWidgets.appButton(
                  title: LocaleKeys.enter,
                  color: AppColorUtils.greenApp,
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
                color: AppColorUtils.dark6,
              ),
              AppWidgets.appButton(
                      title: LocaleKeys.str_registration,
                      onTap: onTap,
                      color: AppColorUtils.blue)
                  .paddingOnly(top: 10),
            ],
          ).paddingOnly(bottom: 100)
        : const SizedBox();
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
                  color: AppColorUtils.red,
                ),
              ),
              SizedBox(
                width: context.width * 0.85,
                child: AppWidgets.text(
                  richText: true,
                  othersMarkers: [
                    MarkerText(
                      marker: LocaleKeys.phone_number.tr(),
                      style: const TextStyle(color: AppColorUtils.red),
                    ),
                  ],
                  text: LocaleKeys.information_not_found.tr(),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  maxLines: 3,
                  color: AppColorUtils.gray4,
                  height: 1.2,
                ),
              ),
            ],
          ).paddingOnly(
            left: 20,
            right: 20,
            top: 8,
          )
        : const SizedBox();
  }
}

class ClipPathWidget extends StatelessWidget {
  final double height;

  const ClipPathWidget({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomShape(),
      child: Container(
        width: context.width,
        height: height,
        color: AppColorUtils.greenApp,
      ),
    );
  }
}
