import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/bloc/home_cubit/home_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/volunteer_page/volunteer_page.dart';
import 'package:najot/ui/pages/home_page/widget/carousel_slider_widget.dart';
import 'package:najot/ui/pages/home_page/widget/drawer_body_widget.dart';
import 'package:najot/ui/pages/home_page/widget/icon_name_widget.dart';
import 'package:najot/ui/pages/home_page/widget/kraudfanding_card_widget.dart';
import 'package:najot/ui/pages/home_page/widget/volunteer_card_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  static const String routeName = "/homePage";
  HomeCubit cubit = HomeCubit();
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => cubit,
      child: SafeArea(
        child: Scaffold(
          key: _globalKey,
          drawer: DrawerBody(),
          body: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Container(
                color: AppColorUtils.BACKGROUND,
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: SvgPicture.asset(AppImageUtils.MENU),
                            onTap: () {
                              _globalKey.currentState?.openDrawer();
                            },
                          ),
                          AppWidgets.textLocale(
                            text: LocaleKeys.main,
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                          ),
                          SvgPicture.asset(AppImageUtils.NOTIFICATION)
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CarouselSliderWidget(sliderList: state.sliderList),
                            SizedBox(
                              height: 20.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppWidgets.textLocale(
                                  text: "Kategoriyalar",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22.sp,
                                ).paddingOnly(left: 20.w),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20, top: 10, bottom: 20, left: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconAndName(
                                        text: 'Kraudfanding',
                                        icon: AppImageUtils.KRAUDFANDING,
                                        fontWeight: FontWeight.w600,
                                        fontsize: 14.sp,
                                        color: AppColorUtils.KRAUDFANDING,
                                        voidCallback: () {},
                                      ),
                                      IconAndName(
                                        text: 'Volontyorlik',
                                        icon: AppImageUtils.VOLONTYOR,
                                        fontWeight: FontWeight.w600,
                                        fontsize: 14.sp,
                                        color: AppColorUtils.VOLONTYOR,
                                        voidCallback: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => VolunteerPage()
                                            ),
                                          );
                                        },
                                      ),
                                      IconAndName(
                                        text: 'Xayriya',
                                        icon: AppImageUtils.CHARITY,
                                        fontWeight: FontWeight.w600,
                                        fontsize: 14,
                                        color: AppColorUtils.CHARITY,
                                        voidCallback: () {},
                                      ),
                                    ],
                                  ),
                                ),
                                AppWidgets.textLocale(
                                  text: "Kraudfanding",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22.sp,
                                ).paddingOnly(left: 20.w),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                  height: 300.h,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: List.generate(
                                        state.sliderList.length,
                                        (index) => Container(
                                          margin: EdgeInsets.only(left: 10.w),
                                          child: KraudfandingCardWidget(
                                            sliderModel:
                                                state.sliderList[index],
                                            visible: true,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                AppWidgets.textLocale(
                                  text: "Volontyorlik",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22.sp,
                                ).paddingOnly(
                                  left: 20.w,
                                  top: 20.h,
                                ),
                                SizedBox(
                                  height: 300.h,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: List.generate(
                                        state.sliderList.length,
                                        (index) => Container(
                                          margin: EdgeInsets.only(left: 10.w),
                                          child: VolunteerCardWidget(
                                            sliderModel:
                                                state.sliderList[index],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                AppWidgets.textLocale(
                                  text: "Xayriya",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22.sp,
                                ).paddingOnly(
                                    left: 20.w, top: 10.h, bottom: 10.h),
                                SizedBox(
                                  height: 300.h,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: List.generate(
                                        state.sliderList.length,
                                        (index) => Container(
                                          margin: EdgeInsets.only(left: 10.w),
                                          child: KraudfandingCardWidget(
                                            sliderModel:
                                                state.sliderList[index],
                                            visible: false,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
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
