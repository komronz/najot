
import 'package:equatable/equatable.dart';
import 'package:najot/data/model/faq_model.dart';

class FaqState extends Equatable {
  final bool hasLoading;
  final bool hasError;
  final bool hasConnection;
  final bool internetConnection;
  final List<FaqModel> list;

  const FaqState({
    this.hasLoading = false,
    this.hasError = false,
    this.hasConnection = true,
    this.internetConnection = true,
    this.list = const [],
  });

  FaqState copyWith({
    bool? hasLoading,
    bool? hasError,
    bool? hasConnection,
    bool? internetConnection,
    List<FaqModel>? list,
  }) {
    return FaqState(
      hasError: hasError ?? this.hasError,
      list: list ?? this.list,
      hasConnection: hasConnection ?? this.hasConnection,
      hasLoading: hasLoading ?? this.hasLoading,
      internetConnection: internetConnection ?? this.internetConnection,
    );
  }

  @override
  List<Object?> get props => [
        hasLoading,
        hasError,
        hasConnection,
        list,
    internetConnection
      ];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FaqState &&
          runtimeType == other.runtimeType &&
          hasError == other.hasError &&
          list == other.list &&
          hasConnection == other.hasConnection &&
          internetConnection == other.internetConnection &&
          hasLoading == other.hasLoading;
}
