import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/crowd_founding_model.dart';

import '../../../../data/config/const/decoration_const.dart';
import '../../../../data/services/navigator_service.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../widgets/app_bar_with_title.dart';
import 'my_crowdfunding_products_page.dart';
import 'my_crowdfunding_support_list_widget.dart';

class MyCrowdfundingSupportPage extends StatelessWidget {
  static const String routeName = "/myCrowdfundingSupportPage";
  final List<CrowdFoundingModel> list;

  const MyCrowdfundingSupportPage({required this.list, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithTitle(
        title: " Loyihani qo’llaganlar",
        onPress: () {
          NavigatorService.to.pop();
        },
      ),
      body: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Container(
          decoration: DecorationConst.decWithShadow,
          height: context.height,
          width: context.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              TabBar(
                enableFeedback: true,
                labelColor: AppColorUtils.greenApp,
                unselectedLabelColor: AppColorUtils.dark6,
                unselectedLabelStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                labelStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                tabs: const [
                  Text("Mablag'"),
                  Text("Mahsulot sotib olganlar"),
                ],
                isScrollable: true,
                indicatorWeight: 1.5,
                indicatorColor: AppColorUtils.greenApp,
                indicatorSize: TabBarIndicatorSize.label,
                // padding: EdgeInsets.only(right: 10),
                // indicatorPadding: EdgeInsets.only(right: 10, left: 10),
                // labelPadding: EdgeInsets.only(right: 10, left: 10),
              ).paddingOnly(left: 15, top: 18),
              Expanded(
                child: TabBarView(
                  children: [
                    MyCrowdfundingSupportListWidget(
                      list: list,
                    ),
                    const MyCrowdfundingProductPage(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
