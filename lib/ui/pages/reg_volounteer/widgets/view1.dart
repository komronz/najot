import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/app_page_cubit/app_page_cubit.dart';
import 'package:najot/data/bloc/reg_volunteer_bloc/reg_volunteer_bloc.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/ui/pages/reg_volounteer/widgets/app_date_picker.dart';
import 'package:najot/ui/widgets/app_date_picker_widget.dart';
import 'package:najot/ui/widgets/app_radio_button.dart';
import 'package:najot/ui/widgets/app_text_field.dart';

import 'next_button_widget.dart';

class View1 extends StatelessWidget {
  const View1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<RegVolunteerBloc>();
    return Column(
      children: [
        AppTextField(
          hintText: "",
          enabled: false,
          initialText: AppPageCubit.to.state.user!.firstName ?? "",
          onChanged: (v) {
            bloc.add(VolunteerFirstNameChanged(v));
          },
          isFill: bloc.state.firstName.isNotEmpty,
          title: LocaleKeys.name_passport,
        ).paddingSymmetric(horizontal: 20.w),
        AppTextField(
          hintText: "",
          enabled: false,
          initialText: AppPageCubit.to.state.user!.lastName ?? "",
          onChanged: (v) {
            bloc.add(VolunteerLastNameChanged(v));
          },
          title: LocaleKeys.name_passport,
          isFill: bloc.state.lastName.isNotEmpty,
        ).paddingSymmetric(
          horizontal: 20.w,
          vertical: 10.w,
        ),
        AppTextField(
          hintText: LocaleKeys.enter_the_address.tr(),
          initialText: bloc.state.address,
          onChanged: (v) {
            bloc.add(VolunteerAddressChanged(v));
          },
          title: LocaleKeys.address,
          isFill: bloc.state.address.isNotEmpty,
        ).paddingSymmetric(horizontal: 20.w),
        AppRadioButton(
          initial: bloc.state.gender,
          onChanged: (v) {
            bloc.add(VolunteerGenderChanged(v));
          },
        ).paddingOnly(top: 20.w, left: 20.w),
        AppDatePicker(
          title: LocaleKeys.your_date_of_birth.tr(),
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
        ).paddingOnly(right: 20.w)
      ],
    );
  }
}
