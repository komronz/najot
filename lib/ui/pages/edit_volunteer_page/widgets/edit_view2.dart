import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:najot/data/bloc/reg_volunteer_bloc/reg_volunteer_bloc.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/edit_volunteer_page/widgets/edit_show_success.dart';
import 'package:najot/ui/pages/reg_volounteer/widgets/app_date_picker.dart';
import 'package:najot/ui/pages/reg_volounteer/widgets/img_upload_widget.dart';
import 'package:najot/ui/pages/reg_volounteer/widgets/img_view.dart';
import 'package:najot/ui/pages/reg_volounteer/widgets/volunteer_pass_info_dialog.dart';
import 'package:najot/ui/widgets/app_date_picker_widget.dart';
import 'package:najot/ui/widgets/app_text_field.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class EditView2 extends StatelessWidget {
  EditView2({Key? key}) : super(key: key);
  final maskFormatter = MaskTextInputFormatter(mask: 'AA');
  final maskFormatter1 = MaskTextInputFormatter();

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<RegVolunteerBloc>();
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      inputFormatter: bloc.state.inputFormatter,
                      title: LocaleKeys.passport_series.tr(),
                      textInputType: TextInputType.name,
                      onChanged: (v) {
                        bloc.add(VolunteerSerialChanged(v));
                      },
                      isFill: bloc.state.serial.isNotEmpty,
                      initialText: bloc.state.serial,
                      hintText: "(AA)",
                    ).paddingOnly(left: 20.w, right: 10.w),
                  ),
                  Expanded(
                    child: AppTextField(
                      inputFormatter: bloc.state.inputFormatter,
                      title: LocaleKeys.passport_number.tr(),
                      textInputType: TextInputType.number,
                      onChanged: (v) {
                        bloc.add(VolunteerSerialNumberChanged(v));
                      },
                      isFill: bloc.state.serialNumber.isNotEmpty,
                      initialText: bloc.state.serialNumber,
                      hintText: "(123456)",
                    ).paddingOnly(left: 10.w, right: 20.w),
                  )
                ],
              ).paddingOnly(top: 15),
              AppTextField(
                hintText: LocaleKeys.tashkent_city_yunsabad.tr(),
                onChanged: (v) {
                  bloc.add(VolunteerGiveAddressChanged(v));
                },
                isFill: bloc.state.givenAddress.isNotEmpty,
                initialText: bloc.state.givenAddress,
                title: LocaleKeys.given_by.tr(),
                textInputType: TextInputType.name,
              ).paddingOnly(
                top: 24.w,
                left: 20.w,
                right: 20.w,
              ),
              AppDatePicker(
                title: LocaleKeys.when_given.tr(),
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (context) => AppDatePickerWidget(
                      selectFunction: (dateTime) {
                        bloc.add(VolunteerGiveDateSelected(dateTime));
                      },
                    ),
                  );
                },
                text: bloc.state.givenDate,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppWidgets.text(
                        text: LocaleKeys.upload_passport_photo.tr(),
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: AppColorUtils.dark4,
                      ),
                      GestureDetector(
                        child: AppWidgets.imageSvg(
                          path: AppImageUtils.icQuestion,
                          width: 18.w,
                          height: 18.w,
                        ).paddingOnly(left: 6),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) =>
                                  const VolunteerPassInfoDialog());
                        },
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ImgUploadWidget(
                          deleteImg: () {
                            bloc.add(VolunteerPassImgDeleted());
                          },
                          onTapImg: () {
                            NavigatorService.to.pushNamed(
                              ImgView.routeName,
                              arguments: bloc.state.passportImgPath!.path,
                            );
                          },
                          uploadBtn: () async {
                            bloc.add(VolunteerPassImgUploaded());
                          },
                          img: bloc.state.passportImgPath,
                          title: LocaleKeys.passport_information_page.tr(),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: ImgUploadWidget(
                          deleteImg: () {
                            context
                                .read<RegVolunteerBloc>()
                                .add(const VolunteerPageImgDeleted(null));
                          },
                          onTapImg: () {
                            NavigatorService.to.pushNamed(
                              ImgView.routeName,
                              arguments: bloc.state.pageImgPath!.path,
                            );
                          },
                          title: LocaleKeys.registration_page.tr(),
                          uploadBtn: () {
                            bloc.add(VolunteerPageImgUploaded());
                          },
                          img: bloc.state.pageImgPath,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.w,
                  )
                ],
              ).paddingSymmetric(horizontal: 20.w),
            ],
          ),
          AppWidgets.appButton(
            title: LocaleKeys.send.tr(),
            onTap: bloc.state.sendBtnActive
                ? () async {
                    AppWidgets.showText(
                      text: LocaleKeys.next_page.tr(),
                      duration: const Duration(milliseconds: 800),
                    );
                    await showDialog(
                        context: context,
                        builder: (ctx) => EditShowSuccess(
                              bloc: context.read<RegVolunteerBloc>(),
                            ));
                  }
                : () {
                    AppWidgets.showText(
                      text: LocaleKeys.fill_in_the_blanks.tr(),
                      duration: const Duration(milliseconds: 800),
                    );
                  },
            color: bloc.state.sendBtnActive
                ? AppColorUtils.greenApp
                : AppColorUtils.disableBc,
          ).paddingOnly(
            bottom: 30.w,
            top: 90.h,
            left: 20.w,
            right: 20.w,
          ),
        ],
      ),
    );
  }
}
