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
import '../../../../data/bloc/my_charity_support_list_cubit/my_charity_support_list_state.dart';
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
  const AboutMyCharityProjectWidget({Key? key, required this.model})
      : super(key: key);

  final CharityModel model;

  @override
  State<StatefulWidget> createState() => _AboutMyCharityProjectWidgetState();
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

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  bool selected = true;

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
                decoration: DecorationConst.decWithShadow,
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
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ).paddingSymmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                        ),
                        Align(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AppWidgets.appButton(
                                color: AppColorUtils.blue,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                width: 128.w,
                                height: 36.w,
                                textColor: AppColorUtils.white,
                                title: LocaleKeys.used,
                                borderRadius: 12,
                                onTap: () {
                                  NavigatorService.to.pushReplacementNamed(
                                    MyCharitySupportListPage.routeName,
                                    arguments: state.cardList,
                                  );
                                },
                                icon: SvgPicture.asset(AppImageUtils.users),
                              ).paddingOnly(right: 17.w),
                              InkWell(
                                child: SvgPicture.asset(AppImageUtils.trashRed),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const MyCharityDeleteProjectDialog();
                                    },
                                  );
                                },
                              ).paddingOnly(right: 12.w),
                              InkWell(
                                child:
                                    SvgPicture.asset(AppImageUtils.editGreen),
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const MyCharityEditProjectDialog();
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ).paddingOnly(top: 35.h, right: 35.w),
                      ],
                    ),
                    AppWidgets.text(
                      text: widget.model.title!,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: AppColorUtils.dark2,
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
                              text: LocaleKeys.must_collected_date,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  color: AppColorUtils.bluePercent,
                                  size: 14.sp,
                                ),
                                AppWidgets.text(
                                  text: "25.02.2022",
                                  color: AppColorUtils.bluePercent,
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
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.w,
              ),
              state.widgetChange == false
                  ? Container(
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
                              onTap: (v) {
                                if (v == 2) {
                                  selected = false;
                                } else {
                                  selected = true;
                                }
                              },
                              controller: _tabController,
                              enableFeedback: true,
                              labelColor: AppColorUtils.greenApp,
                              unselectedLabelColor: AppColorUtils.dark6,
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
                                    Visibility(
                                      visible: selected,
                                      child: Container(
                                        width: 7.w,
                                        height: 7.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: AppColorUtils.red,
                                        ),
                                      ).paddingOnly(
                                        left: 3.w,
                                        top: 2.w,
                                      ),
                                    )
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
                              indicatorColor: AppColorUtils.greenApp,
                              indicatorSize: TabBarIndicatorSize.tab,
                              padding: const EdgeInsets.only(right: 10),
                              indicatorPadding: const EdgeInsets.only(
                                right: 10,
                                left: 10,
                              ),
                              labelPadding: const EdgeInsets.only(
                                right: 10,
                                left: 10,
                              ),
                            ).paddingOnly(
                              left: 15.w,
                              top: 8.w,
                            ),
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
                                  cubit: cubit,
                                ).paddingAll(20.w),
                                MyCharityCommentsWidget(
                                  cardModel: widget.model,
                                ).paddingAll(20.w)
                              ][_tabController.index],
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      color: AppColorUtils.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            child: Container(
                              width: 31.w,
                              height: 34.w,
                              decoration: BoxDecoration(
                                color: AppColorUtils.backButton,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: AppColorUtils.icGreen2,
                                size: 20.w,
                              ),
                            ),
                            onTap: () {
                              cubit.widgetChange(false);
                            },
                          ).paddingOnly(
                            left: 20.w,
                            top: 18.w,
                            bottom: 18.w,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.w),
                            padding: EdgeInsets.only(
                              top: 12.w,
                              left: 12.w,
                              right: 12.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColorUtils.greenAccent4,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                true
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: 50.w,
                                                width: 50.w,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                        widget.model.imgUrl!,
                                                      ),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: 240.w,
                                                    child: AppWidgets.text(
                                                      text: LocaleKeys
                                                          .how_humanity_benefits
                                                          .tr(),
                                                      color: AppColorUtils
                                                          .textGreen2,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 14.sp,
                                                      maxLines: 2,
                                                    ).paddingOnly(top: 5.w),
                                                  ),
                                                  AppWidgets.textLocale(
                                                    text: "Eshonov Fakhriyor",
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColorUtils.dark6,
                                                  ).paddingOnly(top: 3.w),
                                                ],
                                              ).paddingOnly(left: 10),
                                            ],
                                          ),
                                          AppWidgets.text(
                                            text: widget
                                                .model.infoModel![0].text!,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp,
                                            color: AppColorUtils.textGrey2,
                                            maxLines: 100,
                                            height: 1.5,
                                          ).paddingSymmetric(vertical: 15.w),
                                          const Divider(
                                            thickness: 1,
                                            color: AppColorUtils.black12,
                                          ),
                                          AppWidgets.text(
                                            text: LocaleKeys.your_answer.tr(),
                                            color: AppColorUtils.textGreen2,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp,
                                          ).paddingOnly(top: 20.w),
                                          AppWidgets.text(
                                            text: widget
                                                .model.infoModel![0].text!,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp,
                                            color: AppColorUtils.textGrey2,
                                            maxLines: 100,
                                            height: 1.5,
                                          ).paddingSymmetric(vertical: 15.w),
                                        ],
                                      )
                                    : Center(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 30.w,
                                            ),
                                            SvgPicture.asset(
                                                AppImageUtils.emptyQuestions),
                                            SizedBox(
                                              width: 200.sp,
                                              child: AppWidgets.textLocale(
                                                textAlign: TextAlign.center,
                                                text:
                                                    LocaleKeys.questions_empty,
                                                color: AppColorUtils.dark4,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                                maxLines: 2,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}
