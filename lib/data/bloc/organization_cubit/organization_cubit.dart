import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:najot/data/model/organization_model.dart';

part 'organization_state.dart';

class OrganizationCubit extends Cubit<OrganizationState> {
  OrganizationCubit() : super(OrganizationState(checkBox: false));



  void load(){

    var list= OrganizationModel.lists;

    emit(state.copyWith(list: list));

  }
  void onTapCheckBox(bool v) {
    emit(state.copyWith(checkBox: v));
  }

  Future onChangeSave(bool v) async{
    emit(state.copyWith(saveHelp: v));
  }

}
