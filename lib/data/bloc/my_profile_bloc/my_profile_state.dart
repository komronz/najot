part of 'my_profile_cubit.dart';

@immutable
class MyProfileState extends Equatable {
  MyProfileState({required this.isVisibled});

  final bool isVisibled;
  @override
  // TODO: implement props
  List<Object?> get props => [isVisibled];


  MyProfileState copyWith({
    bool? isVisibled
  }){
    return MyProfileState(isVisibled: isVisibled ?? this.isVisibled);
  }
}



