import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/volunteer_bloc/volunteer_cubit.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/volunteer_page/volunteer_detail_page/volunteer_detail_page.dart';
import 'package:najot/ui/pages/volunteer_page/widgets/banner_card_widget.dart';
import 'package:najot/ui/pages/volunteer_page/widgets/new_volunteer_card.dart';
import 'package:najot/ui/widgets/app_bar_with_title.dart';
import 'package:najot/ui/widgets/app_search_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';

import '../../../data/bloc/home_cubit/home_cubit.dart';
import '../../widgets/app_error_widget.dart';
import '../crowdfunding_page_main/crowdfunding_widget/search_not _found.dart';

class VolunteerPage extends StatelessWidget {
  VolunteerPage();

  static const String routeName = '/volunteer';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        HomeCubit.to.getModel();
        return true;
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBarWithTitle(
            title: LocaleKeys.volunteering,
            onPress: () {
              HomeCubit.to.getModel();
              NavigatorService.to.pop();
            },
          ),
          backgroundColor: AppColorUtils.BACKGROUND,
          body: BlocBuilder<VolunteerCubit, VolunteerState>(
              bloc: VolunteerCubit.to..load(),
              builder: (context, state) {
                if (state.internetConnection) {
                  if (state.loading == false) {
                    return SafeArea(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppSearchWidget(
                              onChange: (v) {
                                VolunteerCubit.to.searchChange(v);
                              },
                              search: () {},
                            ).paddingSymmetric(horizontal: 20.w),
                            state.searchProgress
                                ? Center(
                                    child:
                                        CircularProgressIndicator().paddingOnly(
                                      top: 220.w,
                                    ),
                                  )
                                : state.searchChange == ""
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          BannerCard().paddingSymmetric(
                                            horizontal: 10.w,
                                            vertical: 20.w,
                                          ),
                                          AppWidgets.textLocale(
                                                  text: LocaleKeys.new_add,
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColorUtils.DARK2,)
                                              .paddingOnly(
                                                  left: 15.w, bottom: 7.w),
                                          SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            physics: BouncingScrollPhysics(),
                                            child: Row(
                                              children: List.generate(
                                                state.list.length,
                                                (index) => Container(
                                                  margin: EdgeInsets.only(
                                                      left: 10.w),
                                                  child: NewVolunteerCard(
                                                    onTap: () {
                                                      NavigatorService.to
                                                          .pushNamed(
                                                        VolunteerDetailPage
                                                            .routeName,
                                                        arguments:
                                                            VolunteerDetailModel(
                                                          cubit:
                                                              VolunteerCubit.to,
                                                          cardModel:
                                                              state.list[index],
                                                        ),
                                                      );
                                                    },
                                                    cardModel:
                                                        state.list[index],
                                                    cubit: VolunteerCubit.to,
                                                    changeLike: () {
                                                      VolunteerCubit.to
                                                          .changeLike(state
                                                              .list[index].id!);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          AppWidgets.textLocale(
                                                  text: LocaleKeys.all,
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColorUtils.DARK2)
                                              .paddingOnly(
                                            left: 15.w,
                                            top: 15.w,
                                          ),
                                          GridView.count(
                                            shrinkWrap: true,
                                            physics: ClampingScrollPhysics(),
                                            childAspectRatio: 0.68,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 15,
                                              vertical: 5,
                                            ),
                                            crossAxisSpacing: 8,
                                            mainAxisSpacing: 6,
                                            crossAxisCount: 2,
                                            children: List.generate(
                                              state.list.length,
                                              (index) => NewVolunteerCard(
                                                changeLike: () {
                                                  VolunteerCubit.to.changeLike(
                                                      state.list[index].id!);
                                                },
                                                cubit: VolunteerCubit.to,
                                                onTap: () {
                                                  NavigatorService.to.pushNamed(
                                                    VolunteerDetailPage
                                                        .routeName,
                                                    arguments:
                                                        VolunteerDetailModel(
                                                      cubit: VolunteerCubit.to,
                                                      cardModel:
                                                          state.list[index],
                                                    ),
                                                  );
                                                },
                                                cardModel: state.list[index],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : state.searchProjects.isNotEmpty
                                        ? GridView.count(
                                            shrinkWrap: true,
                                            physics: ClampingScrollPhysics(),
                                            childAspectRatio: 0.68,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 15,
                                              vertical: 5,
                                            ),
                                            crossAxisSpacing: 8,
                                            mainAxisSpacing: 6,
                                            crossAxisCount: 2,
                                            children: List.generate(
                                              state.searchProjects.length,
                                              (index) => NewVolunteerCard(
                                                cubit: VolunteerCubit.to,
                                                onTap: () {
                                                  NavigatorService.to.pushNamed(
                                                    VolunteerDetailPage
                                                        .routeName,
                                                    arguments:
                                                        VolunteerDetailModel(
                                                      cubit: VolunteerCubit.to,
                                                      cardModel:
                                                          state.searchProjects[
                                                              index],
                                                    ),
                                                  );
                                                },
                                                changeLike: () {
                                                  VolunteerCubit.to.changeLike(
                                                      state.list[index].id!);
                                                },
                                                cardModel:
                                                    state.searchProjects[index],
                                              ),
                                            ),
                                          )
                                        : SearchNotFound()
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                } else {
                  return AppErrorWidget(onTap: () async {
                    AppWidgets.isLoading(true);
                    await VolunteerCubit.to.load();
                    AppWidgets.isLoading(false);
                  });
                }
              }),
        ),
      ),
    );
  }
}
