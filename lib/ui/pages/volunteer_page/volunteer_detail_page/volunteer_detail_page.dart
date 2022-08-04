import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/volunteer_bloc/volunteer_cubit.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/crowdfunding_page_main/project_details/widgets/tabbar_widget.dart';
import 'package:najot/ui/pages/volunteer_page/volunteer_detail_page/widgets/volunteer_donate_widget.dart';
import 'package:najot/ui/widgets/app_bar_with_title.dart';

import '../../../../data/bloc/home_cubit/home_cubit.dart';
import 'widgets/about_project_volunteer_widget.dart';

class VolunteerDetailModel {
  VolunteerDetailModel({
    required this.cubit,
    required this.cardModel,
  });

  VolunteerCubit cubit;
  ProjectModel cardModel;
}

class VolunteerDetailPage extends StatefulWidget {
  VolunteerDetailPage({required this.model});

  final VolunteerDetailModel model;
  static const String routeName = '/announcement';

  @override
  State<VolunteerDetailPage> createState() => _AboutAnnouncementPageState();
}

class _AboutAnnouncementPageState extends State<VolunteerDetailPage>
    with TickerProviderStateMixin {
  late TabController _controller;


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    _controller.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    if (_controller.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorUtils.BACKGROUND,
      appBar: AppBarWithTitle(
        title: LocaleKeys.about_project.tr(),
        onPress: () {
          NavigatorService.to.pop();
        },
      ),
      body: BlocBuilder<VolunteerCubit, VolunteerState>(
        bloc: widget.model.cubit,
        builder: (context, state) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 18.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(11),
                      topLeft: Radius.circular(11),
                    ),
                  ),
                  child: TabBarWidget(
                    _controller,
                    LocaleKeys.about_project.tr(),
                    LocaleKeys.donate.tr(),
                      (i){

                      }
                  ),
                ),
                Container(
                  child: [
                    AboutProjectVolunteerWidget(
                      cardModel: widget.model.cardModel,
                      cubit: widget.model.cubit,
                    ),
                    VolunteerDonateWidget(
                      cardModel: widget.model.cardModel,
                    )
                  ][_controller.index],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
