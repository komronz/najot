import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/config/const/decoration_const.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';

import '../../widgets/app_widgets.dart';
import '../home_page/home_page.dart';

class MyVolunteeringPage extends StatelessWidget {
  const  MyVolunteeringPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
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
                HomePage.globalKey.currentState!.openDrawer();
              },
            ),
            AppWidgets.textLocale(
              text: LocaleKeys.volunteering,
              fontSize: 26.sp,
              fontWeight: FontWeight.w600,
            ),
            SvgPicture.asset(
              AppImageUtils.NOTIFICATION,
              height: 35.w,
              width: 35.w,
              fit: BoxFit.fill,
            )
          ],
        ).paddingSymmetric(horizontal: 20),
      ),
      body: _buildBody(context),

    );
  }
  Widget _buildBody(BuildContext context){
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Container(
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
                Text("Meni kutayotganlar"),
                Text("Buyumlar xayriyasi"),
              ],
              isScrollable: true,
              indicatorWeight: 1.5,
              indicatorColor: AppColorUtils.GREEN_APP,
              indicatorSize: TabBarIndicatorSize.label,
              // padding: EdgeInsets.only(right: 10),
              // indicatorPadding: EdgeInsets.only(right: 10, left: 10),
              // labelPadding: EdgeInsets.only(right: 10, left: 10),
            ).paddingOnly(left: 15, top: 18),
            Expanded(
              child: TabBarView(
                children: [
                  // KraufandingListWidget(list: state.kraufandingList),
                  // CharityListWidget(list: state.charityList)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
