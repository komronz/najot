import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/volonteer_detail_cubit/volonteer_detail_cubit.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/tabbar_widget.dart';
import 'package:najot/ui/pages/volunteer_page/volunteer_detail_page/widgets/volunteer_donate_widget.dart';
import 'package:najot/ui/widgets/app_bar_with_title.dart';

import 'widgets/about_project_volunteer_widget.dart';

class VolunteerDetailPage extends StatefulWidget {
  VolunteerDetailPage({required this.cardModel});

  final CardModel cardModel;
  static const String routeName = '/announcement';

  @override
  State<VolunteerDetailPage> createState() => _AboutAnnouncementPageState();
}

class _AboutAnnouncementPageState extends State<VolunteerDetailPage>
    with TickerProviderStateMixin {
  late TabController _controller;

  VolonteerDetailCubit cubit = VolonteerDetailCubit();

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

  _handleTabSelection() {
    if (_controller.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        backgroundColor: AppColorUtils.BACKGROUND,
        appBar: AppBarWithTitle(
          title: LocaleKeys.about_project.tr(),
          onPress: () {
            NavigatorService.to.pop();
          },
        ),
        body: BlocBuilder<VolonteerDetailCubit, VolonteerDetailState>(
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
                      LocaleKeys.donate.tr()
                    ),
                  ),
                  Container(
                    child: [
                      AboutProjectVolunteerWidget(cardModel: widget.cardModel),
                      VolunteerDonateWidget(cardModel: widget.cardModel,)
                    ][_controller.index],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
