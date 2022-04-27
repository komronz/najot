import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../data/services/navigator_service.dart';
import '../notification_page/notification_page.dart';

class RulesPage extends StatelessWidget {
  const RulesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorUtils.BACKGROUND,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              child: SvgPicture.asset(
                AppImageUtils.MENU,
                height: 35.w,
                width: 35.w,
              ),
              onTap: () {
                HomePage.globalKey.currentState!.openDrawer();
              },
            ),
            AppWidgets.textLocale(
              text: LocaleKeys.project_rules,
              fontSize: 26.sp,
              fontWeight: FontWeight.w600,
            ),

            InkWell(
              onTap: (){
                NavigatorService.to.pushNamed(NotificationPage.routeName,);
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppWidgets.imageSvg(
              path: AppImageUtils.IMG_RULES,
              width: context.width,
              height: 295.w,
            ).paddingOnly(
              left: 20,
              right: 20,
              top: 30,
            ),
            Column(
              children: List.generate(
                2,
                (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppWidgets.text(
                      text: LocaleKeys.general_rules.tr(),
                      color: AppColorUtils.BLACK,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ).paddingOnly(top: 20),
                    AppWidgets.text(
                      text:
                          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                      maxLines: 100,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColorUtils.DARK3,
                      height: 1.2,
                    ).paddingOnly(top: 10),
                  ],
                ),
              ),
            ).paddingSymmetric(horizontal: 20, vertical: 30)
          ],
        ),
      ),
    );
  }
}
