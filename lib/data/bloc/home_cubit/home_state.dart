part of 'home_cubit.dart';

class HomeState extends Equatable{
  HomeState({required this.sliderList});

  final List<SliderModel> sliderList;
  @override
  // TODO: implement props
  List<Object?> get props => [sliderList];


  HomeState copyWith({
  List<SliderModel>? list

}){
    return HomeState(sliderList: list ?? this.sliderList);
  }
}


