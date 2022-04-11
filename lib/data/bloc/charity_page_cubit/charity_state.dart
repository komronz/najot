part of 'charity_cubit.dart';


 class CharityState extends Equatable{
  CharityState({ this.list=const []});
  List<CardModel> list;

  @override
  // TODO: implement props
  List<Object?> get props => [list];

  CharityState copyWith({
   List<CardModel>? list
  }) {
   return CharityState(
       list: list ?? this.list

   );
  }


 }


