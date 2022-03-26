part of 'appeal_bloc.dart';

class AppealState extends Equatable {
  final String firstName;
  final String applyText;
  final String phone;
  final bool firstNameFill;
  final bool applyFill;
  final bool phoneFill;
  final bool isNextBtnActive;
  final bool hasError;

  const AppealState({
    this.firstName = '',
    this.applyText = '',
    this.phone = '',
    this.isNextBtnActive = false,
    this.firstNameFill = false,
    this.applyFill = false,
    this.phoneFill = false,
    this.hasError = false,
  });

  @override
  List<Object?> get props => [
        firstName,
        applyText,
        phone,
        isNextBtnActive,
        firstNameFill,
        applyFill,
        phoneFill,
        hasError,
      ];

  AppealState copyWith({
    String? firstName,
    String? applyText,
    String? phone,
    bool? isNextBtnActive,
    bool? firstNameFill,
    bool? applyFill,
    bool? phoneFill,
    bool? hasError,
  }) {
    return AppealState(
      firstName: firstName ?? this.firstName,
      applyText: applyText ?? this.applyText,
      phone: phone ?? this.phone,
      isNextBtnActive: isNextBtnActive ?? this.isNextBtnActive,
      firstNameFill: firstNameFill ?? this.firstNameFill,
      applyFill: applyFill ?? this.applyFill,
      phoneFill: phoneFill ?? this.phoneFill,
      hasError: hasError ?? this.hasError,
    );
  }
}
