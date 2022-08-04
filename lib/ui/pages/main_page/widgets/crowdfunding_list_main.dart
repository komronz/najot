

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/bloc/crowdFounding_cubit/kraud_fanding_cubit.dart';
import '../../../../data/bloc/home_cubit/home_cubit.dart';
import '../../../../data/services/navigator_service.dart';
import '../../crowdfunding_page_main/project_details/project_details_page.dart';
import 'crowdfunding_card_widget.dart';

class CrowdFundingListMain extends StatelessWidget {
  CrowdFundingListMain({required this.homeCubit, required this.state});

  final HomeCubit homeCubit;
  HomeState state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.w,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            state.crudFunding.length,
                (index) => Container(
              margin: EdgeInsets.only(left: 10.w),
              child: CrowdfundingCardWidget(
                projectModel: state.crudFunding[index],
                visible: true,
                onTap: () {
                  NavigatorService.to.pushNamed(
                    ProjectDetailsPage.routeName,
                    arguments: CrowdfundingDetailModel(
                      cubit: CrowdfundingCubit.to,
                      cardModel: state.crudFunding[index],
                    ),
                  );
                },
                onTapLike: () async {
                  await homeCubit.changeLike(state.crudFunding[index].id!);
                  homeCubit.crowdFundingChangeLike(
                    index,
                    state.crudFunding[index].isFavourite!,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}