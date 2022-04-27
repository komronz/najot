import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/login_bloc/login_bloc.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/reg_page/widgets/rich_text_widget.dart';
import 'package:najot/ui/pages/verification_page/verification_page.dart';
import 'package:najot/ui/widgets/app_text_field.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class RegPage extends StatelessWidget {
  const RegPage({Key? key}) : super(key: key);
  static const String routeName = '/regPage';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {},
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
                    NavigatorService.to.pop();
                  },
                  title: LocaleKeys.personal_information,
                ).paddingOnly(top: 58.h),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextField(
                      isFill: context.read<LoginBloc>().state.firstNameFill,
                      hintText: "(abdumalik)",
                      onChanged: (v) {
                        context.read<LoginBloc>().add(LoginFirstNameChanged(v));
                      },
                      title: LocaleKeys.name,
                    ),
                    AppTextField(
                      isFill: context.read<LoginBloc>().state.lastNameFill,
                      hintText: "(sapoqulov)",
                      onChanged: (v) {
                        context.read<LoginBloc>().add(LoginLastNameChanged(v));
                      },
                      title: LocaleKeys.surname,
                    ).paddingOnly(top: 24),
                    AppTextField(
                      isFill: context.read<LoginBloc>().state.phoneFill,
                      hintText: "",
                      initialText: "+998",
                      onChanged: (v) {
                        context.read<LoginBloc>().add(LoginPhoneChanged(v));
                      },
                      title: LocaleKeys.phone_number,
                      textInputType: TextInputType.phone,
                      inputFormatter:
                          context.read<LoginBloc>().phoneNumberFormatter,
                    ).paddingOnly(top: 24),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          onChanged: (v) {
                            context
                                .read<LoginBloc>()
                                .add(LoginAgreeChanged(v!));
                          },
                          value: context.read<LoginBloc>().state.agree,
                          checkColor: AppColorUtils.BORDER_COLOR,
                          activeColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                          side: MaterialStateBorderSide.resolveWith(
                            (states) => BorderSide(
                              width: 2.0,
                              color: AppColorUtils.BORDER_COLOR,
                            ),
                          ),
                        ),
                        RichTextWidget()
                      ],
                    ).paddingSymmetric(horizontal: 15, vertical: 24),
                    AppWidgets.appButton(
                      title: LocaleKeys.next,
                      onTap: context.read<LoginBloc>().state.isNextBtnActive
                          ? () {
                              NavigatorService.to
                                  .pushNamed(VerificationPage.routeName);
                              context.read<LoginBloc>().add(LoginSignIn());
                            }
                          : () {
                              AppWidgets.showText(
                                text: LocaleKeys.agree_to_the_terms_of_the_project.tr(),
                                duration: Duration(seconds: 1),
                              );
                            },
                      color: context.read<LoginBloc>().state.isNextBtnActive
                          ? AppColorUtils.GREEN_APP
                          : AppColorUtils.DISABLE_BC,
                    ).paddingSymmetric(horizontal: 20),
                    context.read<LoginBloc>().state.agree
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
                                text: LocaleKeys.agree_to_the_terms_of_the_project_first.tr(),
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
    );
  }
}
