import 'package:equatable/equatable.dart';

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
