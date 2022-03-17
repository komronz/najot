import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_page.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_pages/user_update_widgets.dart';

import '../../../../data/services/navigator_service.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_widgets.dart';

class UserUpdatePage extends StatefulWidget {
  static const String routeName = "/userUpdatePage";

  const UserUpdatePage({Key? key}) : super(key: key);

  @override
  _UserUpdatePageState createState() => _UserUpdatePageState();
}

class _UserUpdatePageState extends State<UserUpdatePage> {
  List<bool> _selection=List.generate(2, (isSelect) => true);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              Container(
                color: Color(0xFFF6FCFA),
                child: AppWidgets.appBarMenu(
                  title: "edit_my_profile",
                  onTapMenu: () {},
                  visibleIcon: true,
                  onTapIcon: () {
                    NavigatorService.to.pushNamed(MyProfilePage.routeName);
                  },
                  icon: AppImageUtils.REMOVE,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(left: 19, right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColorUtils.WHITE,
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 107.w,
                          height: 129.h,
                          child: SvgPicture.asset(AppImageUtils.USERADD),
                        ).paddingOnly(top: 25, bottom: 24),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppWidgets.textLocale(
                                text: "Name",
                                color: Color(0xFF6D6E71),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400)
                                .paddingOnly(bottom: 8.h),
                            Container(
                              padding: EdgeInsets.only(left: 18),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color(0xFFFDFFFF),
                                  border: Border.all(
                                    width: 2,
                                    color: Color(0xFF79B4A8),
                                  )),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Fakhriyor",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      color: Color(0xFFBCBEC0),
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ).paddingOnly(bottom: 23.h),
                            AppWidgets.textLocale(
                                text: "Surname",
                                color: Color(0xFF6D6E71),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400).paddingOnly(bottom: 8.h),
                            Container(
                              padding: EdgeInsets.only(left: 18),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color(0xFFFDFFFF),
                                  border: Border.all(
                                    width: 2,
                                    color: Color(0xFF79B4A8),
                                  )),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Eshonov",
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      color: Color(0xFFBCBEC0),
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ).paddingOnly(bottom: 20.h),
                            AppWidgets.textLocale(
                                text: "Gender",
                                color: Color(0xFF6D6E71),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400).paddingOnly(bottom: 8.h),
                                Row(
                                  children: [
                                    toggle(title: "Man",isSelect: false),
                                    SizedBox(width: 24.w),
                                    toggle(title: "Woman",isSelect: true),
                                  ],
                                ),

                          ],
                        ).paddingOnly(bottom: 24.h),
                        Container(
                          width: 335.w,
                          padding: EdgeInsets.only(
                            top: 10,
                            bottom: 15,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xFF0BBF90),
                          ),
                          child: AppWidgets.textLocale(
                              text: "Save",
                              textAlign: TextAlign.center,
                              color: Color(0xFFFFFFFF),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
              ),


            ],
          )
      ),
    );
  }
}
