import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/volunteer_bloc/volunteer_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/home_page/volunteer_page/banner_card_widget.dart';
import 'package:najot/ui/pages/home_page/volunteer_page/new_volunteer_card.dart';
import 'package:najot/ui/widgets/app_search_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class VolunteerPage extends StatelessWidget {
  VolunteerPage({Key? key}) : super(key: key);
  VolunteerCubit volunteerCubit = VolunteerCubit();
  static const String routeName = '/volunteer';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => volunteerCubit,
      child: Scaffold(
        backgroundColor: AppColorUtils.BACKGROUND,
        body: BlocBuilder<VolunteerCubit, VolunteerState>(
          builder: (context, state) {
            var list = context.read<VolunteerCubit>().state.list;
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      padding: EdgeInsets.only(top: 20),
                      child: AppWidgets.appBarWidget(
                        title: "Volontyorlik",
                        onTap: () {},
                      ),
                    ),
                    AppSearchWidget(
                      onChange: (v) {},
                      search: () {},
                    ).paddingSymmetric(horizontal: 20.w),
                    BannerCard().paddingSymmetric(
                      horizontal: 10.w,
                      vertical: 20.w,
                    ),
                    AppWidgets.textLocale(
                            text: "Yango qo'shilganlar",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColorUtils.DARK2)
                        .paddingOnly(left: 15.w, bottom: 7.w),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          list.length,
                          (index) => Container(
                            margin: EdgeInsets.only(left: 10.w),
                            child: NewVolunteerCard(
                              sliderModel: list[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                    AppWidgets.textLocale(
                            text: "Barchasi",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColorUtils.DARK2)
                        .paddingOnly(
                      left: 15.w,
                      bottom: 7.w,
                      top: 15.w,
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      childAspectRatio: 0.68,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 6,
                      crossAxisCount: 2,
                      children: List.generate(
                        list.length,
                        (index) => NewVolunteerCard(
                          sliderModel: list[index],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
