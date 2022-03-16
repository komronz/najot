import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najot/data/utils/app_color_utils.dart';

class DecorationConst {
  static const BoxDecoration DEC_WITH_SHADOW = BoxDecoration(
    color: AppColorUtils.WHITE,
    boxShadow: [
      BoxShadow(
        color: Color.fromRGBO(11, 191, 144, 0.02),
      )
    ],
    borderRadius: BorderRadius.all(
      Radius.circular(11),
    ),
  );
  static const InputDecoration DEC_INPUT = InputDecoration(
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        width: 2,
        color: AppColorUtils.BORDER_COLOR,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        width: 2,
        color: AppColorUtils.BORDER_COLOR,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        width: 2,
        color: AppColorUtils.BORDER_COLOR,
      ),
    ),
  );
  static const InputBorder INPUT_BORDER = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(
      width: 2,
      color: AppColorUtils.BORDER_COLOR,
    ),
  );
}
