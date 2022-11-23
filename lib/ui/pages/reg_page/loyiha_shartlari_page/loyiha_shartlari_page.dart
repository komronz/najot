import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/utils/app_image_utils.dart';

import '../../../../data/utils/app_color_utils.dart';
import '../../../widgets/app_widgets.dart';

/// RegPage uchun LoyihaShartlariPage
///
class LoyihaShartlariPage extends StatelessWidget {
  const LoyihaShartlariPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorUtils.BACKGROUND,
      appBar: AppBar(
        title: AppWidgets.textLocale(
          text: "Loyiha Shartlari",
          fontSize: 26,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 335.h,
              width: 295.w,
              child: SvgPicture.asset(AppImageUtils.LOYIHASHARTLARI_RULES),
            ),
            SizedBox(height: 32.h),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  qoidaWidget(),
                  qoidaWidget(),
                ],
              ),
            ),
          ],
        ).paddingOnly(
          top: 29.h,
          left: 20.w,
          right: 20.w,
          bottom: 34.h,
        ),
      ),
    );
  }

  Column qoidaWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "1. Umumiy qoidalar",
          style: TextStyle(
            color: AppColorUtils.DARK_1,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          """It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
                  """,
          style: TextStyle(
            color: AppColorUtils.DARK3,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 25.h),
        Text(
          """It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).
                  """,
          style: TextStyle(
            color: AppColorUtils.DARK3,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
