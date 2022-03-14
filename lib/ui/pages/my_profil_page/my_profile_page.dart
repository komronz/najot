import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/localization/locale_keys.g.dart';
import '../../../data/utils/app_color_utils.dart';
import '../../../data/utils/app_image_utils.dart';
import '../../widgets/app_widgets.dart';
import '../home_page/home_page.dart';

class MyProfilePage extends StatefulWidget {
  static const String routeName = "/myProfilePage";

  const MyProfilePage({Key? key}) : super(key: key);

  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                color: Color(0xFFF6FCFA),
                height: 80,
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: SvgPicture.asset(AppImageUtils.MENU),
                      onTap: () {
                      },
                    ),
                    AppWidgets.textLocale(
                      text: "My Profile",
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF414042)
                    ),
                    SvgPicture.asset(AppImageUtils.EDIT)
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    color: AppColorUtils.WHITE,
                    child: Column(
                      children: [
                        SizedBox(height: 25.h),
                        Container(
                          width: 107.w,
                          height: 107.h,
                          child: SvgPicture.asset(AppImageUtils.USER),
                        ),
                        SizedBox(height: 12.h),


                      ],
                    ),
                  ),
              ),
            ],
          ),

        ),
    );
  }
}
