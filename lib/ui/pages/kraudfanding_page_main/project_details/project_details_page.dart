import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/kraudfanding_applied_user_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/kraudfanding_authot_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/kraudfanding_price_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/project_detail_page_header.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/project_details_widgets.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/tabbar_widget.dart';
import 'package:najot/ui/widgets/app_bar_with_title.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../../data/services/navigator_service.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../kraudfanding_page.dart';
import '../kraudfanding_widget/kraudfanding_widgets.dart';

class ProjectDetailsPage extends StatefulWidget {
  static const String routeName = "/projectDetailsPage";

  ProjectDetailsPage({required this.cardModel});

  CardModel cardModel;

  @override
  _ProjectDetailsState createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColorUtils.BACKGROUND,
      appBar: AppBarWithTitle(
        title: 'Loyiha haqida',
        onPress: () {},
      ),
      body: SingleChildScrollView(
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
                                imageUrl: widget.cardModel.image,
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
                      ).paddingSymmetric(horizontal: 20.w, vertical: 18.w)
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
                        Text("Batafsil"),
                        Text("Yangiliklar'"),
                        Text("Berilgan savollar "),
                        Text("Izohlar "),
                      ],
                      isScrollable: true,
                      indicatorWeight: 4,
                      indicatorColor: AppColorUtils.GREEN_APP,
                      indicatorSize: TabBarIndicatorSize.tab,
                      padding: EdgeInsets.only(right: 10),
                      indicatorPadding: EdgeInsets.only(right: 10, left: 10),
                      labelPadding: EdgeInsets.only(right: 10, left: 10),
                    ).paddingOnly(left: 15, top: 8),
                    SizedBox(
                      height: 1000,
                      child: TabBarView(children:
                      List.generate(

                        widget.cardModel.infoModel.length,
                            (index) => Column(
                              children: List.generate(
                                widget.cardModel.infoModel.length,
                                    (index) => listDetail(
                                widget.cardModel.infoModel[index].title,
                                widget.cardModel.infoModel[index].text,
                              ).paddingSymmetric(horizontal: 20.w),),
                            )
                      ),),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      height: 218.h,
                      width: 335.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        child: Image.asset(
                          "assets/images/rasm.jpg",
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      height: 48.h,
                      child: Row(
                        children: [
                          Container(
                            height: 48.h,
                            width: 275.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xFF0BBF90)),
                            child: Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Text("Loyihani qo'llash",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600))),
                          ),
                          SizedBox(width: 13.h),
                          Container(
                            height: 48.h,
                            width: 48.h,
                            child: SvgPicture.asset(
                                "assets/app_icons/like_detail.svg"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
