

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/ui/pages/main_page/widgets/volunteer_card_widget.dart';

import '../../../../data/bloc/home_cubit/home_cubit.dart';
import '../../../../data/bloc/volunteer_bloc/volunteer_cubit.dart';
import '../../../../data/services/navigator_service.dart';
import '../../volunteer_page/volunteer_detail_page/volunteer_detail_page.dart';

class VolunteerListMain extends StatelessWidget {
  VolunteerListMain({required this.homeCubit, required this.state});

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
            state.volunteer.length,
                (index) => Container(
              margin: EdgeInsets.only(left: 10.w),
              child: VolunteerCardWidget(
                onTap: () {
                  NavigatorService.to.pushNamed(
                    VolunteerDetailPage.routeName,
                    arguments: VolunteerDetailModel(
                      cubit: VolunteerCubit.to,
                      cardModel: state.volunteer[index],
                    ),
                  );
                },
                projectModel: state.volunteer[index],
                onTapLike: () {
                  homeCubit.changeLike(state.volunteer[index].id!);
                  homeCubit.volunteerChangeLike(
                    index,
                    state.volunteer[index].isFavourite!,
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