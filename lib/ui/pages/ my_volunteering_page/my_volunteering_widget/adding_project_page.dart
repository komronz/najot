import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_text_field.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/localization/locale_keys.g.dart';
import 'drop_down_widget.dart';
import 'my_volunteering_drawer_body.dart';

class AddingProjectPage extends StatefulWidget {
  static const String routeName = '/addingProjectPage';

  const AddingProjectPage({Key? key}) : super(key: key);

  @override
  _AddingProjectPageState createState() => _AddingProjectPageState();
}

class _AddingProjectPageState extends State<AddingProjectPage> {
  List<String> projectName = [
    'Xayriya',
    'Volontyorlik',
    'Kroudfanding',

  ];
  List<String> projectType = [
    'Xayriya',
    'Volontyorlik',
    'Kroudfanding',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyVolunteeringDrawerBody(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
        title: Builder(
          builder: (context) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: SvgPicture.asset(
                  AppImageUtils.MENU,
                  height: 35.w,
                  width: 35.w,
                ),
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
              AppWidgets.textLocale(
                text: LocaleKeys.volunteering,
                fontSize: 26.sp,
                fontWeight: FontWeight.w600,
              ),
              SvgPicture.asset(
                AppImageUtils.NOTIFICATION,
                height: 35.w,
                width: 35.w,
                fit: BoxFit.fill,
              )
            ],
          ).paddingSymmetric(horizontal: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: AppWidgets.imageSvg(
                path: AppImageUtils.ADDING_PROJECT,
              ).paddingOnly(top: 18.h),
            ),
            AppWidgets.textLocale(
              text:
                  "Iltimos loyiha yoki e’lon qo’yish uchun kichik formani to’ldiring",
              maxLines: 2,
              color: AppColorUtils.DARK2,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
            ).paddingSymmetric(horizontal: 30),
            Text(
              "Loyiha nomi",
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColorUtils.DARK_4),
            ).paddingOnly(
              right: 20,
              left: 20,
              bottom: 10,
              top: 24,
            ),
            DropDownWidget(items: projectName).paddingOnly(
              bottom: 18,
            ),
            Text(
              "Loyiha yoki e'lon turi",
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColorUtils.DARK_4),
            ).paddingOnly(
              right: 20,
              left: 20,
              bottom: 10,
            ),
            DropDownWidget(items: projectType).paddingOnly(
              bottom: 18,
            ),
            AppTextField(
              isFill: true,
              isMultiLine: true,
              height: 145.w,
              hintText: "Qisqa malumot yozing yozing",
              onChanged: (v) {},
              textInputType: TextInputType.multiline,
              title: "Loyiha haqida qisqa ma'lumot",
            ),
            AppWidgets.appButton(
              title: "Ro'yxatdan o'tish",
              onTap: () {},
              textColor: Colors.white,
              color: AppColorUtils.PERCENT_COLOR,
            ).paddingSymmetric(
              horizontal: 20,
              vertical: 18,
            ),
          ],
        ),
      ),
    );
  }
}
