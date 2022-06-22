import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/bloc/app_page_cubit/app_page_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class DrawerBodySecond extends StatelessWidget {
  const DrawerBodySecond({Key? key, required this.state}) : super(key: key);

  final AppPageState state;

  @override
  Widget build(BuildContext context) {
    AppPageType pageType = context.read<AppPageCubit>().state.pageType;
    return Container(
      width: 315.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColorUtils.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            child: Container(
              width: 31,
              height: 34,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColorUtils.backButton,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(AppImageUtils.backIcon),
            ),
            onTap: () {
              context.read<AppPageCubit>().changeMenu(1);
            },
          ).paddingOnly(
            top: 50.w,
            left: 20.w,
          ),
          ButtonCard(
            height: 48.w,
            width: MediaQuery.of(context).size.width,
            onPress: () {
              context.read<AppPageCubit>().changePage(
                    pageType: AppPageType.addProject,
                  );
              Navigator.pop(context);
            },
            visibleIcon: true,
            addIcon: AppImageUtils.plus,
            text: LocaleKeys.add_project.tr(),
            color: AppColorUtils.addProjectColor,
            textColor: AppColorUtils.volontyor,
            fontWeight: FontWeight.w600,
            textSize: 16.sp,
          ).paddingOnly(
            top: 32.w,
            bottom: 24.w,
            left: 20.w,
            right: 20.w,
          ),
          AppWidgets.rowIconText(
            isActive: pageType == AppPageType.project,
            icon: AppImageUtils.project1,
            iconSelect: AppImageUtils.project2,
            text: LocaleKeys.projects_and_ads.tr(),
            fontSize: 16.sp,
            padding: EdgeInsets.symmetric(
              horizontal: 18.w,
              vertical: 14,
            ),
            onTap: () {
              context.read<AppPageCubit>().changePage(
                    pageType: AppPageType.project,
                  );
              Navigator.pop(context);
            },
          ),
          state.tobeVolunteer
              ? AppWidgets.rowIconText(
                  isActive: pageType == AppPageType.volunteering,
                  icon: AppImageUtils.tobeVolunteer,
                  iconSelect: AppImageUtils.tobeVolunteer2,
                  text: LocaleKeys.my_volunteering.tr(),
                  fontSize: 16.sp,
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                    vertical: 14,
                  ),
                  onTap: () {
                    context.read<AppPageCubit>().changePage(
                          pageType: AppPageType.volunteering,
                        );
                    Navigator.pop(context);
                  },
                )
              : const SizedBox(),
          state.tobeVolunteer
              ? AppWidgets.rowIconText(
                  isActive: pageType == AppPageType.charityVolunteer,
                  icon: AppImageUtils.history,
                  iconSelect: AppImageUtils.history2,
                  text: LocaleKeys.charity_history,
                  fontSize: 16.sp,
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                    vertical: 14,
                  ),
                  onTap: () {
                    context.read<AppPageCubit>().changePage(
                          pageType: AppPageType.charityVolunteer,
                        );
                    Navigator.pop(context);
                  },
                )
              : AppWidgets.rowIconText(
                  isActive: pageType == AppPageType.charity,
                  icon: AppImageUtils.history,
                  iconSelect: AppImageUtils.history2,
                  text: LocaleKeys.charity_history,
                  fontSize: 16.sp,
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                    vertical: 14,
                  ),
                  onTap: () {
                    context.read<AppPageCubit>().changePage(
                          pageType: AppPageType.charity,
                        );
                    Navigator.pop(context);
                  },
                ),
          state.tobeVolunteer
              ? AppWidgets.rowIconText(
                  isActive: pageType == AppPageType.orders,
                  icon: AppImageUtils.products,
                  iconSelect: AppImageUtils.products2,
                  text: LocaleKeys.my_products,
                  fontSize: 16.sp,
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                    vertical: 14,
                  ),
                  onTap: () {
                    context.read<AppPageCubit>().changePage(
                          pageType: AppPageType.ordersVolunteer,
                        );
                    Navigator.pop(context);
                  },
                )
              : AppWidgets.rowIconText(
                  isActive: pageType == AppPageType.orders,
                  icon: AppImageUtils.products,
                  iconSelect: AppImageUtils.products2,
                  text: LocaleKeys.my_products,
                  fontSize: 16.sp,
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                    vertical: 14,
                  ),
                  onTap: () {
                    context.read<AppPageCubit>().changePage(
                          pageType: AppPageType.orders,
                        );
                    Navigator.pop(context);
                  },
                ),
        ],
      ),
    );
  }
}
