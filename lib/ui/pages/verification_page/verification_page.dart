import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/login_bloc/login_bloc.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/verification_page/widgets/pin_put_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../data/localization/locale_keys.g.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key, required this.loginBloc}) : super(key: key);

  static const String routeName = '/verificationPage';
  final LoginBloc loginBloc;

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  late final TextEditingController _pinPutController;
  late final FocusNode _pinPutFocusNode;

  @override
  void initState() {
    super.initState();
    _pinPutController = TextEditingController();
    _pinPutFocusNode = FocusNode();
  }

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
        widget.loginBloc.add(const CheckPhoneNumberChanged(false));
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColorUtils.background,
        body: BlocBuilder<LoginBloc, LoginState>(
            bloc: widget.loginBloc,
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    AppWidgets.appBarWidget(
                      onTap: () {
                        widget.loginBloc
                            .add(const CheckPhoneNumberChanged(false));
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
                          args: [(state.phone)],
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
                              color: AppColorUtils.textBlue,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              textAlign: TextAlign.center),
                        ),
                        AppWidgets.appButton(
                          title: LocaleKeys.next,
                          onTap: () {},
                        ).paddingOnly(
                          top: 100.h,
                          left: 20,
                          right: 20,
                        ),
                        AppWidgets.appButton(
                          title: "Boshqa raqam kiritish",
                          onTap: () {},
                          color: Colors.transparent,
                          textColor: AppColorUtils.textGreen,
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
