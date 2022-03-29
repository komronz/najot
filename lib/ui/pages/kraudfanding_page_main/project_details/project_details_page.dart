import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/kraudfanding_applied_user_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/kraudfanding_authot_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/kraudfanding_price_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/more_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/news_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/question_asked_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/support_project_dialog.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/tabbar_widget.dart';
import 'package:najot/ui/widgets/app_bar_with_title.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/services/navigator_service.dart';
import '../../../../data/utils/app_color_utils.dart';

class ProjectDetailsPage extends StatefulWidget {
  static const String routName = '/projectDetailsPage';

  ProjectDetailsPage({required this.cardModel});

  CardModel cardModel;

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController controller = TextEditingController();
  final TextEditingController controller1 = TextEditingController();

  @override
  void dispose() {
    _tabController.dispose();
    controller.dispose();
    controller1.dispose();
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
    return Scaffold(
      backgroundColor: AppColorUtils.BACKGROUND,
      appBar: AppBarWithTitle(
        title: 'Loyiha haqida',
        onPress: () {
          NavigatorService.to.pop();
        },
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(11.0)),
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 15.w,
                      ),
                      TabBarWidget(),
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
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 120.w,
                            right: 0,
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
                      KraudfandingAuthorWidget(model: widget.cardModel)
                          .paddingOnly(top: 15.w),
                      SizedBox(height: 12.w),
                      KraudfandingPriceWidget(model: widget.cardModel),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          KraudfandingAppliedUserWidgets(
                            model: widget.cardModel,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppWidgets.starTextWidget(
                                text: "Sanagacha to'planishi kerak",
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
                        Text("Batafsil"),
                        Text("Yangiliklar'"),
                        Text("Berilgan savollar "),
                        Text("Izohlar "),
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
                        MoreWidget(widget: widget),
                        NewsWidget(widget: widget).paddingAll(20.w),
                        QuestionsAskedWidget(widget: widget).paddingAll(20.w),
                        comments().paddingAll(20.w)
                      ][_tabController.index],
                    ),
                    SizedBox(
                      height: 10.w,
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
                          color: AppColorUtils.PERCENT_COLOR,
                          textSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          textColor: AppColorUtils.WHITE,
                        ),
                        Material(
                          child: Ink(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: widget.cardModel.isFavorite!
                                  ? AppColorUtils.IC_GREEN
                                  : AppColorUtils.PURPLE,
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {},
                              child: Container(
                                height: 48.w,
                                width: 48.w,
                                child: SvgPicture.asset(
                                  widget.cardModel.isFavorite!
                                      ? AppImageUtils.LIKE_ICON
                                      : AppImageUtils.UNLIKE_ICON,
                                ).paddingAll(12.w),
                              ),
                            ),
                          ),
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
    );
  }

  Widget comments() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 12.w,
            left: 12.w,
            right: 12.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColorUtils.GREEN_ACCENT4,
          ),
          child: Column(
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
                          image: NetworkImage(
                            widget.cardModel.image!,
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: AppWidgets.text(
                          text: "Zo'r loyiha",
                          color: AppColorUtils.TEXT_GREEN2,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                        width: 220.w,
                      ),
                      AppWidgets.textLocale(
                        text: "Eshonov Fakhriyor",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColorUtils.DARK_6,
                      ).paddingOnly(top: 5.w),
                    ],
                  ).paddingOnly(left: 10),
                ],
              ),
              AppWidgets.text(
                text: widget.cardModel.infoModel![0].text!,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: AppColorUtils.TEXT_GREY2,
                maxLines: 100,
                height: 1.5,
              ).paddingSymmetric(vertical: 15.w),
            ],
          ),
        ),
        Divider(
          thickness: 1,
          color: AppColorUtils.BLACK_12,
        ),
        AppWidgets.textLocale(
          text: LocaleKeys.writing_comment.tr(),
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: AppColorUtils.TEXT_GREEN2,
        ).paddingSymmetric(vertical: 8.w),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: TextFormField(
                controller: controller,
                onChanged: (v) {
                  setState(() {
                    controller.text;
                  });
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.w,
                    horizontal: 18.w,
                  ),
                  hintText: LocaleKeys.comment_title,
                  hintStyle:
                      TextStyle(color: AppColorUtils.GRAY_4, fontSize: 16.sp),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              width: 270.w,
            ),
            Material(
              child: Ink(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: controller1.text == ""
                      ? AppColorUtils.DISABLE_BC
                      : AppColorUtils.PERCENT_COLOR,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () {},
                  child: Container(
                    height: 46.w,
                    width: 46.w,
                    child: Icon(
                      Icons.arrow_upward,
                      color: AppColorUtils.WHITE,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        TextFormField(
          maxLines: 10,
          controller: controller1,
          onChanged: (v) {
            setState(() {
              controller.text;
            });
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 10.w,
              horizontal: 18.w,
            ),
            hintText: LocaleKeys.write_your_comment.tr(),
            hintStyle: TextStyle(color: AppColorUtils.GRAY_4, fontSize: 16.sp),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColorUtils.LINE_TEXT_FIELD,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ).paddingOnly(top: 12.w),
      ],
    );
  }
}


