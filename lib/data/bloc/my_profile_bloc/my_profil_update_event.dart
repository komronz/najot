part of 'my_profil_update_bloc.dart';

@immutable
abstract class MyProfileUpdateEvent extends Equatable {
  const MyProfileUpdateEvent();
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
  final Gender isMan;

  GenderChanged(this.isMan);

  @override
  List<Object?> get props => [isMan];
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
class SendCode extends MyProfileUpdateEvent {

  @override
  List<Object?> get props => [];
}
class ImagePickers extends MyProfileUpdateEvent {
  @override
  List<Object?> get props => [];
}


