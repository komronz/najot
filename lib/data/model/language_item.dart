import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LanguageItem extends Equatable {
  final String languageLocaleKey;
  final Locale locale;

  LanguageItem({
    required this.languageLocaleKey,
    required this.locale,
  });

  @override
  List<Object?> get props => [
        languageLocaleKey,
        locale,
      ];
}
