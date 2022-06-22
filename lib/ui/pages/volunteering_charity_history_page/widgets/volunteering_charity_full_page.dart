import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/config/const/decoration_const.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/charity_model.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/pages/my_project_and_announcements_pages/my_charity_project_full_widget/my_charity_applied_user_widget.dart';
import 'package:najot/ui/pages/my_project_and_announcements_pages/my_charity_project_full_widget/my_charity_more_widget.dart';
import 'package:najot/ui/widgets/app_bar_with_title.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../data/bloc/my_charity_support_list_cubit/my_charity_support_list_cubit.dart';
import '../../crowd_founding_page_main/project_details/widgets/support_project_dialog.dart';
import '../../my_project_and_announcements_pages/my_charity_project_full_widget/my_charity_comments_widget.dart';
import '../../my_project_and_announcements_pages/my_charity_project_full_widget/my_charity_news_widget.dart';
import '../../my_project_and_announcements_pages/my_charity_project_full_widget/my_charity_question_asked_widget.dart';

class VolunteeringCharityFullPage extends StatefulWidget {
  VolunteeringCharityFullPage({
    required this.model,
    Key? key,
  }) : super(key: key);

  final CharityModel model;
  final MyCharitySupportListCubit cubit = MyCharitySupportListCubit();
  static const String routName = 'volunteeringCharityFullPage';

  @override
  State<StatefulWidget> createState() => _VolunteeringCharityFullPageState();
}

class _VolunteeringCharityFullPageState
    extends State<VolunteeringCharityFullPage> with TickerProviderStateMixin {
  late TabController _tabController;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithTitle(
        title: LocaleKeys.about_project.tr(),
        onPress: () {
          NavigatorService.to.pop();
        },
      ),
      backgroundColor: AppColorUtils.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 1.sw,
              decoration: DecorationConst.decWithShadow,
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 1.sw,
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
                        ).paddingSymmetric(horizontal: 20, vertical: 20),
                      ),
                      Positioned(
                        bottom: 53,
                        right: 0,
                        child: Container(
                          height: 35.w,
                          width: 60.w,
                          decoration: const BoxDecoration(
                            color: AppColorUtils.blue,
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(12),
                            ),
                          ),
                          child: const Icon(
                            Icons.monetization_on_outlined,
                            color: AppColorUtils.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  AppWidgets.text(
                    text: widget.model.title!,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: AppColorUtils.dark2,
                    maxLines: 10,
                  ).paddingSymmetric(horizontal: 20),
                  CharityAuthorWidget(model: widget.model)
                      .paddingOnly(top: 18.w),
                  CharityPriceWidget(model: widget.model)
                      .paddingOnly(top: 18.w),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyCharityAppliedUserWidget(
                        model: widget.model,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppWidgets.starTextWidget(
                            text: LocaleKeys.must_collected_date.tr(),
                          ).paddingOnly(
                            bottom: 5.w,
                            top: 3.w,
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
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20.w),
                    decoration: BoxDecoration(
                        color: AppColorUtils.white,
                        borderRadius: BorderRadius.circular(11.0)),
                    child: DefaultTabController(
                      initialIndex: 0,
                      length: 4,
                      child: Column(
                        children: [
                          TabBar(
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
                              Text(
                                LocaleKeys.questions_asked.tr(),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
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
                                cubit: widget.cubit,
                              ).paddingAll(20.w),
                              MyCharityCommentsWidget(
                                cardModel: widget.model,
                              ).paddingAll(20.w)
                            ][_tabController.index],
                          ),
                          SizedBox(
                            height: 20.w,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ButtonCard(
                                onPress: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return const SupportProjectDialog();
                                    },
                                  );
                                },
                                text: LocaleKeys.project_implementation,
                                height: 48.w,
                                width: 274.w,
                                color: AppColorUtils.percentColor,
                                textSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                textColor: AppColorUtils.white,
                              ),
                              AppWidgets.favouriteButton(
                                select: widget.model.isFavorite!,
                                height: 48.w,
                                width: 48.w,
                                onTap: () {},
                              )
                            ],
                          ).paddingSymmetric(horizontal: 20.w),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CharityPriceWidget extends StatelessWidget {
  final CharityModel model;

  const CharityPriceWidget({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppWidgets.starTextWidget(text: LocaleKeys.need_summa),
                AppWidgets.text(
                  text: model.totalSum!,
                  color: AppColorUtils.textGreen2,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ).paddingOnly(top: 3.w),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppWidgets.textLocale(
                  text: LocaleKeys.announcement_day,
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                  color: AppColorUtils.dark6,
                ),
                AppWidgets.text(
                  text: model.createdDate!,
                  color: AppColorUtils.textGreen2,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ).paddingOnly(top: 3.w),
              ],
            )
          ],
        ).paddingSymmetric(horizontal: 20),
        Container(
          width: context.width,
          color: AppColorUtils.greenBack,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppWidgets.textLocale(
                    text: LocaleKeys.collected,
                    color: AppColorUtils.dark6,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  AppWidgets.textLocale(
                    text: LocaleKeys.done,
                    color: AppColorUtils.dark6,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppWidgets.textLocale(
                    text: LocaleKeys.sum,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColorUtils.greenText,
                    args: [model.totalSum!],
                  ),
                  AppWidgets.text(
                    text: "${model.percent.toString().split('.').first} %",
                    color: AppColorUtils.bluePercent,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ],
              ).paddingOnly(top: 3),
              LinearPercentIndicator(
                animation: true,
                padding: const EdgeInsets.all(0),
                lineHeight: 10.h,
                animationDuration: 2000,
                percent: model.percent! / 100,
                progressColor: AppColorUtils.percentColor,
                backgroundColor: AppColorUtils.percentColor2,
              ).paddingOnly(top: 10.w),
            ],
          ).paddingSymmetric(
            horizontal: 20.w,
            vertical: 12.w,
          ),
        ).paddingOnly(top: 12.w),
      ],
    );
  }
}

class CharityAuthorWidget extends StatelessWidget {
  final CharityModel model;

  const CharityAuthorWidget({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 50.w,
              width: 50.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(model.imgUrl!), fit: BoxFit.cover),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppWidgets.textLocale(
                  text: LocaleKeys.project_author,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColorUtils.dark6,
                ),
                SizedBox(
                  width: 150.w,
                  child: AppWidgets.text(
                    text: model.author!,
                    color: AppColorUtils.textGreen2,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ).paddingOnly(top: 2.w),
                ),
              ],
            ).paddingOnly(left: 10),
          ],
        ),
        ButtonCard(
          onPress: () {},
          text: LocaleKeys.ask_question,
          width: 100.w,
          height: 35.w,
          color: AppColorUtils.greenBtn,
          textColor: AppColorUtils.greenText,
          borderRadius: 10,
          textSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
      ],
    ).paddingSymmetric(horizontal: 20);
  }
}
