import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/comments_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/kraudfanding_applied_user_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/kraudfanding_authot_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/kraudfanding_price_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/more_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/news_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/payment_history_dialog.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/question_asked_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/support_project_dialog.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:super_rich_text/super_rich_text.dart';

class AboutProjectVolunteerWidget extends StatefulWidget {
  AboutProjectVolunteerWidget({required this.cardModel});

  final CardModel cardModel;

  @override
  _AboutProjectVolunteerWidgetState createState() =>
      _AboutProjectVolunteerWidgetState();
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

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
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
                        imageUrl: widget.cardModel.image!,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
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
                          borderRadius: BorderRadius.horizontal(
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
                text: "Drenajni kuzatish uchun mo’jallangan moslama",
                fontSize: 20.sp,
                color: AppColorUtils.DARK2,
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
                      AppWidgets.starTextWidget(text: "Bajarilgan sana"),
                      SizedBox(
                        height: 3.w,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(AppImageUtils.DATE),
                          AppWidgets.text(
                            text: widget.cardModel.date!,
                            color: AppColorUtils.BLUE_PERCENT,
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
                        text: "E'lon berilgan kun",
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        color: AppColorUtils.DARK_6,
                      ),
                      AppWidgets.text(
                        text: "25.08.2022",
                        color: Color(0xFF043F3B),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ).paddingOnly(top: 3.w),
                    ],
                  )
                ],
              ).paddingSymmetric(horizontal: 20.w),
              AppWidgets.starTextWidget(
                text: "Yordam turi",
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
                color: AppColorUtils.DARK_6,
              ).paddingOnly(top: 13.w, left: 20.w, bottom: 3.w),
              AppWidgets.text(
                      text: "Ovqat qilib berish va uyni yig'ishtirish",
                      maxLines: 2,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: AppColorUtils.GREEN_TEXT)
                  .paddingSymmetric(horizontal: 20.w),
              AppWidgets.textLocale(
                text: "Manzil",
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
                color: AppColorUtils.DARK_6,
              ).paddingOnly(
                left: 20.w,
                top: 12.w,
                bottom: 3.w,
              ),
              AppWidgets.text(
                      text: "Toshkent Shahar, Mirobod tumani*********",
                      fontSize: 14.w,
                      fontWeight: FontWeight.w500,
                      color: AppColorUtils.TEXT_BLUE2,
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
              color: Colors.white, borderRadius: BorderRadius.circular(11.0)),
          child: DefaultTabController(
            initialIndex: 0,
            length: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  indicatorPadding: EdgeInsets.only(right: 10, left: 10),
                  labelPadding: EdgeInsets.only(right: 10, left: 10),
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
                Visibility(
                  visible: true,
                  child: AppWidgets.text(
                      text: "&*& Iltimos, avval //Volontyor// bo'ling",
                      color: AppColorUtils.DARK_6,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.w,
                      richText: true,
                      othersMarkers: [
                        MarkerText(
                          marker: "&",
                          style: TextStyle(
                            color: AppColorUtils.RED,
                          ),
                        ),
                        MarkerText(
                          marker: "//",
                          style: TextStyle(
                            color: AppColorUtils.BLACK,
                          ),
                        )
                      ]),
                ).paddingSymmetric(
                  horizontal: 20.w,
                  vertical: 10.w,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      text: LocaleKeys.project_implementation,
                      height: 48.w,
                      width: 274.w,
                      color: true?AppColorUtils.DISABLE_BC: AppColorUtils.PERCENT_COLOR,
                      textSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      textColor: AppColorUtils.WHITE,
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
            ),
          ),
        ),
      ],
    );
  }
}
