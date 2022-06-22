import 'package:flutter/material.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/verification_page/pin_put/pin_put.dart';

class PinPutWidget extends StatelessWidget {
  const PinPutWidget({
    Key? key,
    required FocusNode pinPutFocusNode,
    required TextEditingController pinPutController,
  })  : _pinPutFocusNode = pinPutFocusNode,
        _pinPutController = pinPutController,
        super(key: key);

  final FocusNode _pinPutFocusNode;
  final TextEditingController _pinPutController;

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
        color: const Color(0xffD8F2EB),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: PinPut(
        textStyle: const TextStyle(
          color: AppColorUtils.textGreen,
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
            color: AppColorUtils.greenApp,
          ),
        ),
      ),
    );
  }
}
