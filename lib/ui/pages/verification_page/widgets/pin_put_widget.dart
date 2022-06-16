import 'package:flutter/material.dart';
import 'package:najot/data/utils/app_color_utils.dart';

import '../pin_put/pin_put.dart';

class PinPutWidget extends StatelessWidget {
  const PinPutWidget({
    required FocusNode pinPutFocusNode,
    required TextEditingController pinPutController,
  })  : _pinPutFocusNode = pinPutFocusNode,
        _pinPutController = pinPutController;

  final FocusNode _pinPutFocusNode;
  final TextEditingController _pinPutController;

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
        color: Color(0xffD8F2EB),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: PinPut(
        textStyle: TextStyle(
          color: AppColorUtils.TEXT_GREEN,
          fontSize: 18,
        ),
        fieldsCount: 6,
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
      // child: Pinput(
      //   androidSmsAutofillMethod:  AndroidSmsAutofillMethod.smsUserConsentApi,
      //    defaultPinTheme:  PinTheme(
      //      width: 20,
      //      height: 20,
      //      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      //      decoration: BoxDecoration(
      //        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      //        borderRadius: BorderRadius.circular(20),
      //      ),
      //    ).copyDecorationWith(
      //      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      //      borderRadius: BorderRadius.circular(8),
      //    ),
      //   length: 6,
      //   pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      //   showCursor: true,
      //     focusNode: _pinPutFocusNode,
      //     controller: _pinPutController,
      //
      // ),
    );
  }
}
