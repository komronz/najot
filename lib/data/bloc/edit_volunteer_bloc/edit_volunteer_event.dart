part of 'edit_volunteer_bloc.dart';

@immutable
abstract class EditVolunteerEvent extends Equatable {
  const EditVolunteerEvent();
}

class EditProfileChangePage extends EditVolunteerEvent{
  EditProfileChangePage(this.changePage);
  final int changePage;
  @override
  // TODO: implement props
  List<Object?> get props =>[changePage];
}

class MyProfileLoad extends EditVolunteerEvent {
  const MyProfileLoad();

  @override
  List<Object?> get props => [];
}

class ImageChanged extends EditVolunteerEvent {
  final String imageUrl;

  const ImageChanged(this.imageUrl);

  @override
  List<Object?> get props => [imageUrl];
}

class FirstNameChanged extends EditVolunteerEvent {
  final String name;

  const FirstNameChanged(
      this.name,
      );

  @override
  List<Object?> get props => [name];
}

class PhoneChanged extends EditVolunteerEvent {
  final String phoneNumber;

  const PhoneChanged(
      this.phoneNumber,
      );

  @override
  List<Object?> get props => [phoneNumber];
}
class LastNameChanged extends EditVolunteerEvent {
  final String sureName;

  const LastNameChanged(this.sureName);

  @override
  List<Object?> get props => [sureName];
}
class GenderChanged extends EditVolunteerEvent {
  final Gender isMan;

  GenderChanged(this.isMan);

  @override
  List<Object?> get props => [isMan];
}
class PageChanged extends EditVolunteerEvent {
  final bool isVisible;

  PageChanged(this.isVisible);

  @override
  List<Object?> get props => [isVisible];
}
class PageNext extends EditVolunteerEvent {
  final bool isNext;

  PageNext(this.isNext);

  @override
  List<Object?> get props => [isNext];
}
class SaveIn extends EditVolunteerEvent {

  @override
  List<Object?> get props => [];
}
class SendCode extends EditVolunteerEvent {

  @override
  List<Object?> get props => [];
}
class ImagePickers extends EditVolunteerEvent {
  @override
  List<Object?> get props => [];
}


