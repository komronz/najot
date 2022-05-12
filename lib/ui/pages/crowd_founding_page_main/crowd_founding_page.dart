import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/crowd_founding_cubit/crowd_founding_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/crowd_founding_page_main/project_details/widgets/crowd_founding_banner.dart';
import 'package:najot/ui/widgets/app_bar_with_title.dart';
import 'package:najot/ui/widgets/app_search_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import 'widgets/crowd_founding_mini_card_widget.dart';

class CrowdFoundingPage extends StatefulWidget {
  CrowdFoundingPage({Key? key});

  static const String routeName = '/crowd_founding';

  @override
  State<CrowdFoundingPage> createState() => _CrowdFoundingPageState();
}

class _CrowdFoundingPageState extends State<CrowdFoundingPage>
    with SingleTickerProviderStateMixin {
  CrowdFoundingCubit cubit = CrowdFoundingCubit();
  late TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
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
          title: LocaleKeys.crowdfunding.tr(),
          onPress: () {
            NavigatorService.to.pop();
          },
        ),
        body: BlocBuilder<CrowdFoundingCubit, CrowdFoundingState>(
          builder: (context, state) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSearchWidget(
                    onChange: (v) {},
                    search: () {},
                  ).paddingOnly(left: 20.w, right: 20.w, bottom: 15.w),
                  CrowdFoundingBanner(),
                  AppWidgets.textLocale(
                    text: LocaleKeys.new_add,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColorUtils.DARK2,
                  ).paddingOnly(
                    top: 24.w,
                    bottom: 15.w,
                    left: 18,
                  ),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        state.cardList.length,
                        (index) => CrowdFoundingMiniCardWidget(
                          cardModel: state.cardList[index],
                          visible: true,
                        ).paddingOnly(left: 10.w),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24.0.w,
                  ),
                  DefaultTabController(
                    length: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColorUtils.WHITE,
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: 20.w,
                              top: 15.w,
                            ),
                            child: Text(
                              LocaleKeys.category.tr(),
                              style: TextStyle(
                                color: AppColorUtils.DARK2,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          TabBar(
                            controller: _tabController,
                            enableFeedback: true,
                            labelColor: AppColorUtils.GREEN_APP,
                            unselectedLabelColor: AppColorUtils.DARK_6,
                            unselectedLabelStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            labelStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            tabs: [
                              Text(LocaleKeys.that_s_all.tr()),
                              Text(LocaleKeys.technology.tr()),
                              Text(LocaleKeys.technology.tr()),
                            ],
                            isScrollable: true,
                            indicatorWeight: 2,
                            indicatorColor: AppColorUtils.TEXT_GREEN,
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicatorPadding: EdgeInsets.only(
                              right: 10,
                              left: 10,
                            ),
                            labelPadding: EdgeInsets.only(
                              right: 10,
                              left: 10,
                            ),
                          ).paddingOnly(
                            left: 10.w,
                            top: 8,
                          ),
                          SizedBox(
                            height: 24.0.w,
                          ),
                          Container(
                            child: [
                              GridView.count(
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                primary: false,
                                physics: NeverScrollableScrollPhysics(),
                                childAspectRatio: 160 / 267,
                                padding: EdgeInsets.all(0),
                                reverse: false,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 6,
                                children: List.generate(
                                  state.cardList.length,
                                  (index) => CrowdFoundingMiniCardWidget(
                                    visible: true,
                                    cardModel: state.cardList[index],
                                  ),
                                ),
                              ),
                              GridView.count(
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                physics: ClampingScrollPhysics(),
                                childAspectRatio: 160 / 267,
                                padding: EdgeInsets.all(0),
                                reverse: false,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 6,
                                children: List.generate(
                                  state.cardList.length,
                                  (index) => CrowdFoundingMiniCardWidget(
                                    visible: true,
                                    cardModel: state.cardList[index],
                                  ),
                                ),
                              ),
                              GridView.count(
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                physics: ClampingScrollPhysics(),
                                childAspectRatio: 160 / 267,
                                padding: EdgeInsets.all(0),
                                reverse: false,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 6,
                                children: List.generate(
                                  state.cardList.length,
                                  (index) => CrowdFoundingMiniCardWidget(
                                    visible: true,
                                    cardModel: state.cardList[index],
                                  ),
                                ),
                              ),
                            ][_tabController.index],
                          ).paddingSymmetric(horizontal: 10)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
