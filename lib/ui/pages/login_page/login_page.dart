import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/login_bloc/login_bloc.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/login_page/custom_shape.dart';
import 'package:najot/ui/widgets/app_text_field.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:super_rich_text/super_rich_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String routeName = '/loginPage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {

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
                          title: "Tizimga kiring",
                          color: Color(0xFF25D7A8),
                          textColor: AppColorUtils.WHITE,
                        ),
                      ],
                    ).paddingOnly(top: 40.h),
                  ],
                ),
                AppTextField(
                  isFill: context.read<LoginBloc>().state.firstNameFill,
                  hintText: "(abdumalik)",
                  onChanged: (v) {
                    context.read<LoginBloc>().add(LoginFirstNameChanged(v));
                  },
                  title: "Ism",
                ),
                AppTextField(
                  hasError: context.read<LoginBloc>().state.hasError,
                  isFill: context.read<LoginBloc>().state.phoneFill,
                  hintText: "",
                  onChanged: (v) {
                    context.read<LoginBloc>().add(LoginPhoneChanged(v));
                  },
                  initialText: "+998",
                  title: "Telefon raqami",
                  textInputType: TextInputType.number,
                  inputFormatter:
                      context.read<LoginBloc>().phoneNumberFormatter,
                ).paddingOnly(top: 24),
                LoginErrorTextWidget(
                  hasError: context.read<LoginBloc>().state.hasError,
                ),
                AppWidgets.appButton(
                  title: "Kirish",
                  color: state.signBtnActive
                      ? AppColorUtils.GREEN_APP
                      : AppColorUtils.DISABLE_BC,
                  onTap: () {
                    context.read<LoginBloc>().add(LoginSignIn());
                  },
                ).paddingSymmetric(vertical: 24.h),
                LoginRegBtnWidget(
                  onTap: () {
                    context.read<LoginBloc>().add(LoginSignUp());
                  },
                  hasError: context.read<LoginBloc>().state.hasError,
                )
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
                text: "Agar ro’yxatdan o’tmagan bo’lsangiz, ro’yxatdan o’ting!",
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColorUtils.DARK_6,
              ),
              AppWidgets.appButton(
                      title: "Ro'yxatdan o'tish",
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
                          marker: "telefon raqami",
                          style: TextStyle(color: Colors.red))
                    ],
                    text:
                        " Bu telefon raqami bo’yicha hech qanday ma’lumot topilmadi. Iltimos qaytadan urinib ko’ring.",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    maxLines: 3,
                    color: AppColorUtils.GRAY_4,
                    height: 1.2),
              ),
            ],
          ).paddingOnly(left: 20, right: 20, top: 8)
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
