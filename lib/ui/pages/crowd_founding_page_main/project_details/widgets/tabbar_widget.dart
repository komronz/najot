import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/crowd_founding_detail_cubit/crowd_founding_detail_cubit.dart';
import 'package:najot/data/utils/app_color_utils.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget(this._controller, this.title1, this.title2, {Key? key})
      : super(key: key);

  static int index = 0;
  final TabController _controller;
  final String title1;
  final String title2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColorUtils.white,
              borderRadius: BorderRadius.circular(11.0)),
          alignment: Alignment.center,
          child: DefaultTabController(
            initialIndex: 0,
            length: 2,
            child: Container(
              height: 46.w,
              padding: const EdgeInsets.all(3),
              margin: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              decoration: BoxDecoration(
                  color: AppColorUtils.background,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    width: 1,
                    color: AppColorUtils.divider,
                  )),
              child: TabBar(
                controller: _controller,
                unselectedLabelColor: AppColorUtils.greenTab,
                labelColor: AppColorUtils.white,
                onTap: (i) {
                  if (i == 0) {
                    context.read<CrowdFoundingDetailCubit>().tabChange(0);
                  } else {
                    context.read<CrowdFoundingDetailCubit>().tabChange(1);
                  }
                },
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColorUtils.percentColor,
                ),
                tabs: [
                  Tab(
                    child: Text(
                      title1,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      title2,
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
