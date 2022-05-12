part of 'crowd_founding_detail_cubit.dart';

@immutable
class CrowdFoundingDetailState extends Equatable {
  CrowdFoundingDetailState(this.tabChange);

  final int tabChange;

  @override
  // TODO: implement props
  List<Object?> get props => [tabChange];

  CrowdFoundingDetailState copyWith({int? tabChange}) {
    return CrowdFoundingDetailState(tabChange ?? this.tabChange);
  }
}
