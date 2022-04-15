import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:najot/data/bloc/reg_volunteer_bloc/reg_volunteer_bloc.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/edit_volunteer_page/widgets/EditShowSuccess.dart';
import 'package:najot/ui/pages/reg_volounteer/widgets/app_date_picker.dart';
import 'package:najot/ui/pages/reg_volounteer/widgets/img_upload_widget.dart';
import 'package:najot/ui/pages/reg_volounteer/widgets/img_view.dart';
import 'package:najot/ui/pages/reg_volounteer/widgets/volunteer_pass_info_dialog.dart';
import 'package:najot/ui/pages/reg_volounteer/widgets/volunteer_seccess_widget.dart';
import 'package:najot/ui/widgets/app_date_picker_widget.dart';
import 'package:najot/ui/widgets/app_text_field.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:provider/src/provider.dart';

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
                      title: "Passport seriyasi",
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
                      title: "Passport raqami",
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
                hintText: "Toshkent shahar Yunsobod IIB",
                onChanged: (v) {
                  bloc.add(VolunteerGiveAddressChanged(v));
                },
                isFill: bloc.state.givenAddress.isNotEmpty,
                initialText: bloc.state.givenAddress,
                title: "Kim tomonidan berilgan",
                textInputType: TextInputType.name,
              ).paddingOnly(
                top: 24.w,
                left: 20.w,
                right: 20.w,
              ),
              AppDatePicker(
                title: "Qachon berilgan",
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (context) => AppDatePickerWidget(
                      selectFunction: (dateTime) {
                        print(dateTime.toUtc().toString());
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
                        text: "Passport rasmini yuklang",
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: AppColorUtils.DARK_4,
                      ),
                      GestureDetector(
                        child: AppWidgets.imageSvg(
                          path: AppImageUtils.IC_QUESTION,
                          width: 18.w,
                          height: 18.w,
                        ).paddingOnly(left: 6),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => VolunteerPassInfoDialog());
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
                            print("deletre");
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
                          title: " Pasportni ma'lumotlar sahifasi",
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: ImgUploadWidget(
                          deleteImg: () {
                            print("deletre");
                            context
                                .read<RegVolunteerBloc>()
                                .add(VolunteerPageImgDeleted(null));
                          },
                          onTapImg: () {
                            NavigatorService.to.pushNamed(
                              ImgView.routeName,
                              arguments: bloc.state.pageImgPath!.path,
                            );
                          },
                          title: " Ro’yxatga olinganligiz to’grisidagi sahifa",
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
            title: "Yuborish",
            onTap: bloc.state.sendBtnActive
                ? () async {
                    AppWidgets.showText(
                      text: "Next page",
                      duration: Duration(milliseconds: 800),
                    );
                    await showDialog(
                        context: context,
                        builder: (ctx) => EditShowSuccess(
                              bloc: context.read<RegVolunteerBloc>(),
                            ));
                  }
                : () {
                    AppWidgets.showText(
                      text: "Bo'sh maydonlarni to'ldiring",
                      duration: Duration(milliseconds: 800),
                    );
                  },
            color: bloc.state.sendBtnActive
                ? AppColorUtils.GREEN_APP
                : AppColorUtils.DISABLE_BC,
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
