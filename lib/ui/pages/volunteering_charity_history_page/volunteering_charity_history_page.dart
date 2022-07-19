import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/bloc/charity_history_cubit/charity_history_cubit.dart';
import 'package:najot/data/config/const/decoration_const.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/pages/volunteering_charity_history_page/widgets/volunteering_charity_list_widget.dart';
import 'package:najot/ui/pages/volunteering_charity_history_page/widgets/volunteering_crowdfunding_list_widget.dart';
import 'package:najot/ui/pages/volunteering_charity_history_page/widgets/volunteering_items_charity_list_widget.dart';
import 'package:najot/ui/widgets/app_search_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import '../../../data/bloc/volunteering_charity_history_cubit/volunteering_charity_history_cubit.dart';
import '../../../data/services/navigator_service.dart';
import '../notification_page/notification_page.dart';

class VolunteeringCharityHistoryPage extends StatelessWidget {
  static const String routeName="/volunteeringCharityHistoryPage";

  const VolunteeringCharityHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VolunteeringCharityHistoryCubit()..loadHistory(),
      child: BlocBuilder<VolunteeringCharityHistoryCubit, VolunteeringCharityHistoryState>(
        builder: (context, state) => Scaffold(
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
                Expanded(
                  child: AppWidgets.textLocale(
                    text: LocaleKeys.charity_history,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600,
                  ),
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
          body: _buildBody(context, state),
        ),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
      VolunteeringCharityHistoryState state,
  ) {
    if (state.isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state.hasError) {
      return Center(
        child: AppWidgets.imageSvg(path: AppImageUtils.IMG_WAIT),
      );
    }
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Container(
        decoration: DecorationConst.DEC_WITH_SHADOW,
        height: context.height,
        width: context.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            TabBar(
              enableFeedback: true,
              labelColor: AppColorUtils.GREEN_APP,
              unselectedLabelColor: AppColorUtils.DARK_6,
              unselectedLabelStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
              labelStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              tabs: [
                Text(LocaleKeys.crowdfunding.tr()),
                Text(LocaleKeys.charity.tr()),
                Text(LocaleKeys.item_charity.tr()),
              ],
              isScrollable: true,
              indicatorWeight: 1.5,
              indicatorColor: AppColorUtils.GREEN_APP,
              indicatorSize: TabBarIndicatorSize.label,
              // padding: EdgeInsets.only(right: 10),
              // indicatorPadding: EdgeInsets.only(right: 10, left: 10),
              // labelPadding: EdgeInsets.only(right: 10, left: 10),
            ).paddingOnly(left: 15, top: 18),
            AppSearchWidget(
              onChange: (v) {
                context.read<CharityHistoryCubit>().search(v);
              },
              search: () {},
            ).paddingSymmetric(
              horizontal: 20,
              vertical: 20,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  VolunteeringCrowdfundingListWidget(list: state.kraufandingList),
                  VolunteeringCharityListWidget(list: state.charityList),
                  VolunteeringItemsCharityList(list: state.itemsCharity,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
