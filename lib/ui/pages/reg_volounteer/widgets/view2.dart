import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:najot/data/bloc/reg_volunteer_bloc/reg_volunteer_bloc.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/data/utils/app_logger_util.dart';
import 'package:najot/ui/pages/reg_volounteer/widgets/app_date_picker.dart';
import 'package:najot/ui/widgets/app_date_picker_widget.dart';
import 'package:najot/ui/widgets/app_text_field.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:provider/src/provider.dart';

class View2 extends StatefulWidget {
  const View2({Key? key}) : super(key: key);

  @override
  _View2State createState() => _View2State();
}

class _View2State extends State<View2> {
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

                },
                hintText: "(AA)",
              ),
            ),
            Expanded(
              child: AppTextField(
                title: "Passport raqami",
                textInputType: TextInputType.number,
                onChanged: (v) {},
                hintText: "(123456)",
              ),
            )
          ],
        ).paddingOnly(top: 15),
        AppTextField(
          hintText: "Toshkent shahar Yunsobod IIB",
          onChanged: (v) {},
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
                },
              ),
            );
          },
          text: null,
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
                AppWidgets.imageSvg(
                  path: AppImageUtils.IC_QUESTION,
                  width: 18.w,
                  height: 18.w,
                ).paddingOnly(left: 6)
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ImgUploadWidget(
                    uploadBtn: () async {
                      XFile? pickedFile = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        File imageFile = File(pickedFile.path);
                        AppLoggerUtil.i(imageFile.path.toString());
                      }
                    },
                    isUploaded: false,
                    title: " Pasportni ma'lumotlar sahifasi",
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: ImgUploadWidget(
                    title: " Ro’yxatga olinganligiz to’grisidagi sahifa",
                    uploadBtn: () {},
                    isUploaded: false,
                  ),
                ),
              ],
            ),
            AppWidgets.appButton(title: "Yuborish", onTap: () {})
                .paddingOnly(top: 20),
            SizedBox(
              height: 20,
            )
          ],
        ).paddingSymmetric(horizontal: 20)
      ],
    );
  }
}

class ImgUploadWidget extends StatelessWidget {
  final bool isUploaded;
  final VoidCallback uploadBtn;
  final String title;

  const ImgUploadWidget({
    required this.uploadBtn,
    required this.title,
    this.isUploaded = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DottedBorder(
          borderType: BorderType.RRect,
          strokeWidth: 1,
          radius: Radius.circular(12),
          color: AppColorUtils.DOT_COLOR,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: isUploaded
                ? Container(
                    height: 114.w,
                    width: double.infinity,
                    child: AppWidgets.imageAsset(path: AppImageUtils.IMG_ABOUT),
                  )
                : Container(
                    height: 114.w,
                    color: Color(0xFFFDFFFF),
                    child: Center(
                      child: ClipOval(
                        child: Material(
                          color: AppColorUtils.PERCENT_COLOR,
                          child: InkWell(
                            splashColor: AppColorUtils.DISABLE_BC,
                            onTap: uploadBtn,
                            child: SizedBox(
                              width: 35.w,
                              height: 35.w,
                              child: AppWidgets.imageSvg(
                                  path: AppImageUtils.IC_UPLOAD,
                                  fit: BoxFit.none),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ),
        isUploaded
            ? Row(
                children: [
                  AppWidgets.imageSvg(
                    path: AppImageUtils.IC_SUCCESS,
                    width: 12,
                    height: 12,
                  ),
                  AppWidgets.textLocale(
                    text: "Yuklandi",
                    color: AppColorUtils.SUCCESS_GREEN,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ).paddingOnly(left: 2)
                ],
              ).paddingOnly(top: 10)
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppWidgets.text(
                    text: '*',
                    color: AppColorUtils.RED,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                  Expanded(
                    child: AppWidgets.text(
                      text: title,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColorUtils.GRAY_4,
                      maxLines: 2,
                      fontStyle: FontStyle.italic,
                      height: 1.5,
                    ),
                  )
                ],
              ).paddingOnly(top: 10)
      ],
    ).paddingOnly(top: 8);
  }
}
