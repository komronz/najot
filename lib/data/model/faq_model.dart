import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class FaqModel extends Equatable {
  String? title;
  String? text;
  bool? isOpen;

  FaqModel({
    this.title,
    this.text,
    this.isOpen,
  });

  @override
  List<Object?> get props => [title, text, isOpen];
}
