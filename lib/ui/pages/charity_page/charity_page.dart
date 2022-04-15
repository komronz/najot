import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/charity_page_cubit/charity_cubit.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/charity_page/widgets/charity_item2_widget.dart';
import 'package:najot/ui/pages/charity_page/widgets/charity_item_widget.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/widgets/app_bar_with_title.dart';
import 'package:najot/ui/widgets/app_search_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class CharityPage extends StatefulWidget {
  const CharityPage({Key? key}) : super(key: key);
  static const String routeName = '/routeName';

  @override
  State<CharityPage> createState() => _CharityPageState();
}

class _CharityPageState extends State<CharityPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  CharityCubit cubit = CharityCubit();

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
      create: (context) => cubit..Load(),
      child: BlocBuilder<CharityCubit, CharityState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBarWithTitle(
              title: LocaleKeys.charity.tr(),
              onPress: () {
                NavigatorService.to.pop();
              },
            ),
            backgroundColor: AppColorUtils.BACKGROUND,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSearchWidget(
                    onChange: (v) {},
                    search: () {},
                  ).paddingSymmetric(horizontal: 20, vertical: 15.w),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.w),
                    width: context.width,
                    decoration: BoxDecoration(
                      color: AppColorUtils.BACK_AD,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColorUtils.DIVIDER,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 190.w,
                              child: AppWidgets.text(
                                text:
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'?",
                                height: 1.5,
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                maxLines: 5,
                              ),
                            ),
                            ButtonCard(
                              onPress: () {},
                              text: LocaleKeys.advertising.tr(),
                              width: 126.w,
                              height: 30.w,
                              color: AppColorUtils.GREEN_APP,
                              textColor: AppColorUtils.WHITE,
                              fontWeight: FontWeight.w600,
                              textSize: 12.sp,
                            ).paddingOnly(top: 13)
                          ],
                        ),
                        Expanded(
                          child: AppWidgets.imageAsset(
                              path: "assets/images/splash_1.png"),
                        )
                      ],
                    ),
                  ).paddingSymmetric(horizontal: 8),
                  AppWidgets.textLocale(
                    text: LocaleKeys.new_add,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ).paddingOnly(
                    top: 30.w,
                    left: 20.w,
                    bottom: 7.w,
                  ),
                  SizedBox(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(state.list.length, (index) {
                          if (state.list[index].progres != null) {
                            return CharityItemWidget(
                              model: state.list[index],
                            ).paddingOnly(left: 10.w);
                          } else {
                            return CharityItem2Widget(
                              model: state.list[index],
                            ).paddingOnly(left: 10.w);
                          }
                        }),
                      ),
                    ),
                  ),
                  DefaultTabController(
                    initialIndex: 0,
                    length: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(11, 191, 144, 0.02),
                            blurRadius: 11,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppWidgets.textLocale(
                            text: LocaleKeys.category,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                          ).paddingOnly(left: 24, top: 18),
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
                              Text("Mablag'"),
                              Text("Buyumlar"),
                            ],
                            isScrollable: true,
                            indicatorWeight: 4,
                            indicatorColor: AppColorUtils.GREEN_APP,
                            indicatorSize: TabBarIndicatorSize.tab,
                            padding: EdgeInsets.only(right: 10),
                            indicatorPadding:
                                EdgeInsets.only(right: 10, left: 10),
                            labelPadding: EdgeInsets.only(right: 10, left: 10),
                          ).paddingOnly(left: 15, top: 8),
                          SizedBox(
                            height: 20.w,
                          ),
                          Container(
                            child: [
                              GridView.count(
                                shrinkWrap: true,
                                crossAxisCount: 2,
                                physics: ClampingScrollPhysics(),
                                childAspectRatio: 160 / 267,
                                padding: EdgeInsets.all(0),
                                reverse: false,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 6,
                                children:
                                    List.generate(state.list.length, (index) {
                                  if (state.list[index].progres != null) {
                                    return CharityItemWidget(
                                      model: state.list[index],
                                    ).paddingOnly(left: 10.w);
                                  } else {
                                    return CharityItem2Widget(
                                      model: state.list[index],
                                    ).paddingOnly(left: 10.w);
                                  }
                                }),
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
                                children:
                                    List.generate(state.list.length, (index) {
                                  if (state.list[index].progres != null) {
                                    return CharityItemWidget(
                                      model: state.list[index],
                                    ).paddingOnly(left: 10.w);
                                  } else {
                                    return CharityItem2Widget(
                                      model: state.list[index],
                                    ).paddingOnly(left: 10.w);
                                  }
                                }),
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
                                children:
                                    List.generate(state.list.length, (index) {
                                  if (state.list[index].progres != null) {
                                    return CharityItemWidget(
                                      model: state.list[index],
                                    ).paddingOnly(left: 10.w);
                                  } else {
                                    return CharityItem2Widget(
                                      model: state.list[index],
                                    ).paddingOnly(left: 10.w);
                                  }
                                }),
                              ),
                            ][_tabController.index],
                          ).paddingSymmetric(horizontal: 15.w),
                        ],
                      ),
                    ).paddingOnly(top: 18.w),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
