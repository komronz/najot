import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot/data/bloc/reg_volunteer_bloc/reg_volunteer_bloc.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/ui/pages/reg_volounteer/widgets/app_date_picker.dart';
import 'package:najot/ui/widgets/app_date_picker_widget.dart';
import 'package:najot/ui/widgets/app_radio_button.dart';
import 'package:najot/ui/widgets/app_text_field.dart';

import 'next_button_widget.dart';

class View1 extends StatefulWidget {
  const View1({Key? key}) : super(key: key);

  @override
  _View1State createState() => _View1State();
}

class _View1State extends State<View1> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    var bloc = context.read<RegVolunteerBloc>();
    return Column(
      children: [
        AppTextField(
          hintText: "Abdumalik",
          initialText: bloc.state.firstName,
          onChanged: (v) {
            bloc.add(VolunteerFirstNameChanged(v));
          },
          isFill: bloc.state.firstName.isNotEmpty,
          title: "Ism (pasportda qanday bo'lsa)",
        ).paddingOnly(top: 18),
        AppTextField(
          hintText: "Sapokulov",
          initialText: bloc.state.lastName,
          onChanged: (v) {
            bloc.add(VolunteerLastNameChanged(v));
          },
          title: "Familiya (pasportda qanday bo'lsa)",
          isFill: bloc.state.lastName.isNotEmpty,
        ).paddingOnly(top: 24),
        AppTextField(
          hintText: "Manzilni kiriting",
          initialText: bloc.state.address,
          onChanged: (v) {
            bloc.add(VolunteerAddressChanged(v));
          },
          title: "Manzil",
          isFill: bloc.state.address.isNotEmpty,
        ).paddingOnly(top: 24),
        AppRadioButton(
          initial: bloc.state.gender,
          onChanged: (v) {
            bloc.add(VolunteerGenderChanged(v));
          },
        ).paddingOnly(top: 20, left: 20),
        AppDatePicker(
          title: "Tug'ilgan sanangiz",

          onTap: () async {
            await showDialog(
              context: context,
              builder: (context) => AppDatePickerWidget(
                selectFunction: (dateTime) {
                  // print(dateTime.toUtc().toString());
                  bloc.add(VolunteerBirthDateSelected(dateTime));
                },
              ),
            );
          },
          text: bloc.state.birthDate,
        ),
        NextButtonWidget(
          onTap: () {
            bloc.pageController.nextPage(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOutSine,
            );
          },
          isActive: bloc.state.isActiveNextBtn,
        ).paddingOnly(right: 20)
      ],
    );
  }
}

