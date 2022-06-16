import 'package:equatable/equatable.dart';

abstract class AddProjectEvent extends Equatable {
  const AddProjectEvent();
}
class AddProjectAddWhoChanged extends AddProjectEvent {
  final String addWho;

  AddProjectAddWhoChanged(this.addWho);

  @override
  List<Object?> get props => [addWho];
}

class AddProjectNameChanged extends AddProjectEvent {
  final String name;

  AddProjectNameChanged(this.name);

  @override
  List<Object?> get props => [name];
}

class AddProjectTypeChanged extends AddProjectEvent {
  final String type;

  AddProjectTypeChanged(this.type);

  @override
  List<Object?> get props => [type];
}

class AddProjectDescriptionChanged extends AddProjectEvent {
  final String description;

  AddProjectDescriptionChanged(this.description);

  @override
  List<Object?> get props => [description];
}

class AddProjectBtnEvent extends AddProjectEvent {

  @override
  List<Object?> get props => [];
}

class SendDateEvent extends AddProjectEvent {
  @override
  List<Object?> get props => [];
}
