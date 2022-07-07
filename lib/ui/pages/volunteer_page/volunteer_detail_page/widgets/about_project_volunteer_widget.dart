import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:najot/data/bloc/volunteer_detail_cubit/volunteer_detail_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/crowd_founding_page_main/project_details/widgets/comments_widget.dart';
import 'package:najot/ui/pages/crowd_founding_page_main/project_details/widgets/kraudfanding_authot_widget.dart';
import 'package:najot/ui/pages/crowd_founding_page_main/project_details/widgets/more_widget.dart';
import 'package:najot/ui/pages/crowd_founding_page_main/project_details/widgets/news_widget.dart';
import 'package:najot/ui/pages/crowd_founding_page_main/project_details/widgets/payment_history_dialog.dart';
import 'package:najot/ui/pages/crowd_founding_page_main/project_details/widgets/question_asked_widget.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/pages/volunteer_page/volunteer_detail_page/widgets/volunteer_help_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:super_rich_text/super_rich_text.dart';

class AboutProjectVolunteerWidget extends StatefulWidget {
  const AboutProjectVolunteerWidget({
    Key? key,
    required this.cardModel,
    required this.state,
    required this.cubit,
  }) : super(key: key);

  final CardModel cardModel;
  final VolunteerDetailState state;
  final VolunteerDetailCubit cubit;

  @override
  State<StatefulWidget> createState() => _AboutProjectVolunteerWidgetState();
}

class _AboutProjectVolunteerWidgetState
    extends State<AboutProjectVolunteerWidget> with TickerProviderStateMixin {
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
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(11),
              bottomRight: Radius.circular(11),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 300.w,
                    margin: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 18.w,
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: widget.cardModel.image!,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 120.w,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const PaymentHistoryDialog();
                          },
                        );
                      },
                      child: Container(
                        height: 35.w,
                        width: 60.w,
                        decoration: const BoxDecoration(
                          color: AppColorUtils.bluePercent,
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(12),
                          ),
                        ),
                        child: const Icon(
                          Icons.monetization_on_outlined,
                          color: AppColorUtils.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              AppWidgets.text(
                text: "Drenajni kuzatish uchun mo’jallangan moslama",
                fontSize: 20.sp,
                color: AppColorUtils.dark2,
                fontWeight: FontWeight.w500,
                maxLines: 2,
              ).paddingSymmetric(horizontal: 20.w),
              KraudfandingAuthorWidget(
                model: widget.cardModel,
                onTap: () {},
              ).paddingOnly(top: 15.w),
              SizedBox(height: 12.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidgets.starTextWidget(
                        text: LocaleKeys.done_date,
                      ),
                      SizedBox(
                        height: 3.w,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(AppImageUtils.date),
                          AppWidgets.text(
                            text: widget.cardModel.date!,
                            color: AppColorUtils.bluePercent,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ).paddingOnly(left: 6.w),
                        ],
                      ),
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
                        text: "25.08.2022",
                        color: const Color(0xFF043F3B),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ).paddingOnly(top: 3.w),
                    ],
                  )
                ],
              ).paddingSymmetric(horizontal: 20.w),
              AppWidgets.starTextWidget(
                text: LocaleKeys.help_type.tr(),
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
                color: AppColorUtils.dark6,
              ).paddingOnly(top: 13.w, left: 20.w, bottom: 3.w),
              AppWidgets.text(
                      text: "Ovqat qilib berish va uyni yig'ishtirish",
                      maxLines: 2,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: AppColorUtils.greenText)
                  .paddingSymmetric(horizontal: 20.w),
              AppWidgets.textLocale(
                text: LocaleKeys.address,
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
                color: AppColorUtils.dark6,
              ).paddingOnly(
                left: 20.w,
                top: 12.w,
                bottom: 3.w,
              ),
              AppWidgets.text(
                      text: "Toshkent Shahar, Mirobod tumani*********",
                      fontSize: 14.w,
                      fontWeight: FontWeight.w500,
                      color: AppColorUtils.textBlue2,
                      maxLines: 2)
                  .paddingSymmetric(horizontal: 20.w)
            ],
          ),
        ),
        SizedBox(
          height: 24.w,
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  indicatorPadding: const EdgeInsets.only(right: 10, left: 10),
                  labelPadding: const EdgeInsets.only(right: 10, left: 10),
                ).paddingOnly(left: 15.w, top: 8.w),
                Container(
                  child: [
                    MoreWidget(
                      cardModel: widget.cardModel,
                    ),
                    NewsWidget(
                      cardModel: widget.cardModel,
                    ).paddingAll(20.w),
                    QuestionsAskedWidget(
                      cardModel: widget.cardModel,
                    ).paddingAll(20.w),
                    CommentsWidget(
                      cardModel: widget.cardModel,
                    ).paddingAll(20.w)
                  ][_tabController.index],
                ),
                SizedBox(
                  height: 10.w,
                ),
                widget.state.saveHelp
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.state.tobeVolunteer
                              ? const SizedBox()
                              : AppWidgets.text(
                                  text: LocaleKeys.tobe_volunteer.tr(),
                                  color: AppColorUtils.dark6,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.w,
                                  richText: true,
                                  othersMarkers: [
                                      MarkerText(
                                        marker: "&",
                                        style: const TextStyle(
                                          color: AppColorUtils.red,
                                        ),
                                      ),
                                      MarkerText(
                                        marker: "//",
                                        style: const TextStyle(
                                          color: AppColorUtils.black,
                                        ),
                                      )
                                    ]).paddingSymmetric(
                                  horizontal: 20.w,
                                  vertical: 10.w,
                                ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ButtonCard(
                                onPress: () {
                                  if (widget.state.tobeVolunteer == true) {
                                    NavigatorService.to.pushNamed(
                                      VolunteerHelpWidget.routeName,
                                      arguments: VolunteerHelpModel(
                                        cardModel: widget.cardModel,
                                        cubit: widget.cubit,
                                      ),
                                    );
                                  } else {
                                    Fluttertoast.showToast(
                                      msg: LocaleKeys.be_volunteer.tr(),
                                    );
                                  }
                                },
                                text: LocaleKeys.help.tr(),
                                height: 48.w,
                                width: 274.w,
                                color: widget.state.tobeVolunteer
                                    ? AppColorUtils.percentColor
                                    : AppColorUtils.disableBc,
                                textSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                textColor: AppColorUtils.white,
                              ),
                              AppWidgets.favouriteButton(
                                select: widget.cardModel.isFavorite!,
                                height: 48.w,
                                width: 48.w,
                                onTap: () {},
                              )
                            ],
                          ).paddingSymmetric(horizontal: 20.w),
                        ],
                      )
                    : Column(
                        children: [
                          ButtonCard(
                            onPress: () {},
                            text: LocaleKeys.go_to_personal_profile,
                            height: 48.w,
                            width: 1.sw,
                            color: AppColorUtils.blueButton,
                            textSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            textColor: AppColorUtils.white,
                          ).paddingSymmetric(horizontal: 20.w),
                          AppWidgets.starTextWidget(
                            text: LocaleKeys.you_accepted_ad,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColorUtils.dark6,
                          ).paddingOnly(
                            left: 20.w,
                            top: 10.w,
                          )
                        ],
                      )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
