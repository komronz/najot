import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:najot/data/model/faq_model.dart';

part 'faq_state.dart';

class FaqCubit extends Cubit<FaqState> {
  FaqCubit() : super(FaqState());
  List<FaqModel> faqList = [
    FaqModel(
      title:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry?",
      text:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
      isOpen: false,
    ),
    FaqModel(
      title:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry?",
      text:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
      isOpen: false,
    ),
    FaqModel(
      title:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry?",
      text:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
      isOpen: false,
    ),
    FaqModel(
      title:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry?",
      text:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
      isOpen: false,
    ),
    FaqModel(
      title:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry?",
      text:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged",
      isOpen: false,
    ),
  ];

  Future getFaqList() async {
    emit(
      state.copyWith(
        hasLoading: true,
        hasError: false,
      ),
    );
    // await Future.delayed(Duration(milliseconds: 5000));
    if (faqList.isNotEmpty) {
      emit(
        state.copyWith(
          hasLoading: false,
          list: faqList,
        ),
      );
    } else {
      emit(
        state.copyWith(
          hasLoading: false,
          hasError: true,
        ),
      );
    }
  }

  Future openFaqItem(int index, bool isOpen) async {
    // List<FaqModel> list = List.from(state.list);
    faqList[index].isOpen = !(faqList[index].isOpen ?? false);
    emit(state.copyWith(list: faqList));
    getFaqList();
  }
}
