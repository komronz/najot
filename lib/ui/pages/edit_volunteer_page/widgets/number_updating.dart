import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/bloc/edit_volunteer_bloc/edit_volunteer_bloc.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class NumberUpdating extends StatelessWidget {
  const NumberUpdating({Key? key, required this.state, required this.con})
      : super(key: key);

  final EditVolunteerState state;
  final BuildContext con;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColorUtils.white,
            border: Border.all(
              color: AppColorUtils.green6,
              width: 2,
            ),
          ),
          child: !state.nextPage
              ? AppWidgets.textLocale(
                  text: "1 2 3 4 5 6",
                  textAlign: TextAlign.center,
                  color: AppColorUtils.gray4,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                )
              : SizedBox(
                  width: 150,
                  child: Row(
                    children: [
                      AppWidgets.textLocale(
                              text: "1 2 3 4 5 6",
                              textAlign: TextAlign.center,
                              color: AppColorUtils.green2,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600)
                          .paddingOnly(right: 10),
                      SvgPicture.asset(AppImageUtils.check),
                    ],
                  ),
                ),
        ),
        SizedBox(height: 16.w),
        ButtonCard(
          textSize: 16.sp,
          fontWeight: FontWeight.w600,
          textColor: AppColorUtils.white,
          borderRadius: 12,
          height: 48.w,
          width: 1.sw,
          color: AppColorUtils.percentColor,
          onPress: () {
            con.read<EditVolunteerBloc>().add(const EditProfileChangePage(1));
            con.read<EditVolunteerBloc>().add(const MyProfileLoad());
          },
          text: LocaleKeys.confirmation.tr(),
        ).paddingOnly(bottom: 18.w),
        state.nextPage
            ? const SizedBox()
            : InkWell(
                onTap: () {
                  // NavigatorService.to
                  //     .pushNamed(NumberUpdateVolunteerPage.routeName);
                },
                child: Container(
                  child: AppWidgets.textLocale(
                    text: LocaleKeys.send_again.tr(),
                    color: AppColorUtils.blUe2,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ).paddingOnly(left: 120.w),
              ),
      ],
    );
  }
}
