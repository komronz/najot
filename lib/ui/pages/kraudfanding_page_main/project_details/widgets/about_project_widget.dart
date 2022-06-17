

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/main_page/widgets/button_card_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/comment_to_author_dialog.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/kraudfanding_applied_user_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/kraudfanding_authot_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/kraudfanding_price_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/payment_history_dialog.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/support_project_dialog.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import 'more_widget.dart';
import 'news_widget.dart';

class AboutProjectWidget extends StatefulWidget {
   AboutProjectWidget({required this.cardModel}) ;
    final ProjectModel cardModel;
  @override
  _AboutProjectWidgetState createState() => _AboutProjectWidgetState();
}

class _AboutProjectWidgetState extends State<AboutProjectWidget>
    with TickerProviderStateMixin{
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

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }

  }

  @override
  Widget build(BuildContext context) {
    var modifiedAt= DateTime.parse(widget.cardModel.modifiedAt!);

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
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
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: widget.cardModel.cover!,
                        fit: BoxFit.cover,
                        width:
                        MediaQuery.of(context).size.width,
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                            Icon(Icons.error),
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
                            return PaymentHistoryDialog();
                          },
                        );
                      },
                      child: Container(
                        height: 35.w,
                        width: 60.w,
                        decoration: BoxDecoration(
                          color: AppColorUtils.BLUE_PERCENT,
                          borderRadius:
                          BorderRadius.horizontal(
                            left: Radius.circular(12),
                          ),
                        ),
                        child: Icon(
                          Icons.monetization_on_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              AppWidgets.text(
                text:  widget.cardModel.title!,
                fontSize: 20.sp,
                color: AppColorUtils.DARK2,
                fontWeight: FontWeight.w500,
                maxLines: 2,
              ).paddingSymmetric(horizontal: 20.w),
              KraudfandingAuthorWidget(
                  model: widget.cardModel,
              onTap: (){
                showDialog(
                  context: context,
                  builder: (context) {
                    return CommentToAuthorDialog();
                  },
                );
              },
              ).paddingOnly(top: 15.w),
              SizedBox(height: 12.w),
              KraudfandingPriceWidget(model: widget.cardModel),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  KraudfandingAppliedUserWidgets(
                    model: widget.cardModel,
                  ),
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      AppWidgets.starTextWidget(
                        text: LocaleKeys.must_collect_date.tr(),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            color: AppColorUtils.BLUE_PERCENT,
                            size: 14.sp,
                          ),
                          AppWidgets.text(
                            text: DateFormat("dd.MM.yyyy").format(modifiedAt),
                            color: AppColorUtils.BLUE_PERCENT,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                          ).paddingOnly(left: 6.w),
                        ],
                      ).paddingOnly(top: 10.w)
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
              color: AppColorUtils.WHITE,
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
                  indicatorColor: AppColorUtils.GREEN_APP,
                  indicatorSize: TabBarIndicatorSize.tab,
                  padding: EdgeInsets.only(right: 10),
                  indicatorPadding:
                  EdgeInsets.only(right: 10, left: 10),
                  labelPadding:
                  EdgeInsets.only(right: 10, left: 10),
                ).paddingOnly(left: 15.w, top: 8.w),
                Container(
                  child: [

                    MoreWidget(
                      cardModel: widget.cardModel,
                    ),
                    NewsWidget(
                      cardModel: widget.cardModel,
                    ).paddingAll(20.w),
                    Container(),
                    Container(),
                    // QuestionsAskedWidget(
                    //   cardModel: widget.cardModel,
                    // ).paddingAll(20.w),
                    // CommentsWidget(
                    //   cardModel: widget.cardModel,
                    // ).paddingAll(20.w)
                  ][_tabController.index],
                ),
                SizedBox(
                  height: 10.w,
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonCard(
                      onPress: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return SupportProjectDialog();
                          },
                        );
                      },
                      text: LocaleKeys.project_implementation.tr(),
                      height: 48.w,
                      width: 274.w,
                      color: AppColorUtils.PERCENT_COLOR,
                      textSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      textColor: AppColorUtils.WHITE,
                    ),
                    AppWidgets.favouriteButton(
                      select: true,
                      height: 48.w,
                      width: 48.w,
                      onTap: () {},
                    ),
                  ],
                ).paddingSymmetric(horizontal: 20.w),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
