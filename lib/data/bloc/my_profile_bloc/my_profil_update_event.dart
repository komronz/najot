part of 'my_profil_update_bloc.dart';

@immutable
abstract class MyProfileUpdateEvent extends Equatable {
  const MyProfileUpdateEvent();
}
class EditProfileChangePage extends MyProfileUpdateEvent{
  EditProfileChangePage(this.changePage);
  final int changePage;
  @override
  // TODO: implement props
  List<Object?> get props =>[changePage];
}
class MyProfileLoad extends MyProfileUpdateEvent {
  const MyProfileLoad();

  @override
  List<Object?> get props => [];
}

class ImageChanged extends MyProfileUpdateEvent {
  final String imageUrl;

  const ImageChanged(this.imageUrl);

  @override
  List<Object?> get props => [imageUrl];
}

class FirstNameChanged extends MyProfileUpdateEvent {
  final String name;

  const FirstNameChanged(
    this.name,
  );

  @override
  List<Object?> get props => [name];
}

class PhoneChanged extends MyProfileUpdateEvent {
  final String phoneNumber;

  const PhoneChanged(
      this.phoneNumber,
      );

  @override
  List<Object?> get props => [phoneNumber];
}
class LastNameChanged extends MyProfileUpdateEvent {
  final String sureName;

  const LastNameChanged(this.sureName);

  @override
  List<Object?> get props => [sureName];
}
class GenderChanged extends MyProfileUpdateEvent {
  final String gender;

  GenderChanged(this.gender);

  @override
  List<Object?> get props => [gender];
}
class PageChanged extends MyProfileUpdateEvent {
  final bool isVisible;

  PageChanged(this.isVisible);

  @override
  List<Object?> get props => [isVisible];
}
class PageNext extends MyProfileUpdateEvent {
  final bool isNext;

  PageNext(this.isNext);

  @override
  List<Object?> get props => [isNext];
}
class SaveIn extends MyProfileUpdateEvent {

  @override
  List<Object?> get props => [];
}
class ChangeNumber extends MyProfileUpdateEvent {
  ChangeNumber(this.code);
    int code;
  @override
  List<Object?> get props => [];
}
class SendCode extends MyProfileUpdateEvent {

  @override
  List<Object?> get props => [];
}
class ImagePickers extends MyProfileUpdateEvent {
  @override
  List<Object?> get props => [];
}
class SaveImagePickers extends MyProfileUpdateEvent {
  final File userImgPath;
  SaveImagePickers(this.userImgPath);

  @override
  List<Object?> get props => [userImgPath];
}



