import 'package:flutter/material.dart';
import 'package:najot/data/utils/app_color_utils.dart';

class DecorationConst {
  static const BoxDecoration decWithShadow = BoxDecoration(
    color: AppColorUtils.white,
    boxShadow: [
      BoxShadow(
        color: Color.fromRGBO(11, 191, 144, 0.02),
      )
    ],
    borderRadius: BorderRadius.all(
      Radius.circular(11),
    ),
  );
  static const InputDecoration decInput = InputDecoration(
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        width: 2,
        color: AppColorUtils.borderColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        width: 2,
        color: AppColorUtils.borderColor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        width: 2,
        color: AppColorUtils.borderColor,
      ),
    ),
  );
  static const InputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    borderSide: BorderSide(
      width: 2,
      color: AppColorUtils.borderColor,
    ),
  );

  InputDecoration inputDecoration({Widget? prefixIcon, Widget? suffixIcon}) =>
      InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelStyle: const TextStyle(color: Color(0xFF9E9292)),
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(27, 16, 0, 16),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColorUtils.borderColor,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColorUtils.borderColor,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColorUtils.red,
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      );
}
