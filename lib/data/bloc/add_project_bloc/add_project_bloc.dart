import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot/data/bloc/add_project_bloc/add_project_event.dart';
import 'package:najot/data/bloc/add_project_bloc/add_project_state.dart';
import 'package:najot/data/model/add_project.dart';
import 'package:najot/data/services/add_project_service.dart';

class AddProjectBloc extends Bloc<AddProjectEvent, AddProjectState> {

  AddProjectBloc(): super(AddProjectState()) {
    on<AddProjectNameChanged>(_onNameChanged);
    on<AddProjectTypeChanged>(_onTypeChanged);
    on<AddProjectDescriptionChanged>(_onDescriptionChanged);
    on<AddProjectAddWhoChanged>(_onAddWhoChanged);
    on<AddProjectBtnEvent>(_onBtnPressed);
    on<SendDateEvent>(_onBtnSend);
  }

  final AddProjectService addProjectService=AddProjectService();
  Future _onNameChanged(
      AddProjectNameChanged event,
      Emitter<AddProjectState> emit,
      ) async {
    emit(
      state.copyWith(
        name: event.name,
        nameFill: _isNotEmpty(event.name),
        isBtnActive: _nextBtnActive(
          event.name,
          state.type,
          state.whoAdd,
          state.description
        ),
      ),
    );
  }

  bool _isNotEmpty(String? value) {
    if(value!=null){
      return value.trim().isNotEmpty;
    }
   return true;
  }
  bool _isEmpty(String value) {
    return value.trim().isEmpty;
  }


  bool _nextBtnActive(
      String name,
      String? type,
      String? whoAdd,
      String description,
      ) {
    if (_isNotEmpty(name) &&
        _isNotEmpty(type) &&
        _isNotEmpty(description) &&
        _isNotEmpty(whoAdd)) {
      return true;
    }
    return false;
  }

  Future _onTypeChanged(
      AddProjectTypeChanged event,
      Emitter<AddProjectState> emit,
      ) async {
    emit(
      state.copyWith(
        type: event.type,
        typeFill: _isNotEmpty(event.type),
        isBtnActive: _nextBtnActive(
            state.name,
            event.type,
            state.whoAdd,
            state.description
        ),
      ),
    );
  }

  Future _onDescriptionChanged(
      AddProjectDescriptionChanged event,
      Emitter<AddProjectState> emit,
      ) async {
    emit(
      state.copyWith(
        description: event.description,
        descriptionFill: _isNotEmpty(event.description),
        isBtnActive: _nextBtnActive(
            state.name,
            state.type,
            state.whoAdd,
            event.description
        ),
      ),

    );
  }
  Future _onAddWhoChanged(
      AddProjectAddWhoChanged event,
      Emitter<AddProjectState> emit,
      ) async {
    emit(
      state.copyWith(
        whoAdd: event.addWho,
        whoAddFill: _isNotEmpty(event.addWho),
        isBtnActive: _nextBtnActive(
            state.name,
            state.type,
            event.addWho,
            state.description
        ),
      ),

    );
  }

  Future _onBtnPressed(
      AddProjectBtnEvent event,
      Emitter<AddProjectState> emit,
      ) async {
    emit(
      AddProjectState(
          name: "",
          description: ""
      ),

    );
  }
  Future _onBtnSend(
      SendDateEvent event,
      Emitter<AddProjectState> emit,
      ) async {
    AddProjectModel? addProjectModel =await addProjectService.postModel(state.whoAdd!,
        state.name, state.type!, state.description,);
    if(addProjectModel !=null){
      emit(state.copyWith(isLoading: true));
    }else{
      emit(state.copyWith(hasError: true));
    }
  }
}
