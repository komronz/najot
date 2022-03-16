import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/kraudfanding_cubit/kraud_fanding_cubit.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/widgets/app_bar_with_title.dart';
import 'package:najot/ui/widgets/app_search_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'kraudfanding_widget/kraudfanding_mini_card_widget.dart';
import 'kraudfanding_widget/kraudfanding_widgets.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';

class KraudFandingPage extends StatefulWidget {
  static const String routeName = "/kraudFandingPage";

  const KraudFandingPage({Key? key}) : super(key: key);

  @override
  _KraudFandingPageState createState() => _KraudFandingPageState();
}

class _KraudFandingPageState extends State<KraudFandingPage> {
  KraudFandingCubit cubit = KraudFandingCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColorUtils.BACKGROUND,
          appBar: AppBarWithTitle(
            title: 'Kraudfanding',
            onPress: () {},
          ),
          body: BlocBuilder<KraudFandingCubit, KraudFandingState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSearchWidget(
                      onChange: (v) {},
                      search: () {},
                    ).paddingOnly(left: 20.w, right: 20.w, bottom: 15.w),
                    KraudFandingBanner(),
                    AppWidgets.textLocale(
                            text: "Yangi Qo'shilganlar",
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColorUtils.DARK2)
                        .paddingOnly(
                      top: 24.w,
                      bottom: 15.w,
                      left: 18,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          state.cardList.length,
                          (index) => KraudfandingMiniCardWidget(
                            cardModel: state.cardList[index],
                            visible: true,
                          ).paddingOnly(left: 10.w),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.0.w,
                    ),
                    DefaultTabController(
                      length: 3,
                      child: Container(
                        width: 375.w,
                        height: 1000.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(11.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20.w,top: 15.w),
                              child: Text(
                                "Kategoriyalar",
                                style: TextStyle(
                                    color: Color(0xFF414042),
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,),
                              ),
                            ),

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
                                Text("Texnologiya'"),
                                Text("Texnologiya"),

                              ],
                              isScrollable: true,
                              indicatorWeight: 2,
                              indicatorColor: AppColorUtils.TEXT_GREEN,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicatorPadding:
                                  EdgeInsets.only(right: 10, left: 10),
                              labelPadding:
                                  EdgeInsets.only(right: 10, left: 10),
                            ).paddingOnly(left: 10.w, top: 8),
                            SizedBox(
                              height: 24.0.h,
                            ),
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
                                      state.cardList.length,
                                      (index) => KraudfandingMiniCardWidget(
                                        visible: true,
                                        cardModel: state.cardList[index],
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
                                      state.cardList.length,
                                          (index) => KraudfandingMiniCardWidget(
                                        visible: true,
                                        cardModel: state.cardList[index],
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
                                      state.cardList.length,
                                          (index) => KraudfandingMiniCardWidget(
                                        visible: true,
                                        cardModel: state.cardList[index],
                                      ),
                                    ),
                                  ),


                                ],
                              ).paddingSymmetric(horizontal: 10),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class KraudFandingBanner extends StatelessWidget {
  const KraudFandingBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 163.w,
      width: 359.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: AppColorUtils.BACK_AD,
        border: Border.all(
          width: 1,
          color: AppColorUtils.DIVIDER,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Image.asset(AppImageUtils.Splash2),
          ),
          SizedBox(width: 14.w),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(top: 20.w, bottom: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppWidgets.text(
                  text: "G'oya bor ammo mablag' yo'qmi?",
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  maxLines: 2,
                  color: AppColorUtils.TEXT_GREY,
                ),
                SizedBox(height: 10.w),
                AppWidgets.text(
                  text: "Biz sizga yordam beramiz!",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                  maxLines: 1,
                  color: AppColorUtils.TEXT_GREY,
                ),
                SizedBox(height: 20.w),
                ButtonCard(
                  onPress: () {},
                  height: 35.w,
                  width: 146.w,
                  text: "Loyiha qo'shish",
                  color: AppColorUtils.PERCENT_COLOR,
                  textColor: AppColorUtils.WHITE,
                  textSize: 12.sp,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
