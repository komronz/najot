part of 'charity_cubit.dart';

class CharityState extends Equatable {
  const CharityState(
      {required this.checkBox,
      this.list = const [],
      this.tobeVolunteer = true,
      this.saveHelp = true});

  final List<CardModel> list;
  final bool tobeVolunteer;
  final bool checkBox;
  final bool saveHelp;

  @override
  // TODO: implement props
  List<Object?> get props => [list, tobeVolunteer, checkBox, saveHelp];

  CharityState copyWith({
    List<CardModel>? list,
    bool? tobeVolunteer,
    bool? checkBox,
    bool? saveHelp,
  }) {
    return CharityState(
      list: list ?? this.list,
      tobeVolunteer: tobeVolunteer ?? this.tobeVolunteer,
      checkBox: checkBox ?? this.checkBox,
      saveHelp: saveHelp ?? this.saveHelp,
    );
  }
}
