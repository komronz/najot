import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/widgets/app_search_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class CharityPage extends StatelessWidget {
  const CharityPage({Key? key}) : super(key: key);
  static const String routeName = '/routeName';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorUtils.BACKGROUND,
      body: Column(
        children: [
          AppWidgets.appBarWidget(
            title: "Xayriya",
            onTap: () {},
          ),
          AppSearchWidget(
            onChange: (v) {},
            search: () {},
          ).paddingSymmetric(horizontal: 20, vertical: 24),
        ],
      ).paddingOnly(top: 30.w),
    );
  }
}
