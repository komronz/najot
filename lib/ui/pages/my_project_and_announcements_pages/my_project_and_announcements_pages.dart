import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/my_charity_project/my_charity_project_cubit.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';

import '../../../data/config/const/decoration_const.dart';
import '../../../data/utils/app_color_utils.dart';
import '../../widgets/app_error_widget.dart';
import '../../widgets/app_widgets.dart';
import 'my_charity_project_widget/my_charity_project_list.dart';
import 'my_crowdfunding_project/my_crowdfunding_list_widget.dart';
import 'my_volunteering_project_page/my_volunteering_project_page.dart';

class MyProjectAndAnnouncementsPages extends StatelessWidget {

  static const String routeName = '/myProjectAndAnnouncementsPages';

  MyProjectAndAnnouncementsPages({Key? key}) : super(key: key);

  MyProjectAndAnnouncementsPagesCubit cubit =
      MyProjectAndAnnouncementsPagesCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit..load(),
      child: BlocBuilder<MyProjectAndAnnouncementsPagesCubit,
          MyProjectAndAnnouncementsPagesState>(
        builder: (context, state) => Scaffold(
          appBar: AppWidgets.appBarForFirstPages(title: LocaleKeys.projects_and_ads),
          body: _buildBody(context, state),
        ),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    MyProjectAndAnnouncementsPagesState state,
  ) {
    if (state.hasConnection) {
      if (state.isLoading) {
        return const Center(
          child: CircularProgressIndicator(color: AppColorUtils.GREEN_APP),
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
                labelPadding: EdgeInsets.symmetric(horizontal: 15.w),
                padding: EdgeInsets.symmetric(vertical: 5.w),
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
                    MyCharityProjectList(list: state.charityList, number: 3),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return AppErrorWidget(onTap: () async {
        AppWidgets.isLoading(true);
        await cubit.load();
        AppWidgets.isLoading(false);
      });
    }
  }
}
