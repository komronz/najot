part of 'operator_cubit.dart';

class OperatorState extends Equatable {
  final List<OperatorModelResults?>? list;
  final File? userImgPath;
  final bool hasError;
  final bool hasConnection;
  final String sendSmsTxt;
  final bool isLoading;

  OperatorState({
    this.list = const [],
    this.hasError = false,
    this.userImgPath,
    this.hasConnection = true,
    this.isLoading = false,
    this.sendSmsTxt = "",
  });

  OperatorState copyWith({
    List<OperatorModelResults?>? list,
    File? userImgPath,
    bool? hasError,
    bool? hasConnection,
    bool? isLoading,
    String? sendSmsTxt,
  }) {
    return OperatorState(
      list: list ?? this.list,
      userImgPath: userImgPath??this.userImgPath,
      hasConnection: hasConnection ?? this.hasConnection,
      hasError: hasError ?? this.hasError,
      isLoading: isLoading ?? this.isLoading,
      sendSmsTxt: sendSmsTxt ?? this.sendSmsTxt,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        list,
        userImgPath,
        hasError,
        hasConnection,
        isLoading,
        sendSmsTxt,
      ];
}
