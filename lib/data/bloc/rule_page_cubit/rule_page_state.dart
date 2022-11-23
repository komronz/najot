

import 'package:equatable/equatable.dart';
import 'package:najot/data/model/rule_page_model.dart';

class RulePageState extends Equatable {
  final bool hasLoading;
  final bool hasError;
  final bool hasConnection;
  final List<RulePageModel> list;
  final bool internetConnection;

  const RulePageState({
    this.hasLoading = false,
    this.hasError = false,
    this.hasConnection = true,
    this.list = const [],
    this.internetConnection=true
  });

  RulePageState copyWith({
    bool? hasLoading,
    bool? hasError,
    bool? hasConnection,
    bool? internetConnection,
    List<RulePageModel>? list,
  }) {
    return RulePageState(
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
      other is RulePageState &&
          runtimeType == other.runtimeType &&
          hasError == other.hasError &&
          list == other.list &&
          hasConnection == other.hasConnection &&
          hasLoading == other.hasLoading&&
  internetConnection == other.internetConnection;
}
