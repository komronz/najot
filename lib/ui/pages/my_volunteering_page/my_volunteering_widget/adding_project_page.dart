import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/my_volunteering_page/my_volunteering_page.dart';
import 'package:najot/ui/widgets/app_text_field.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/localization/locale_keys.g.dart';
import '../../home_page/home_page.dart';
import '../../notification_page/notification_page.dart';
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
                onTap: () {

                  HomePage.globalKey.currentState!.openDrawer();
                },
                child: SvgPicture.asset(
                  AppImageUtils.MENU,
                  height: 35.w,
                  width: 35.w,
                ),
              ),
              AppWidgets.textLocale(
                text: LocaleKeys.volunteering,
                fontSize: 26.sp,
                fontWeight: FontWeight.w600,
              ),
              InkWell(
                onTap: (){
                  NavigatorService.to.pushNamed(NotificationPage.routeName);
                },
                child: SvgPicture.asset(
                  AppImageUtils.NOTIFICATION,
                  height: 35.w,
                  width: 35.w,
                  fit: BoxFit.fill,
                ),
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
                  color: AppColorUtils.DARK_4,
              ),
            ).paddingOnly(
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
                  color: AppColorUtils.DARK_4,
              ),
            ).paddingOnly(
              bottom: 10,
            ),
            DropDownWidget(items: projectType).paddingOnly(
              bottom: 18,
            ),
            AppTextField(
              isFill: true,
              isMultiLine: true,
              height: 145.w,
              hintText: "Qisqa malumot yozing",
              onChanged: (v) {},
              textInputType: TextInputType.multiline,
              title: "Loyiha haqida qisqa ma'lumot",
            ),
            AppWidgets.appButton(
              title: LocaleKeys.send,
              onTap: () {
                NavigatorService.to.pushReplacementNamed(MyVolunteeringPage.routeName);
              },
              textColor: Colors.white,
              color: AppColorUtils.PERCENT_COLOR,
            ).paddingSymmetric(
              vertical: 18,
            ),
          ],
        ).paddingSymmetric(horizontal: 20.w),
      ),
    );
  }
}
