part of 'crowd_founding_detail_cubit.dart';

class CrowdFoundingDetailState extends Equatable {
  const CrowdFoundingDetailState(this.tabChange);

  final int tabChange;

  @override
  List<Object?> get props => [tabChange];

  CrowdFoundingDetailState copyWith({int? tabChange}) {
    return CrowdFoundingDetailState(tabChange ?? this.tabChange);
  }
}
