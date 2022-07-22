import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/bloc/favorite-add_cubit/favorite_add_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/pages/saved_page/widgets/crowdfunding_list_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import '../../../data/bloc/charity_page_cubit/charity_cubit.dart';
import '../../../data/bloc/crowdFounding_cubit/kraud_fanding_cubit.dart';
import '../../../data/bloc/volunteer_bloc/volunteer_cubit.dart';
import '../../../data/localization/locale_keys.g.dart';
import '../../../data/services/navigator_service.dart';
import '../../../data/utils/app_image_utils.dart';
import '../charity_page/charity_full_page/charity_full_page.dart';
import '../charity_page/charity_full_page/charity_full_page2.dart';
import '../charity_page/widgets/charity_item2_widget.dart';
import '../charity_page/widgets/charity_item_widget.dart';
import '../crowdfunding_page_main/crowdfunding_widget/crowdfunding_mini_card_widget.dart';
import '../notification_page/notification_page.dart';
import '../volunteer_page/volunteer_detail_page/volunteer_detail_page.dart';
import '../volunteer_page/widgets/new_volunteer_card.dart';

class SavedPage extends StatelessWidget {
   SavedPage({Key? key}) : super(key: key);
  FavoriteAddCubit cubit= FavoriteAddCubit();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (context)=>cubit,
        child: BlocBuilder<FavoriteAddCubit,FavoriteAddState>(
          bloc: cubit..getFavoriteAddList(),
          builder: (context, state) => Scaffold(
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
                    text: LocaleKeys.saved,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  InkWell(
                    onTap: (){
                      cubit.getFavoriteAddList();
                      // NavigatorService.to.pushNamed(NotificationPage.routeName,);
                    },
                    child: SvgPicture.asset(
                      AppImageUtils.NOTIFICATION,
                      height: 35.w,
                      width: 35.w,
                      fit: BoxFit.fill,
                    ),
                  )

                ],
              ).paddingAll(20),
            ),
            body: _buildBody(cubit),
          ),),

    );
  }
  Widget _buildBody(FavoriteAddCubit cubit) {
    if (cubit.state.hasLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
        child: GridView.count(
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
                        cubit.getFavoriteAddList();
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
                        cubit.getFavoriteAddList();
                      },
                    );
                  }
                }else{
                  return Container();
                }
              }
          ),
        )
    ).paddingAll(15);
  }
}
