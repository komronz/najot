import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/bloc/my_volunteering_cubit/my_volunteering_cubit.dart';
import 'package:najot/data/config/const/decoration_const.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';

import '../../widgets/app_widgets.dart';
import '../home_page/home_page.dart';
import '../notification_page/notification_page.dart';
import 'my_volunteering_widget/item_charity_widget.dart';
import 'my_volunteering_widget/my_volunteering_drawer_body.dart';
import 'my_volunteering_widget/waiting_for_widget.dart';

class MyVolunteeringPage extends StatelessWidget {
  static const String routeName = '/myVolunteeringPage';

  const MyVolunteeringPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyVolunteeringCubit(),
      child: BlocBuilder<MyVolunteeringCubit, MyVolunteeringState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            titleSpacing: 0,
            title: Builder(
              builder: (context) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: SvgPicture.asset(
                      AppImageUtils.MENU,
                      height: 35.w,
                      width: 35.w,
                    ),
                    onTap: () {
                      HomePage.globalKey.currentState!.openDrawer();
                    },
                  ),
                  AppWidgets.textLocale(
                    text: LocaleKeys.volunteering,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  InkWell(
                    child: SvgPicture.asset(
                      AppImageUtils.NOTIFICATION,
                      height: 35.w,
                      width: 35.w,
                      fit: BoxFit.fill,
                    ),
                    onTap: (){
                     NavigatorService.to.pushNamed(NotificationPage.routeName,);
                    },
                  ),
                ],
              ).paddingSymmetric(horizontal: 20),
            ),
          ),
          body: _buildBody(context, state),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, MyVolunteeringState state) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: DecorationConst.DEC_WITH_SHADOW,
        height: context.height,
        width: context.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            TabBar(
              enableFeedback: true,
              labelColor: AppColorUtils.GREEN_APP,
              unselectedLabelColor: AppColorUtils.DARK_6,
              unselectedLabelStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
              labelStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              tabs: [
                Text(LocaleKeys.waiting_for_me.tr()),
                Text(LocaleKeys.item_charity.tr()),
              ],
              isScrollable: true,
              indicatorWeight: 1.5,
              indicatorColor: AppColorUtils.GREEN_APP,
              indicatorSize: TabBarIndicatorSize.label,
              // padding: EdgeInsets.only(right: 10),
              // indicatorPadding: EdgeInsets.only(right: 10, left: 10),
              // labelPadding: EdgeInsets.only(right: 10, left: 10),
            ).paddingOnly(bottom: 25),
            Expanded(
              child: TabBarView(
                children: [
                  ListView(
                    shrinkWrap: true,
                    primary: false,
                    physics: ClampingScrollPhysics(),
                    padding: EdgeInsets.all(0),
                    reverse: false,
                    children: List.generate(
                      state.cardList.length,
                      (index) => WaitingForWidget(
                        model: state.cardList[index],
                      ),
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    primary: false,
                    physics: ClampingScrollPhysics(),
                    padding: EdgeInsets.all(0),
                    reverse: false,
                    children: List.generate(
                      state.cardList.length,
                      (index) => ItemCharityWidget(
                        model: state.cardList[index],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
