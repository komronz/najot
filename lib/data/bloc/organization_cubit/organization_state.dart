part of 'organization_cubit.dart';

class OrganizationState extends Equatable {
  final List<OrganizationModel> list;
  final bool tobeVolunteer;
  final bool checkBox;
  final bool saveHelp;

  OrganizationState(
      {this.list = const [],
      this.tobeVolunteer = true,
      required this.checkBox,
      this.saveHelp = true});

  @override
  // TODO: implement props
  List<Object?> get props => [list,tobeVolunteer, checkBox, saveHelp,];

  OrganizationState copyWith({
    List<OrganizationModel>? list,
    bool? tobeVolunteer,
    bool? checkBox,
    bool? saveHelp,
  }) {
    return OrganizationState(
      list: list ?? this.list,
      tobeVolunteer: tobeVolunteer ?? this.tobeVolunteer,
      checkBox: checkBox ?? this.checkBox,
      saveHelp: saveHelp ?? this.saveHelp,
    );
  }
}
