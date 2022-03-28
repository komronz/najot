import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/kraudfanding_cubit/kraud_fanding_cubit.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/KraudfandingBanner.dart';
import 'package:najot/ui/widgets/app_bar_with_title.dart';
import 'package:najot/ui/widgets/app_search_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'kraudfanding_widget/kraudfanding_mini_card_widget.dart';
import 'kraudfanding_widget/kraudfanding_widgets.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';

class KraudfandingPage extends StatefulWidget {
   KraudfandingPage({Key? key}) ;
   static const String routeName = '/kraudfanding';

  @override
  State<KraudfandingPage> createState() => _KraudfandingPageState();
}

class _KraudfandingPageState extends State<KraudfandingPage>
    with SingleTickerProviderStateMixin{
  KraudFandingCubit cubit=KraudFandingCubit();
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

  _handleTabSelection() {
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
          title: 'Kraudfanding',
          onPress: () {
            NavigatorService.to.pop();
          },
        ),
        body: BlocBuilder<KraudFandingCubit, KraudFandingState>(
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
                  KraudfandingBanner(),
                  AppWidgets.textLocale(
                      text: "Yangi Qo'shilganlar",
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColorUtils.DARK2)
                      .paddingOnly(
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
                            (index) => KraudfandingMiniCardWidget(
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20.w,top: 15.w),
                            child: Text(
                              "Kategoriyalar",
                              style: TextStyle(
                                color: Color(0xFF414042),
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,),
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
                                Text("Barchasi"),
                                Text("Texnologiya'"),
                                Text("Texnologiya"),

                            ],
                            isScrollable: true,
                            indicatorWeight: 2,
                            indicatorColor: AppColorUtils.TEXT_GREEN,
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicatorPadding:
                            EdgeInsets.only(right: 10, left: 10),
                            labelPadding:
                            EdgeInsets.only(right: 10, left: 10),
                          ).paddingOnly(left: 10.w, top: 8),
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
                                      (index) => KraudfandingMiniCardWidget(
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
                                      (index) => KraudfandingMiniCardWidget(
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
                                      (index) => KraudfandingMiniCardWidget(
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


