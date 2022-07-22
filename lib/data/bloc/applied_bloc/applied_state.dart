part of 'appeal_bloc.dart';

class AppealState extends Equatable {
  final String name;
  final String content;
  final String phoneNumber;
  final bool firstNameFill;
  final bool applyFill;
  final bool phoneFill;
  final bool isNextBtnActive;
  final bool hasError;
  final bool isLoading;
  final bool hasLoading;
  final bool internetConnection;
  final List<AboutModel> list;

  const AppealState({
    this.name = '',
    this.content = '',
    this.phoneNumber = '',
    this.isNextBtnActive = false,
    this.firstNameFill = false,
    this.applyFill = false,
    this.phoneFill = false,
    this.hasError = false,
    this.isLoading = false,
    this.hasLoading = false,
    this.internetConnection = true,
    this.list = const []
  });

  @override
  List<Object?> get props => [
        name,
        content,
        phoneNumber,
        isNextBtnActive,
        firstNameFill,
        applyFill,
        phoneFill,
        hasError,
        isLoading,
    hasLoading,
    internetConnection,
    list
      ];

  AppealState copyWith({
    String? firstName,
    String? content,
    String? phoneNumber,
    bool? isNextBtnActive,
    bool? firstNameFill,
    bool? applyFill,
    bool? phoneFill,
    bool? hasError,
    bool? isLoading,
    bool? hasLoading,
    bool? internetConnection,
     List<AboutModel>? list
  }) {
    return AppealState(
      name: firstName ?? this.name,
      content: content ?? this.content,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isNextBtnActive: isNextBtnActive ?? this.isNextBtnActive,
      firstNameFill: firstNameFill ?? this.firstNameFill,
      applyFill: applyFill ?? this.applyFill,
      phoneFill: phoneFill ?? this.phoneFill,
      hasError: hasError ?? this.hasError,
      isLoading: isLoading ?? this.isLoading,
      hasLoading: hasLoading ?? this.hasLoading,
      internetConnection: internetConnection ?? this.internetConnection,
      list: list ?? this.list,
    );
  }
}
