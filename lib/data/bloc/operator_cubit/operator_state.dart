part of 'operator_cubit.dart';

class OperatorState extends Equatable {
  final List<OperatorModelResults?>? list;
  // final List<OperatorModelResults?>? listPost;
  final bool hasError;
  final bool hasConnection;
  final String sendSmsTxt;
  final bool isLoading;

  OperatorState({
    this.list = const [],
    // this.listPost = const [],
    this.hasError = false,
    this.hasConnection = true,
    this.isLoading = false,
    this.sendSmsTxt = "",
  });

  OperatorState copyWith({
    List<OperatorModelResults?>? list,
    // List<OperatorModelResults?>? listPost,
    bool? hasError,
    bool? hasConnection,
    bool? isLoading,
    String? sendSmsTxt,
  }) {
    return OperatorState(
      list: list ?? this.list,
      // listPost: listPost ?? this.listPost,
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
        // listPost,
        hasError,
        hasConnection,
        isLoading,
        sendSmsTxt,
      ];
}
