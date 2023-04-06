import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:najot/data/bloc/charity_page_cubit/charity_cubit.dart';
import 'package:najot/data/bloc/home_cubit/home_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_logger_util.dart';
import 'package:najot/ui/pages/charity_page/widgets/charity_item2_widget.dart';
import 'package:najot/ui/pages/charity_page/widgets/charity_item_widget.dart';
import 'package:najot/ui/widgets/app_bar_with_title.dart';
import 'package:najot/ui/widgets/app_search_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../widgets/app_error_widget.dart';
import '../crowdfunding_page_main/crowdfunding_widget/search_not _found.dart';
import 'charity_full_page/charity_full_page.dart';
import 'charity_full_page/charity_full_page2.dart';

class CharityPage extends StatefulWidget {
  const CharityPage();

  static const String routeName = '/routeName';

  @override
  State<CharityPage> createState() => _CharityPageState();
}

class _CharityPageState extends State<CharityPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    CharityCubit.to..load();
    _tabController = TabController(
      length: CharityCubit.to.state.category.length,
      vsync: this,
    );
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
    int count = 0;
    return Scaffold(
      appBar: AppBarWithTitle(
        title: LocaleKeys.charity.tr(),
        onPress: () async {
          await HomeCubit.to.getModel();

          if (count == 0) {
            count++;
            NavigatorService.to.pop();
          }
        },
      ),
      backgroundColor: AppColorUtils.BACKGROUND,
      body: WillPopScope(
        onWillPop: () async {
          HomeCubit.to.getModel();
          return true;
        },
        child: BlocBuilder<CharityCubit, CharityState>(
          bloc: CharityCubit.to,
          builder: (context, state) {
            if (state.internetConnection) {
              List<ProjectModel> list = state.charityModel!.results!;
              if (state.loading == true) {
                return Center(
                  child: CircularProgressIndicator(color: AppColorUtils.GREEN_APP,),
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppSearchWidget(
                        onChange: (v) {
                          CharityCubit.to.searchChange(v);
                        },
                        search: () {},
                      ).paddingSymmetric(horizontal: 20, vertical: 15.w),
                      state.searchProgress
                          ? Center(
                              child: CircularProgressIndicator(color: AppColorUtils.GREEN_APP,)
                                  .paddingOnly(top: 220.w),
                            )
                          : state.searchChange == ""
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ///Elon berish
                                    ///
                                    // Container(
                                    //   padding: EdgeInsets.symmetric(
                                    //     horizontal: 18.w,
                                    //     vertical: 20.w,
                                    //   ),
                                    //   width: context.width,
                                    //   decoration: BoxDecoration(
                                    //     color: AppColorUtils.BACK_AD,
                                    //     borderRadius: BorderRadius.circular(12),
                                    //     border: Border.all(
                                    //       color: AppColorUtils.DIVIDER,
                                    //       width: 1,
                                    //     ),
                                    //   ),
                                    //   child: Row(
                                    //     children: [
                                    //       Column(
                                    //         mainAxisAlignment:
                                    //             MainAxisAlignment.spaceBetween,
                                    //         crossAxisAlignment:
                                    //             CrossAxisAlignment.start,
                                    //         children: [
                                    //           SizedBox(
                                    //             width: 190.w,
                                    //             child: AppWidgets.text(
                                    //               richText: true,
                                    //               othersMarkers: [
                                    //                 MarkerText(
                                    //                   marker: "//",
                                    //                   style: TextStyle(
                                    //                     color: AppColorUtils
                                    //                         .KRAUDFANDING,
                                    //                   ),
                                    //                 ),
                                    //               ],
                                    //               text:
                                    //                   "Lorem Ipsum is simply dummy text of the printing and typesetting industry.//Lorem Ipsum has been the industry'//? ",
                                    //               height: 1.5,
                                    //               fontWeight: FontWeight.w500,
                                    //               fontSize: 12.sp,
                                    //               maxLines: 5,
                                    //             ),
                                    //           ),
                                    //           ButtonCard(
                                    //             onPress: () {},
                                    //             text:
                                    //                 LocaleKeys.advertising.tr(),
                                    //             width: 126.w,
                                    //             height: 35.w,
                                    //             color: AppColorUtils.GREEN_APP,
                                    //             textColor: AppColorUtils.WHITE,
                                    //             fontWeight: FontWeight.w600,
                                    //             textSize: 12.sp,
                                    //           ).paddingOnly(top: 13)
                                    //         ],
                                    //       ),
                                    //       Expanded(
                                    //         child: AppWidgets.imageAsset(
                                    //             path:
                                    //                 "assets/images/splash_1.png"),
                                    //       )
                                    //     ],
                                    //   ),
                                    // ).paddingSymmetric(horizontal: 8),
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
                                          children: List.generate(list.length,
                                              (index) {

                                            if (list[index].requiredFund !=
                                                null) {
                                              return CharityItemWidget(
                                                model: list[index],
                                                onTap: () {
                                                  NavigatorService.to.pushNamed(
                                                      CharityFullPage.routName,
                                                      arguments: list[index]);
                                                },
                                                onTapLike: () {
                                                  CharityCubit.to.changeLike(
                                                      list[index].id!);
                                                },
                                              ).paddingOnly(left: 10.w);
                                            } else {
                                              return CharityItem2Widget(
                                                onTap: () {
                                                  NavigatorService.to.pushNamed(
                                                      CharityFullPage2.routName,
                                                      arguments: list[index]);
                                                },
                                                model: list[index],
                                                onTapLike: () {
                                                  CharityCubit.to.changeLike(
                                                      list[index].id!);
                                                },
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
                                          borderRadius:
                                              BorderRadius.circular(11),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color.fromRGBO(
                                                  11, 191, 144, 0.02),
                                              blurRadius: 11,
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                              labelColor:
                                                  AppColorUtils.GREEN_APP,
                                              unselectedLabelColor:
                                                  AppColorUtils.DARK_6,
                                              unselectedLabelStyle: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              labelStyle: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              tabs: List.generate(
                                                state.category.length,
                                                (index) => Text(
                                                  state.category[index].name!,
                                                ),
                                              ),
                                              onTap: (index) {
                                                CharityCubit.to.tabChange(
                                                    state.category[index].id!);
                                              },
                                              isScrollable: true,
                                              indicatorWeight: 4,
                                              indicatorColor:
                                                  AppColorUtils.GREEN_APP,
                                              indicatorSize:
                                                  TabBarIndicatorSize.tab,
                                              padding:
                                                  EdgeInsets.only(right: 10),
                                              indicatorPadding: EdgeInsets.only(
                                                  right: 10, left: 10),
                                              labelPadding: EdgeInsets.only(
                                                  right: 10, left: 10),
                                            ).paddingOnly(left: 15, top: 8),
                                            SizedBox(
                                              height: 20.w,
                                            ),
                                            state.tabLoading
                                                ? Center(
                                                    child:
                                                        CircularProgressIndicator
                                                            .adaptive(),
                                                  ).paddingSymmetric(
                                                    vertical: 50.w)
                                                : Container(
                                                    child: GridView.count(
                                                      shrinkWrap: true,
                                                      crossAxisCount: 2,
                                                      physics:
                                                          ClampingScrollPhysics(),
                                                      childAspectRatio:
                                                          160 / 267,
                                                      padding:
                                                          EdgeInsets.all(0),
                                                      reverse: false,
                                                      crossAxisSpacing: 8,
                                                      mainAxisSpacing: 6,
                                                      children: List.generate(
                                                        state
                                                            .tabProjects.length,
                                                        (index) {
                                                          if (state
                                                                  .tabProjects[
                                                                      index]
                                                                  .requiredFund !=
                                                              null) {
                                                            return CharityItemWidget(
                                                              onTap: () {
                                                                NavigatorService
                                                                    .to
                                                                    .pushNamed(
                                                                  CharityFullPage
                                                                      .routName,
                                                                  arguments:
                                                                      state.tabProjects[
                                                                          index],
                                                                );
                                                              },
                                                              model: state
                                                                      .tabProjects[
                                                                  index],
                                                              onTapLike: () {
                                                                CharityCubit.to
                                                                    .changeLike(state
                                                                        .tabProjects[
                                                                            index]
                                                                        .id!);
                                                              },
                                                            );
                                                          } else {
                                                            return CharityItem2Widget(
                                                              model: state
                                                                      .tabProjects[
                                                                  index],
                                                              onTap: () {
                                                                NavigatorService
                                                                    .to
                                                                    .pushNamed(
                                                                  CharityFullPage2
                                                                      .routName,
                                                                  arguments:
                                                                      state.tabProjects[
                                                                          index],
                                                                );
                                                              },
                                                              onTapLike: () {
                                                                CharityCubit.to
                                                                    .changeLike(
                                                                  state
                                                                      .tabProjects[
                                                                          index]
                                                                      .id!,
                                                                );
                                                              },
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ).paddingSymmetric(
                                                    horizontal: 15.w),
                                          ],
                                        ),
                                      ).paddingOnly(top: 18.w),
                                    )
                                  ],
                                )
                              : state.searchProjects.isNotEmpty
                                  ? Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: GridView.count(
                                        shrinkWrap: true,
                                        crossAxisCount: 2,
                                        physics: ClampingScrollPhysics(),
                                        childAspectRatio: 160 / 267,
                                        padding: EdgeInsets.all(0),
                                        reverse: false,
                                        crossAxisSpacing: 8,
                                        mainAxisSpacing: 6,
                                        children: List.generate(
                                          state.searchProjects.length,
                                          (index) {
                                            if (state.searchProjects[index]
                                                    .requiredFund !=
                                                null) {
                                              return CharityItemWidget(
                                                onTap: () {
                                                  NavigatorService.to.pushNamed(
                                                    CharityFullPage.routName,
                                                    arguments: state.searchProjects[
                                                    index],
                                                  );
                                                },
                                                model: state.searchProjects[index],
                                                onTapLike: () {
                                                  CharityCubit.to.changeLike(
                                                      state
                                                          .searchProjects[index]
                                                          .id!);
                                                },
                                              );
                                            } else {
                                              return CharityItem2Widget(
                                                model:
                                                    state.searchProjects[index],
                                                onTap: () {
                                                  NavigatorService.to.pushNamed(
                                                    CharityFullPage2.routName,
                                                    arguments: CharityFullModel(
                                                      cardModel:
                                                          state.searchProjects[
                                                              index],
                                                      cubit: CharityCubit.to,
                                                    ),
                                                  );
                                                },
                                                onTapLike: () {
                                                  CharityCubit.to.changeLike(
                                                      state
                                                          .searchProjects[index]
                                                          .id!);
                                                },
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    )
                                  : SearchNotFound()
                    ],
                  ),
                );
              }
            } else {
              return AppErrorWidget(onTap: () async {
                AppWidgets.isLoading(true);
                await CharityCubit.to.load();
                AppWidgets.isLoading(false);
              });
            }
          },
        ),
      ),
    );
  }
}
