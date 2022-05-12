import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../my_products_page/my_products_page.dart';
import '../../volunteering_charity_history_page/volunteering_charity_history_page.dart';
import '../my_volunteering_page.dart';
import 'adding_project_page.dart';

class MyVolunteeringDrawerBody extends StatelessWidget {
  const MyVolunteeringDrawerBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColorUtils.WHITE,
      ),
      child: Drawer(
        child: Container(
          height: size.height * 0.35,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                child: SvgPicture.asset(
                  AppImageUtils.BACK_TO,
                  height: 35.w,
                  width: 35.w,
                ).paddingOnly(
                  left: 20,
                  bottom: 32,
                  top: 20,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ButtonCard(
                onPress: () {
                  NavigatorService.to.pushNamed(AddingProjectPage.routeName);
                },
                text: LocaleKeys.add_project,
                width: double.infinity,
                height: 44.w,
                color: AppColorUtils.ADD_PROJECT_COLOR,
                fontWeight: FontWeight.w600,
                textSize: 16.sp,
                textColor: AppColorUtils.BLUE_TEXT,
                visibleIcon: true,
                addIcon: AppImageUtils.ADDING,
                iconColor: AppColorUtils.BLUE_TEXT,
              ).paddingOnly(
                left: 20,
                bottom: 24,
                right: 20,
              ),
              AppWidgets.rowIconText(
                iconSelect: AppImageUtils.MAIN,
                icon: AppImageUtils.PROJECT,
                isActive: false,
                text: LocaleKeys.projects_and_ads,
                fontSize: 16.sp,
                padding: EdgeInsets.symmetric(
                  horizontal: 18.w,
                  vertical: 14,
                ),
                onTap: () {
                  // context
                  //     .read<AppPageCubit>()
                  //     .changePage(pageType: AppPageType.MAIN);
                  // Navigator.pop(context);
                },
              ),
              AppWidgets.rowIconText(
                isActive: true,
                icon: AppImageUtils.HISTORY,
                iconSelect: AppImageUtils.VOLUNTEER,
                text: LocaleKeys.my_volunteering,
                fontSize: 16.sp,
                padding: EdgeInsets.symmetric(
                  horizontal: 18.w,
                  vertical: 14,
                ),
                onTap: () {
                  NavigatorService.to
                      .pushReplacementNamed(MyVolunteeringPage.routeName);
                  // context.read<AppPageCubit>().changePage(
                  //   pageType: AppPageType.CHARITY,
                  // );
                  // Navigator.pop(context);
                },
              ),
              AppWidgets.rowIconText(
                icon: AppImageUtils.HISTORY,
                iconSelect: AppImageUtils.HISTORY2,
                text: LocaleKeys.charity_history,
                fontSize: 16.sp,
                padding: EdgeInsets.symmetric(
                  horizontal: 18.w,
                  vertical: 14,
                ),
                onTap: () {
                  NavigatorService.to.pushReplacementNamed(
                      VolunteeringCharityHistoryPage.routeName);
                  // context.read<AppPageCubit>().changePage(
                  //   pageType: AppPageType.ORDERS,
                  // );
                  // Navigator.pop(context);
                },
              ),
              AppWidgets.rowIconText(
                icon: AppImageUtils.PRODUCTS,
                iconSelect: AppImageUtils.PRODUCTS2,
                text: LocaleKeys.my_products,
                fontSize: 16.sp,
                padding: EdgeInsets.symmetric(
                  horizontal: 18.w,
                  vertical: 14,
                ),
                onTap: () {
                  NavigatorService.to
                      .pushReplacementNamed(MyProductsPage.routeName);
                  // context.read<AppPageCubit>().changePage(
                  //   pageType: AppPageType.ORDERS,
                  // );
                  // Navigator.pop(context);
                },
              ),
            ],
          ),
        ).paddingOnly(
          top: 20.w,
        ),
      ),
    );
  }
}
