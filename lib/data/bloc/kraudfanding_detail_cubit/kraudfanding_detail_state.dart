part of 'kraudfanding_detail_cubit.dart';

@immutable
 class KraudfandingDetailState extends Equatable {

  KraudfandingDetailState(this.tabChange);

  final int tabChange;
  @override
  // TODO: implement props
  List<Object?> get props => [tabChange];


  KraudfandingDetailState copyWith({
    int? tabChange

  }) {
    return KraudfandingDetailState(tabChange ?? this.tabChange);
  }
}


