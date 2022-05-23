part of 'language_cubit.dart';

class LanguageState extends Equatable {
  final Locale locale;
  final bool isLoading;
  final int value;

  const LanguageState({
    required this.locale,
    this.isLoading = false,
     this.value=1
  });

  @override
  List<Object?> get props => [locale, isLoading,value];

  LanguageState copyWith({
    Locale? locale,
    bool? isLoading,
    int? value
  }) {
    return LanguageState(
      locale: locale ?? this.locale,
      isLoading: isLoading ?? this.isLoading,
      value: value ?? this.value,
    );
  }
}
