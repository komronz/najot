import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/app_page_cubit/app_page_cubit.dart';
import 'package:najot/data/bloc/login_bloc/login_bloc.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/pages/reg_page/widgets/rich_text_widget.dart';
import 'package:najot/ui/pages/verification_page/verification_page.dart';
import 'package:najot/ui/widgets/app_text_field.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class RegPage extends StatelessWidget {
  const RegPage({required this.loginBloc});

  static const String routeName = '/regPage';
  final LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        loginBloc.add(CheckPhoneNumberChanged(0));
        return true;
      },
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.registerSuccess) {
            NavigatorService.to.pushNamed(
              VerificationPage.routeName,arguments: loginBloc,);
            loginBloc.add(RegisSuccessChange(false));
          }
        },
        bloc: loginBloc,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColorUtils.BACKGROUND,
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              reverse: true,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextField(
                        isFill: loginBloc.state.firstNameFill,
                        hintText: "(abdumalik)",
                        onChanged: (v) {
                          loginBloc.add(LoginFirstNameChanged(v));
                        },
                        title: LocaleKeys.name,
                      ).paddingOnly(
                        left: 20,
                        right: 20,
                      ),
                      AppTextField(
                        isFill: loginBloc.state.lastNameFill,
                        hintText: "(sapoqulov)",
                        onChanged: (v) {
                          loginBloc.add(LoginLastNameChanged(v));
                        },
                        title: LocaleKeys.surname,
                      ).paddingOnly(
                        top: 24,
                        left: 20,
                        right: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Checkbox(
                            onChanged: (v) {
                              loginBloc.add(LoginAgreeChanged(v!));
                            },
                            value: loginBloc.state.agree,
                            checkColor: AppColorUtils.BORDER_COLOR,
                            activeColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            side: MaterialStateBorderSide.resolveWith(
                                  (states) =>
                                  BorderSide(
                                    width: 2.0,
                                    color: AppColorUtils.BORDER_COLOR,
                                  ),
                            ),
                          ),
                          RichTextWidget()
                        ],
                      ).paddingSymmetric(horizontal: 15, vertical: 24),
                      AppWidgets.appButton(
                        title: LocaleKeys.log_in,
                        onTap: loginBloc.state.isNextBtnActive
                            ? () {
                          loginBloc.add(Registration());

                        }
                            : () {
                          AppWidgets.showText(
                            text: LocaleKeys.agree_terms_project.tr(),
                            duration: Duration(seconds: 1),
                          );
                        },
                        color: loginBloc.state.agree
                            ? AppColorUtils.GREEN_APP
                            : AppColorUtils.DISABLE_BC,
                      ).paddingSymmetric(horizontal: 20),
                      loginBloc.state.agree
                          ? SizedBox()
                          : Row(
                        children: [
                          AppWidgets.text(
                            text: "*",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColorUtils.RED,
                          ),
                          AppWidgets.text(
                            text: LocaleKeys.agree_project_first.tr(),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            richText: true,
                          ),
                        ],
                      ).paddingOnly(top: 12, left: 20),
                    ],
                  ).paddingSymmetric(vertical: 100.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
