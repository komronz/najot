import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/reg_volunteer_bloc/reg_volunteer_bloc.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:super_rich_text/super_rich_text.dart';

import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';

class VolunteerSuccessWidget extends StatelessWidget {
  final RegVolunteerBloc bloc;

  const VolunteerSuccessWidget({
    required this.bloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric(
            vertical: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppWidgets.text(
                textAlign: TextAlign.center,
                text:
                "Arizangiz uchun rahmat! //Moderatorlar// tez orada siz bilan aloqaga chiqishadi.",
                richText: true,
                othersMarkers: [
                  MarkerText(
                    marker: "//",
                    style: TextStyle(color: AppColorUtils.KRAUDFANDING),
                  )
                ],
                maxLines: 10,
                height: 1.1,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColorUtils.DARK3,
              ).paddingSymmetric(horizontal: 54),
              AppWidgets.imageSvg(
                path: AppImageUtils.IC_EARPHONES,
                height: 54,
                width: 54,
                fit: BoxFit.none,
              ).paddingOnly(top: 20),
              AppWidgets.appButton(
                title: "Xo'p, rahmat",
                textColor: AppColorUtils.KRAUDFANDING,
                onTap: () {
                  bloc.add(VolunteerSendBtn());
                  Navigator.pop(context);
                },
                color: Color(0xFFECFFFA),
              ).paddingOnly(
                top: 26,
                left: 20,
                right: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}