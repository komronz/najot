import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/bloc/reg_volunteer_bloc/reg_volunteer_bloc.dart';
import 'package:najot/data/config/const/decoration_const.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/pages/reg_volounteer/widgets/view1.dart';
import 'package:najot/ui/pages/reg_volounteer/widgets/view2.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:super_rich_text/super_rich_text.dart';

class RegVolunteer extends StatefulWidget {
  const RegVolunteer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegVolunteerState();
}

class _RegVolunteerState extends State<RegVolunteer>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegVolunteerBloc(),
      child: Scaffold(
        backgroundColor: AppColorUtils.background,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          titleSpacing: 0,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: SvgPicture.asset(
                  AppImageUtils.menu,
                  height: 35.w,
                  width: 35.w,
                ),
                onTap: () {
                  HomePage.globalKey.currentState!.openDrawer();
                },
              ),
              AppWidgets.textLocale(
                text: LocaleKeys.be_volunteer,
                fontSize: 26.sp,
                fontWeight: FontWeight.w600,
              ),
              SvgPicture.asset(
                AppImageUtils.notification,
                height: 35.w,
                width: 35.w,
              )
            ],
          ).paddingSymmetric(horizontal: 20),
        ),
        body: BlocConsumer<RegVolunteerBloc, RegVolunteerState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.waitVolunteer) {
              return buildWaitBody(context);
            }
            return buildBody(context);
          },
        ),
      ),
    );
  }

  Widget buildWaitBody(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height,
      color: AppColorUtils.white,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Container(
                  width: context.width,
                  height: 280.w,
                  decoration: const BoxDecoration(
                    color: AppColorUtils.waitColor,
                    shape: BoxShape.circle,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: AppWidgets.imageSvg(
                    path: AppImageUtils.imgWait,
                    height: 204.w,
                    width: 160.w,
                  ).paddingOnly(top: 40.w),
                )
              ],
            ).paddingOnly(top: 18),
            AppWidgets.text(
              text: LocaleKeys.information_write_operator.tr(),
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
              height: 1.3,
              richText: true,
              maxLines: 10,
              othersMarkers: [
                MarkerText(
                  marker: '//',
                  style: TextStyle(
                    color: AppColorUtils.kraudfanding,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
              color: AppColorUtils.dark2,
            ).paddingOnly(top: 24, left: 60.w, right: 60.w),
            ButtonCard(
              width: context.width,
              height: 45.w,
              onPress: () {},
              text: LocaleKeys.write_to_the_operator,
              color: AppColorUtils.blueAccent1,
              textColor: AppColorUtils.blueText,
              visibleIcon: true,
              iconColor: AppColorUtils.blueText,
              addIcon: AppImageUtils.icEarphones,
            ).paddingSymmetric(
              horizontal: 70,
              vertical: 24,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 1.sw,
                height: 280.w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: AppWidgets.imageAsset(
                  path: AppImageUtils.imgVolunteer,
                  height: 204.w,
                  width: 160.w,
                ).paddingOnly(top: 40.w),
              )
            ],
          ).paddingOnly(top: 18),
          AppWidgets.text(
            text: LocaleKeys.fill_out_form_volunteer.tr(),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColorUtils.dark2,
            maxLines: 2,
            height: 1.2,
            textAlign: TextAlign.center,
          ).paddingOnly(
            top: 18,
            left: 22,
            right: 22,
          ),
          AppWidgets.starTextWidget(
            text: LocaleKeys.all_data_change,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            isCenter: true,
            fontStyle: FontStyle.italic,
          ).paddingOnly(top: 6),
          Container(
            decoration: DecorationConst.decWithShadow,
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: context.read<RegVolunteerBloc>().pageController,
                  count: 2,
                  effect: const WormEffect(
                    dotColor: AppColorUtils.indicator,
                    activeDotColor: AppColorUtils.greenApp,
                  ),
                ).paddingOnly(top: 18),
                SizedBox(
                  height: 620.w,
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: context.read<RegVolunteerBloc>().pageController,
                    children: const [
                      View1(),
                      View2(),
                    ],
                  ),
                )
              ],
            ),
          ).paddingOnly(top: 17)
        ],
      ),
    );
  }
}
