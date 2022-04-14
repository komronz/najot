import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/my_project_and_announcements_pages/my_charity_project_full_widget/my_charity_support_list_page.dart';

import '../../../../data/bloc/my_charity_support_list_cubit/my_charity_support_list_cubit.dart';
import '../../../../data/config/const/decoration_const.dart';
import '../../../../data/model/charity_model.dart';
import '../../../../data/services/navigator_service.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../widgets/app_widgets.dart';
import 'my_charity_applied_user_widget.dart';
import 'my_charity_comments_widget.dart';
import 'my_charity_delete_project_dialog.dart';
import 'my_charity_edit_project_dialog.dart';
import 'my_charity_more_widget.dart';
import 'my_charity_news_widget.dart';
import 'my_charity_price_widget.dart';
import 'my_charity_question_asked_widget.dart';

class AboutMyCharityProjectWidget extends StatefulWidget {
  const AboutMyCharityProjectWidget({required this.model});

  final CharityModel model;

  @override
  _AboutMyCharityProjectWidgetState createState() =>
      _AboutMyCharityProjectWidgetState();
}

class _AboutMyCharityProjectWidgetState
    extends State<AboutMyCharityProjectWidget> with TickerProviderStateMixin {
  late TabController _tabController;
  MyCharitySupportListCubit cubit = MyCharitySupportListCubit();

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
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
      child: BlocBuilder<MyCharitySupportListCubit, MyCharitySupportListState>(
        builder: (context, state) {
          return Column(
            children: [
              Container(
                width: context.width,
                decoration: DecorationConst.DEC_WITH_SHADOW,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: context.width,
                          height: 308.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(11),
                            child: CachedNetworkImage(
                              imageUrl: widget.model.imgUrl!,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ).paddingSymmetric(horizontal: 20, vertical: 20),
                        ),
                        Align(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AppWidgets.appButton(
                                color: AppColorUtils.BLUE,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                width: 128.w,
                                height: 36.w,
                                textColor: AppColorUtils.WHITE,
                                title: LocaleKeys.used,
                                borderRadius: 12,
                                onTap: () {
                                  NavigatorService.to.pushReplacementNamed(
                                      MyCharitySupportListPage.routeName,
                                      arguments: state.cardList);
                                },
                                icon: SvgPicture.asset(AppImageUtils.USERS),
                              ).paddingOnly(right: 17.w),
                              InkWell(
                                child:
                                    SvgPicture.asset(AppImageUtils.TRASH_RED),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return MyCharityDeleteProjectDialog();
                                    },
                                  );
                                },
                              ).paddingOnly(right: 12.w),
                              InkWell(
                                child:
                                    SvgPicture.asset(AppImageUtils.EDIT_GREEN),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return MyCharityEditProjectDialog();
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ).paddingOnly(top: 35.h, right: 35.w),
                        // Positioned(
                        //   bottom: 260.h,
                        //   right: 35.w,
                        //   child: Row(
                        //     children: [
                        //       AppWidgets.appButton(
                        //         color: AppColorUtils.BLUE,
                        //           fontSize: 12,
                        //           fontWeight: FontWeight.w600,
                        //           width: 128.w,
                        //           height: 36.w,
                        //           textColor: AppColorUtils.WHITE,
                        //           title: "Qo'llaganlar",
                        //           borderRadius: 12,
                        //           onTap: (){},
                        //         icon: SvgPicture.asset(AppImageUtils.USERS),
                        //       ).paddingOnly(right: 17.w),
                        //       SvgPicture.asset(AppImageUtils.TRASH_RED).paddingOnly(right: 12.w),
                        //       SvgPicture.asset(AppImageUtils.EDIT_GREEN),
                        //       // Container(
                        //       //   height: 35.w,
                        //       //   width: 60.w,
                        //       //   decoration: BoxDecoration(
                        //       //     color: AppColorUtils.BLUE,
                        //       //     borderRadius: BorderRadius.horizontal(
                        //       //       left: Radius.circular(12),
                        //       //     ),
                        //       //   ),
                        //       //   child: SvgPicture.asset(AppImageUtils.EDIT_GREEN),
                        //       // ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                    AppWidgets.text(
                      text: widget.model.title!,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: AppColorUtils.DARK2,
                      maxLines: 10,
                    ).paddingSymmetric(horizontal: 20),
                    MyCharityPriceWidget(model: widget.model)
                        .paddingOnly(top: 18.w),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyCharityAppliedUserWidget(model: widget.model),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppWidgets.starTextWidget(
                              text: LocaleKeys.must_be_collected_by_date,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  color: AppColorUtils.BLUE_PERCENT,
                                  size: 14.sp,
                                ),
                                AppWidgets.text(
                                  text: "25.02.2022",
                                  color: AppColorUtils.BLUE_PERCENT,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ).paddingOnly(left: 6.w),
                              ],
                            ).paddingOnly(top: 3.w)
                          ],
                        ).paddingOnly(left: 30.w)
                      ],
                    ).paddingSymmetric(
                      horizontal: 20.w,
                      vertical: 18.w,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 24.w,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(11.0)),
                child: DefaultTabController(
                  initialIndex: 0,
                  length: 4,
                  child: Column(
                    children: [
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
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        tabs: [
                          Text(
                            LocaleKeys.more.tr(),
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                          Text(
                            LocaleKeys.news.tr(),
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                LocaleKeys.questions_asked.tr(),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                              true
                                  ? Container(
                                      width: 7.w,
                                      height: 7.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.red),
                                    ).paddingOnly(left: 3.w, top: 2.w)
                                  : SizedBox(),
                            ],

                          ),

                          Text(
                            LocaleKeys.comments.tr(),
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                        isScrollable: true,
                        indicatorWeight: 2,
                        indicatorColor: AppColorUtils.GREEN_APP,
                        indicatorSize: TabBarIndicatorSize.tab,
                        padding: EdgeInsets.only(right: 10),
                        indicatorPadding: EdgeInsets.only(right: 10, left: 10),
                        labelPadding: EdgeInsets.only(right: 10, left: 10),
                      ).paddingOnly(left: 15.w, top: 8.w),
                      Container(
                        child: [
                          MyCharityMoreWidget(
                            cardModel: widget.model,
                          ),
                          MyCharityNewsWidget(
                            cardModel: widget.model,
                          ).paddingAll(20.w),
                          MyCharityQuestionsAskedWidget(
                            cardModel: widget.model,
                          ).paddingAll(20.w),
                          MyCharityCommentsWidget(
                            cardModel: widget.model,
                          ).paddingAll(20.w)
                        ][_tabController.index],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      // Row(
                      //   mainAxisAlignment:
                      //   MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     // ButtonCard(
                      //     //   onPress: () {
                      //     //     showDialog(
                      //     //       context: context,
                      //     //       builder: (context) {
                      //     //         return SupportProjectDialog();
                      //     //       },
                      //     //     );
                      //     //   },
                      //     //   text: LocaleKeys.project_implementation,
                      //     //   height: 48.w,
                      //     //   width: 274.w,
                      //     //   color: AppColorUtils.PERCENT_COLOR,
                      //     //   textSize: 16.sp,
                      //     //   fontWeight: FontWeight.w600,
                      //     //   textColor: AppColorUtils.WHITE,
                      //     // ),
                      //     // AppWidgets.favouriteButton(
                      //     //   select: widget.model.isFavorite!,
                      //     //   height: 48.w,
                      //     //   width: 48.w,
                      //     //   onTap: () {},
                      //     // )
                      //   ],
                      // ).paddingSymmetric(horizontal: 20.w),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
