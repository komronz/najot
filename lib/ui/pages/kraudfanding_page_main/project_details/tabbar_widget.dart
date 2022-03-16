import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class TabBarWidget extends StatelessWidget {
  TabBarWidget({Key? key}) : super(key: key);
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColorUtils.WHITE,
              borderRadius: BorderRadius.circular(11.0)),
          alignment: Alignment.center,
          child: DefaultTabController(
            initialIndex: 1,
            length: 2,
            child: Container(
              height: 46.w,
              padding: EdgeInsets.all(3),
              margin: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              decoration: BoxDecoration(
                  color: AppColorUtils.BACKGROUND,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    width: 1,
                    color: AppColorUtils.DIVIDER,
                  )),
              child: TabBar(
                unselectedLabelColor: AppColorUtils.BLACK,
                labelColor: AppColorUtils.WHITE,
                onTap: (i) {
                  if (i == 1) {
                    index = 1;
                  } else {
                    index = 0;
                  }
                },
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColorUtils.PERCENT_COLOR,
                ),
                tabs: [
                  Tab(
                    child: Text("Loyiha haqida"),
                  ),
                  Tab(
                    child: Text(
                      "Mahsulotlar",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
