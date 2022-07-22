import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/bloc/charity_page_cubit/charity_cubit.dart';
import '../../../../data/bloc/crowdFounding_cubit/kraud_fanding_cubit.dart';
import '../../../../data/bloc/favorite-add_cubit/favorite_add_cubit.dart';
import '../../../../data/bloc/volunteer_bloc/volunteer_cubit.dart';
import '../../../../data/services/navigator_service.dart';
import '../../charity_page/charity_full_page/charity_full_page.dart';
import '../../charity_page/charity_full_page/charity_full_page2.dart';
import '../../charity_page/widgets/charity_item2_widget.dart';
import '../../charity_page/widgets/charity_item_widget.dart';
import '../../crowdfunding_page_main/crowdfunding_widget/crowdfunding_mini_card_widget.dart';
import '../../volunteer_page/volunteer_detail_page/volunteer_detail_page.dart';
import '../../volunteer_page/widgets/new_volunteer_card.dart';

class CrowdfundingSavedListWidget extends StatelessWidget {
  final FavoriteAddCubit cubit;

  const CrowdfundingSavedListWidget({
    required this.cubit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (cubit.state.list.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppWidgets.imageSvg(
            path: AppImageUtils.BIG_HEART,
            height: 70.w,
            width: 70.w,
            fit: BoxFit.none,
          ).paddingOnly(top: 80.w),
          AppWidgets.textLocale(
            text: LocaleKeys.nothing_found_yet,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColorUtils.GRAY_4,
          ).paddingOnly(top: 20),
        ],
      );
    }
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      physics: ClampingScrollPhysics(),
      childAspectRatio: 160 / 267,
      padding: EdgeInsets.all(0),
      reverse: false,
      crossAxisSpacing: 8,
      mainAxisSpacing: 6,
      children: List.generate(
        cubit.state.list.length,
        (index) {
          if(cubit.state.list[index].type=="CF"){
            return CrowdfundingMiniCardWidget(
              cubit: CrowdfundingCubit.to,
              visible: true,
              cardModel: cubit.state.list[index],
            );
          }
          if(cubit.state.list[index].type=="VL"){
           return NewVolunteerCard(
              cubit: VolunteerCubit.to,
              onTap: () {
                NavigatorService.to.pushNamed(
                  VolunteerDetailPage.routeName,
                  arguments: VolunteerDetailModel(
                    cubit: VolunteerCubit.to,
                    cardModel: cubit.state.list[index],
                  ),
                );
              },
              cardModel: cubit.state.list[index],
            );
          }
          if(cubit.state.list[index].type=="CH"){
            if (cubit.state.list[index]
                .requiredFund !=
                null) {
              return CharityItemWidget(
                onTap: () {
                  NavigatorService.to
                      .pushNamed(
                      CharityFullPage
                          .routName,
                      arguments:cubit.state.list[index]
                  );
                },
                model:cubit.state.list[index],
                onTapLike: () {
                  CharityCubit.to
                      .changeLike(
                      cubit.state.list[index]
                          .id!);
                },
              );
            } else {
              return CharityItem2Widget(
                model: cubit.state.list[index],
                onTap: () {
                  NavigatorService.to
                      .pushNamed(
                      CharityFullPage2
                          .routName,
                      arguments: cubit.state.list[index]
                  );
                },
                onTapLike: () {
                  CharityCubit.to
                      .changeLike(
                      cubit.state.list[index]
                          .id!);
                },
              );
            }
          }else{
            return Container();
          }



        }
      ),
    );
  }
}
