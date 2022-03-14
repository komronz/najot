import 'package:flutter/cupertino.dart';
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
}
