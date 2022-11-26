import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/organization_cubit/organization_cubit.dart';

import '../../../../data/bloc/crowdFounding_cubit/kraud_fanding_cubit.dart';
import '../../../../data/bloc/home_cubit/home_cubit.dart';
import '../../../../data/services/navigator_service.dart';
import '../../charity_page/charity_full_page/charity_full_page2.dart';
import '../../crowdfunding_page_main/project_details/project_details_page.dart';
import 'charity_card_widget.dart';
import 'crowdfunding_card_widget.dart';

class CharityListMain extends StatelessWidget {
  CharityListMain({
    required this.homeCubit,
    required this.state,
  });

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
          children: List.generate(state.charity.length, (index) {
            if (state.charity[index].requiredFund == null) {
              return Container(
                margin: EdgeInsets.only(left: 10.w),
                child: CharityCardWidget(
                  projectModel: state.charity[index],
                  onTap: () {
                    NavigatorService.to.pushNamed(
                      CharityFullPage2.routName,
                      arguments: state.charity[index],
                    );
                  },
                  onTapLike: () async {
                    await homeCubit.changeLike(state.charity[index].id!);
                    homeCubit.getModel();
                    homeCubit.charityChangeLike(
                      index,
                      state.charity[index].isFavourite!,
                    );
                  },
                ),
              );
            } else {
              return Container(
                margin: EdgeInsets.only(left: 10.w),
                child: CrowdfundingCardWidget(
                  projectModel: state.charity[index],
                  visible: false,
                  onTap: () {
                    NavigatorService.to.pushNamed(
                      ProjectDetailsPage.routeName,
                      arguments: CrowdfundingDetailModel(
                        cubit: CrowdfundingCubit.to,
                        cardModel: state.charity[index],
                      ),
                    );
                  },
                  onTapLike: () async {
                    await homeCubit.changeLike(state.charity[index].id!);
                    homeCubit.getModel();
                    homeCubit.charityChangeLike(
                      index,
                      state.charity[index].isFavourite!,
                    );
                  },
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
