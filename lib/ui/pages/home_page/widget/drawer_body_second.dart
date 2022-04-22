import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/bloc/app_page_cubit/app_page_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:provider/src/provider.dart';

class DrawerBodySecond extends StatelessWidget {
   DrawerBodySecond({required this.state}) ;

  AppPageState state;

  @override
  Widget build(BuildContext context) {
    AppPageType pageType = context.read<AppPageCubit>().state.pageType;
    return Container(
      width: 266.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColorUtils.WHITE,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            child: Container(
              width: 31,
              height: 34,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColorUtils.BACK_BUTTON,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(AppImageUtils.BACK_ICON),
            ),
            onTap: () {
              context.read<AppPageCubit>().changeMenu(1);
              print("2222");
            },
          ).paddingOnly(
            top: 50.w,
            left: 20.w,
          ),
          ButtonCard(
            height: 48.w,
            width: MediaQuery.of(context).size.width,
            onPress: () {},
            visibleIcon: true,
            addIcon: AppImageUtils.PLUS,
            text: "Loyiha qo'shish",
            color: AppColorUtils.ADD_PROJECT_COLOR,
            textColor: AppColorUtils.VOLONTYOR,
            fontWeight: FontWeight.w600,
            textSize: 16.sp,
          ).paddingOnly(
            top: 32.w,
            bottom: 24.w,
            left: 20.w,
            right: 20.w,
          ),

          AppWidgets.rowIconText(
            isActive: pageType == AppPageType.PROJECT,
            icon: AppImageUtils.PROJECT1,
            iconSelect: AppImageUtils.PROJECT2,
            text: "Loyiha va e'lonlarim",
            fontSize: 16.sp,
            padding: EdgeInsets.symmetric(
              horizontal: 18.w,
              vertical: 14,
            ),
            onTap: () {
              context.read<AppPageCubit>().changePage(
                pageType: AppPageType.PROJECT,
              );
            },
          ),
          state.tobeVolunteer
          ? AppWidgets.rowIconText(
            isActive: pageType == AppPageType.VOLUNTEERING,
            icon: AppImageUtils.TOBE_VOLUNTEER,
            iconSelect: AppImageUtils.TOBE_VOLUNTEER2,
            text: "Volontyorlik faoliyatim",
            fontSize: 16.sp,
            padding: EdgeInsets.symmetric(
              horizontal: 18.w,
              vertical: 14,
            ),
            onTap: () {
              context.read<AppPageCubit>().changePage(
                pageType: AppPageType.VOLUNTEERING,
              );
            },
          ) : SizedBox(),
          AppWidgets.rowIconText(
            isActive: pageType == AppPageType.CHARITY,
            icon: AppImageUtils.HISTORY,
            iconSelect: AppImageUtils.HISTORY2,
            text: LocaleKeys.charity_history,
            fontSize: 16.sp,
            padding: EdgeInsets.symmetric(
              horizontal: 18.w,
              vertical: 14,
            ),
            onTap: () {
              context.read<AppPageCubit>().changePage(
                    pageType: AppPageType.CHARITY,
                  );
              Navigator.pop(context);
            },
          ),
          AppWidgets.rowIconText(
            isActive: pageType == AppPageType.ORDERS,
            icon: AppImageUtils.PRODUCTS,
            iconSelect: AppImageUtils.PRODUCTS2,
            text: LocaleKeys.my_products,
            fontSize: 16.sp,
            padding: EdgeInsets.symmetric(
              horizontal: 18.w,
              vertical: 14,
            ),
            onTap: () {
              context.read<AppPageCubit>().changePage(
                    pageType: AppPageType.ORDERS,
                  );
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
