import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/charity_model.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/charity_full_page/charity_full_page.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/widgets/app_bar_with_title.dart';
import 'package:najot/ui/widgets/app_search_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CharityPage extends StatelessWidget {
  const CharityPage({Key? key}) : super(key: key);
  static const String routeName = '/routeName';

  @override
  Widget build(BuildContext context) {
    var model = CharityModel(
      title: "Anjelani operasiyasiga pul kerak!Anjelani operasiyasiga pul kerak!Anjelani operasiyasiga pul kerak!",
      applied: 100,
      author: "Abdumalik Sapoqulov Abdumalik SapoqulovAbdumalik Sapoqulov",
      createdDate: '13.03.2022',
      currentSum: "60 000 000",
      imgUrl:
          "https://i.pinimg.com/originals/e8/8d/83/e88d83f2b1f35aaaca76096455712f42.png",
      percent: 60.0,
      totalSum: "100 000 000",
      isFavorite: true,
    );
    return Scaffold(
      appBar: AppBarWithTitle(
        title: "Xayriya",
        onPress: () {},
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
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.w),
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
                        text: "Elon berish",
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
              text: "Yangi qo'shilganlar",
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ).paddingOnly(top: 30.w, left: 20),
            SizedBox(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    10,
                    (index) => CharityItemWidget(
                      onTap: () {
                        NavigatorService.to.pushNamed(
                          CharityFullPage.routName,
                          arguments: model,
                        );
                      },
                      model: model,
                    ),
                  ),
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
                        blurRadius: 11,)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppWidgets.textLocale(
                      text: "Kategoriyalar",
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                    ).paddingOnly(left: 24, top: 18),
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
                        Text("Barchasi"),
                        Text("Mablag'"),
                        Text("Buyumlar"),
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
                      child: TabBarView(
                        children: [
                          GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            physics: ClampingScrollPhysics(),
                            childAspectRatio: 160 / 267,
                            padding: EdgeInsets.all(0),
                            reverse: false,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 6,
                            children: List.generate(
                              10,
                              (index) => CharityItemWidget(
                                onTap: () {},
                                model: model,
                              ),
                            ),
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
                            children: List.generate(
                              3,
                              (index) => CharityItemWidget(
                                onTap: () {},
                                model: model,
                              ),
                            ),
                          ),
                          GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            physics: ClampingScrollPhysics(),
                            childAspectRatio: 160 / 267,
                            padding: EdgeInsets.all(0),
                            reverse: false,
                            children: List.generate(
                              5,
                              (index) => CharityItemWidget(
                                onTap: () {},
                                model: model,
                              ),
                            ),
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 10),
                    )
                  ],
                ),
              ).paddingOnly(top: 18.w),
            )
          ],
        ),
      ),
    );
  }
}

class CharityItemWidget extends StatelessWidget {
  final CharityModel model;
  final VoidCallback onTap;

  const CharityItemWidget({
    required this.model,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(11, 191, 144, 0.08),
              blurRadius: 12,
              offset: Offset(0, 5),
            )
          ],
        ),
        width: 160.w,
        height: 267.w,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(12)),
                          child: CachedNetworkImage(
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(),
                            ),
                            imageUrl: model.imgUrl!,
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: SizedBox()),
                      InkWell(
                        child: FavoriteButton(
                          isFavorite: model.isFavorite!,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ).paddingAll(10)
                ],
              ),
              flex: 1,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppWidgets.text(
                    text: model.title!,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    maxLines: 2,
                  ),
                  LinearPercentIndicator(
                    animation: true,
                    padding: EdgeInsets.all(0),
                    lineHeight: 10.h,
                    animationDuration: 2000,
                    percent: model.percent! / 100,
                    progressColor: AppColorUtils.PERCENT_COLOR,
                    backgroundColor: AppColorUtils.PERCENT_COLOR2,
                  ).paddingOnly(top: 12.w),
                  AppWidgets.textLocale(
                    text: "Bajarildi",
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColorUtils.DARK_6,
                  ).paddingOnly(top: 12.w),
                  AppWidgets.text(
                    text: "${model.percent.toString().split(".").first}%",
                    fontWeight: FontWeight.w600,
                    color: AppColorUtils.BLUE_PERCENT,
                  ).paddingOnly(top: 5.w),
                ],
              ).paddingSymmetric(vertical: 14, horizontal: 12),
              flex: 1,
            )
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;

  const FavoriteButton({
    this.isFavorite = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isFavorite
        ? Container(
            width: 24.w,
            height: 24.w,
            decoration: BoxDecoration(
              color: AppColorUtils.PURPLE,
              borderRadius: BorderRadius.circular(2),
            ),
            child: AppWidgets.imageSvg(
              path: AppImageUtils.UNLIKE,
              fit: BoxFit.none,
            ),
          )
        : Container(
            width: 24.w,
            height: 24.w,
            decoration: BoxDecoration(
              color: AppColorUtils.IC_GREEN,
              borderRadius: BorderRadius.circular(2),
            ),
            child: AppWidgets.imageSvg(
              path: AppImageUtils.IC_FAVORITE_ADD,
              fit: BoxFit.none,
            ),
          );
  }
}
