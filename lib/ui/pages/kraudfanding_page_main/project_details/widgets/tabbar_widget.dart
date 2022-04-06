import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/kraudfanding_detail_cubit/kraudfanding_detail_cubit.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/project_details_page.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TabBarWidget extends StatelessWidget {
  TabBarWidget(this._controller);
 static int index = 0;
  TabController _controller;

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
            initialIndex: 0,
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
                controller: _controller,
                unselectedLabelColor: AppColorUtils.GREEN_TAB,
                labelColor: AppColorUtils.WHITE,
                onTap: (i) {
                  if (i == 0) {
                    context.read<KraudfandingDetailCubit>().tabChange(0);
                  } else {
                    context.read<KraudfandingDetailCubit>().tabChange(1);
                  }

                },
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColorUtils.PERCENT_COLOR,
                ),
                tabs: [
                  Tab(
                    child: Text(
                      LocaleKeys.about_project.tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      LocaleKeys.products.tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
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