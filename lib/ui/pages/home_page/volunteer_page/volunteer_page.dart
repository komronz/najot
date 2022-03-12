import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/bloc/volunteer_bloc/volunteer_cubit.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class VolunteerPage extends StatelessWidget {
  VolunteerPage({Key? key}) : super(key: key);
  VolunteerCubit volunteerCubit = VolunteerCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => volunteerCubit,
      child: Scaffold(body: BlocBuilder<VolunteerCubit, VolunteerState>(
        builder: (context, state) {
          return SafeArea(
            child: Container(
                height: 80,
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    AppWidgets.appBarWidget(
                      title: "Volontyorlik",
                      onTap: () {},
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
