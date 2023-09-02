import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/volunteer_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/data/utils/app_logger_util.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import '../../../../data/services/navigator_service.dart';
import '../my_charity_item_project_full_widget/my_charity_item_full_page.dart';
import '../my_charity_project_full_widget/my_charity_project_full_page.dart';
import 'charity_cash_widget.dart';
import 'charity_item_project_widget.dart';

class MyCharityProjectList extends StatelessWidget {
  final RootProjectModel? list;

  const MyCharityProjectList({
    required this.list,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (list==null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppWidgets.imageSvg(
            path: AppImageUtils.IMG_CHARITY_EMPTY,
            height: 70.w,
            width: 70.w,
            fit: BoxFit.none,
          ).paddingOnly(top: 80.w),
          AppWidgets.textLocale(
            text: 'ERROR',
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            maxLines: 2,
            textAlign: TextAlign.center,
            color: AppColorUtils.GRAY_4,
          ).paddingOnly(
            top: 20.w,
            right: 80.w,
            left: 80.w,
          ),
        ],
      );
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            physics: ClampingScrollPhysics(),
            childAspectRatio: 168 / 320,
            padding: EdgeInsets.only(bottom: 15),
            reverse: false,
            children: List.generate(
              list!.results!.length,
              (index) {
                  if(  list!.results![index].requiredFund==null){
                    return CharityItemProjectWidget(
                      model:  list!.results![index],
                      onTap: () {
                        AppLoggerUtil.d("looog1: Clock1");
                        NavigatorService.to.pushNamed(MyCharityItemFullPage.routeName,
                            arguments:  list!.results![index]);
                      },
                    ).paddingOnly(bottom: 10);
                  }else{
                   return CharityCashWidget(
                      model:  list!.results![index],
                      onTap: () {
                        AppLoggerUtil.d("looog1: Clock2");
                        NavigatorService.to.pushNamed(
                            MyCharityProjectFullPage.routeName,
                            arguments:  list!.results![index]);
                      },
                    ).paddingOnly(bottom: 10);
                  }
              }
            ),
          ),
        ],
      ).paddingOnly(
        left: 20.w,
        top: 10.w,
        right: 10.w,
      ),
    );
  }
}
