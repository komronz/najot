import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/verification_page/pin_put/pin_put.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({Key? key}) : super(key: key);
  static const String routeName = '/verificationPage';

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
        color: Color(0xffD8F2EB),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12));
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _pinPutController = TextEditingController();
    final FocusNode _pinPutFocusNode = FocusNode();

    return Scaffold(
      backgroundColor: AppColorUtils.BACKGROUND,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppWidgets.appBarWidget(
              onTap: () {
                NavigatorService.to.pop();
              },
              title: "Shaxsiy ma'lumotlar",
            ).paddingOnly(top: 58.h),
            Column(
              children: [
                AppWidgets.textLocale(
                  text: "6 raqamli kodni kiriting",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                PinPutWidget(
                  pinPutFocusNode: _pinPutFocusNode,
                  pinPutController: _pinPutController,
                  pinPutDecoration: _pinPutDecoration,
                ).paddingOnly(top: 20),
                TextButton(
                  onPressed: () {},
                  child: AppWidgets.textLocale(
                      text: "Qayta yuborish",
                      color: AppColorUtils.TEXT_BLUE,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      textAlign: TextAlign.center),
                ),
                AppWidgets.appButton(title: "Ro'yhatdan o'tish", onTap: () {}).paddingOnly(top: 100.h),
                AppWidgets.appButton(
                  title: "Boshqa raqam kiritish",
                  onTap: () {},
                  color: Colors.transparent,
                  textColor: AppColorUtils.TEXT_GREEN,
                ).paddingOnly(top: 10.h),
              ],
            ).paddingOnly(top: 100.h)
          ],
        ),
      ),
    );
  }
}

class PinPutWidget extends StatelessWidget {
  const PinPutWidget({
    required FocusNode pinPutFocusNode,
    required TextEditingController pinPutController,
    required BoxDecoration pinPutDecoration,
  })  : _pinPutFocusNode = pinPutFocusNode,
        _pinPutController = pinPutController,
        _pinPutDecoration = pinPutDecoration;

  final FocusNode _pinPutFocusNode;
  final TextEditingController _pinPutController;
  final BoxDecoration _pinPutDecoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: PinPut(
        textStyle: TextStyle(
          color: AppColorUtils.TEXT_GREEN,
          fontSize: 18,
        ),
        fieldsCount: 5,
        onSubmit: (String pin) {
          FocusScope.of(context).unfocus();
        },
        focusNode: _pinPutFocusNode,
        controller: _pinPutController,
        submittedFieldDecoration: _pinPutDecoration.copyWith(),
        selectedFieldDecoration: _pinPutDecoration,
        followingFieldDecoration: _pinPutDecoration.copyWith(
          border: Border.all(
            color: AppColorUtils.GREEN_APP,
          ),
        ),
      ),
    );
  }
}
