import 'package:equatable/equatable.dart';

class AddProjectState extends Equatable {
  final String? whoAdd;
  final String name;
  final String? type;
  final String description;
  final bool nameFill;
  final bool whoAddFill;
  final bool typeFill;
  final bool descriptionFill;
  final bool isBtnActive;
  final bool hasError;
  final bool isLoading;


  const AddProjectState({
    this.whoAdd,
    this.name = '',
    this.type,
    this.description = '',
    this.nameFill = false,
    this.descriptionFill = false,
    this.typeFill = false,
    this.whoAddFill = false,
    this.isBtnActive = false,
    this.hasError = false,
    this.isLoading = false,
  });

  @override
  List<Object?> get props => [
    whoAdd,
    name,
    type,
    description,
    whoAddFill,
    isBtnActive,
    nameFill,
    descriptionFill,
    typeFill,
    hasError,
    isLoading
  ];

  AddProjectState copyWith({
    int user=1,
    String? whoAdd,
    String? name,
    String? type,
    String? description,
    bool? nameFill,
    bool? whoAddFill,
    bool? typeFill,
    bool? descriptionFill,
    bool? isBtnActive,
    bool? hasError,
    bool? isLoading,
  }) {
    return AddProjectState(
      whoAdd: whoAdd ?? this.whoAdd,
      name: name ?? this.name,
      type: type ?? this.type,
      description: description ?? this.description,
      nameFill: nameFill ?? this.nameFill,
      whoAddFill: whoAddFill ?? this.whoAddFill,
      typeFill: typeFill ?? this.typeFill,
      descriptionFill: descriptionFill??this.descriptionFill,
      isBtnActive: isBtnActive??this.isBtnActive,
      hasError: hasError ?? this.hasError,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
