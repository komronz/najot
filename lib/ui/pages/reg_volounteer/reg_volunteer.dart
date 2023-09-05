import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/bloc/app_page_cubit/app_page_cubit.dart';
import 'package:najot/data/bloc/reg_volunteer_bloc/reg_volunteer_bloc.dart';
import 'package:najot/data/config/const/decoration_const.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/pages/main_page/widgets/button_card_widget.dart';
import 'package:najot/ui/pages/reg_volounteer/widgets/view1.dart';
import 'package:najot/ui/pages/reg_volounteer/widgets/view2.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:super_rich_text/super_rich_text.dart';

class RegVolunteer extends StatefulWidget {
  const RegVolunteer({Key? key}) : super(key: key);

  @override
  _RegVolunteerState createState() => _RegVolunteerState();
}

class _RegVolunteerState extends State<RegVolunteer>
    with SingleTickerProviderStateMixin {
  RegVolunteerBloc bloc = RegVolunteerBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc..add(VolunteerLoad()),
      child: Scaffold(
        backgroundColor: AppColorUtils.BACKGROUND,
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
                  AppImageUtils.MENU,
                  height: 35.w,
                  width: 35.w,
                ),
                onTap: () {
                  HomePage.globalKey.currentState?.openDrawer();
                },
              ),
              AppWidgets.textLocale(
                text: LocaleKeys.be_volunteer,
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: 35.w,
                width: 35.w,
              )
            ],
          ).paddingSymmetric(horizontal: 20),
        ),
        body: BlocConsumer<RegVolunteerBloc, RegVolunteerState>(
          bloc: bloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (AppPageCubit.to.state.user?.status == "CHECKING") {
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
      color: AppColorUtils.WHITE,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Container(
                  width: context.width,
                  height: 280.w,
                  decoration: BoxDecoration(
                    color: AppColorUtils.WAIT_COLOR,
                    shape: BoxShape.circle,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: AppWidgets.imageSvg(
                    path: AppImageUtils.IMG_WAIT,
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
                    color: AppColorUtils.KRAUDFANDING,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
              color: AppColorUtils.DARK2,
            ).paddingOnly(
              top: 24,
              left: 60.w,
              right: 60.w,
            ),
            ButtonCard(
              width: context.width,
              height: 45.w,
              onPress: () {},
              text: LocaleKeys.write_to_the_operator,
              color: AppColorUtils.BLUE_ACCENT1,
              textColor: AppColorUtils.BLUE_TEXT,
              visibleIcon: true,
              iconColor: AppColorUtils.BLUE_TEXT,
              addIcon: AppImageUtils.IC_EARPHONES,
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
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: AppWidgets.imageAsset(
                  path: AppImageUtils.IMG_VOLUNTEER,
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
            color: AppColorUtils.DARK2,
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
            decoration: DecorationConst.DEC_WITH_SHADOW,
            child: Column(
              children: [
                Container(
                  child: SmoothPageIndicator(
                    controller: context.read<RegVolunteerBloc>().pageController,
                    count: 2,
                    effect: WormEffect(
                      dotColor: AppColorUtils.INDICATOR,
                      activeDotColor: AppColorUtils.GREEN_APP,
                    ),
                  ),
                ).paddingOnly(top: 18),
                Container(
                  height: 620.w,
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: context.read<RegVolunteerBloc>().pageController,
                    children: [
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
