import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/bloc/my_charity_project/my_charity_project_cubit.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/ui/pages/my_project_and_announcements_pages/my_volunteering_project_page/my_volunteering_project_page.dart';

import '../../../data/config/const/decoration_const.dart';
import '../../../data/services/navigator_service.dart';
import '../../../data/utils/app_color_utils.dart';
import '../../../data/utils/app_image_utils.dart';
import '../../widgets/app_widgets.dart';
import '../home_page/home_page.dart';
import '../notification_page/notification_page.dart';
import 'my_charity_project_widget/my_charity_project_list.dart';
import 'my_crowdfunding_project/my_crowdfunding_list_widget.dart';

class MyProjectAndAnnouncementsPages extends StatelessWidget {
  static const String routeName = '/myProjectAndAnnouncementsPages';

  const MyProjectAndAnnouncementsPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyProjectAndAnnouncementsPagesCubit(),
      child: BlocBuilder<MyProjectAndAnnouncementsPagesCubit,
          MyProjectAndAnnouncementsPagesState>(
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
                      text: LocaleKeys.projects_and_ads,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center),
                ),
                InkWell(
                  onTap: () {
                    NavigatorService.to.pushNamed(
                      NotificationPage.routeName,
                    );
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
    MyProjectAndAnnouncementsPagesState state,
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
              labelPadding: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(vertical: 5),
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
                Text(LocaleKeys.volunteering.tr()),
                Text(LocaleKeys.charity.tr()),
              ],
              isScrollable: true,
              indicatorWeight: 1.5,
              indicatorColor: AppColorUtils.GREEN_APP,
              indicatorSize: TabBarIndicatorSize.label,
              // padding: EdgeInsets.only(right: 10),
              // indicatorPadding: EdgeInsets.only(right: 10, left: 10),
              // labelPadding: EdgeInsets.only(right: 10, left: 10),
            ).paddingOnly(
              left: 15,
              top: 10,
              bottom: 10,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  MyCrowdfundingListWidget(list: state.crowdFoundingList),
                  MyVolunteeringProjectPage(list: state.volunteeringList),
                  MyCharityProjectList(list: state.charityList)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
