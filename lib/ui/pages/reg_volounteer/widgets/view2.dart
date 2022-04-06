import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/reg_volunteer_bloc/reg_volunteer_bloc.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/reg_volounteer/widgets/app_date_picker.dart';
import 'package:najot/ui/pages/reg_volounteer/widgets/img_view.dart';
import 'package:najot/ui/pages/reg_volounteer/widgets/volunteer_pass_info_dialog.dart';
import 'package:najot/ui/pages/reg_volounteer/widgets/volunteer_seccess_widget.dart';
import 'package:najot/ui/widgets/app_date_picker_widget.dart';
import 'package:najot/ui/widgets/app_text_field.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:provider/src/provider.dart';

import 'img_upload_widget.dart';

class View2 extends StatelessWidget {
  const View2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<RegVolunteerBloc>();
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: AppTextField(
                title: "Passport seriyasi",
                textInputType: TextInputType.name,
                onChanged: (v) {
                  bloc.add(VolunteerSerialChanged(v));
                },
                isFill: bloc.state.serial.isNotEmpty,
                initialText: bloc.state.serial,
                hintText: "(AA)",
              ),
            ),
            Expanded(
              child: AppTextField(
                title: "Passport raqami",
                textInputType: TextInputType.number,
                onChanged: (v) {
                  bloc.add(VolunteerSerialNumberChanged(v));
                },
                isFill: bloc.state.serialNumber.isNotEmpty,
                initialText: bloc.state.serialNumber,
                hintText: "(123456)",
              ),
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
        ).paddingOnly(top: 24),
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
                        builder: (ctx) => VolunteerSuccessWidget(
                          bloc: context.read<RegVolunteerBloc>(),
                        ),
                      );
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
            ).paddingOnly(top: 20),
            SizedBox(
              height: 20,
            )
          ],
        ).paddingSymmetric(horizontal: 20)
      ],
    );
  }
}