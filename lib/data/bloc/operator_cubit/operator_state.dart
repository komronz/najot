part of 'operator_cubit.dart';

class OperatorState extends Equatable {
  final List<SmsModel> list;
  final bool hasError;
  final bool hasConnection;
  final String sendSmsTxt;
  final bool isLoading;

  const OperatorState({
    this.list = const [],
    this.hasError = false,
    this.hasConnection = true,
    this.isLoading = false,
    this.sendSmsTxt = "",
  });

  OperatorState copyWith({
    List<SmsModel>? list,
    bool? hasError,
    bool? hasConnection,
    bool? isLoading,
    String? sendSmsTxt,
  }) {
    return OperatorState(
      list: list ?? this.list,
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
        hasError,
        hasConnection,
        isLoading,
        sendSmsTxt,
      ];
}
