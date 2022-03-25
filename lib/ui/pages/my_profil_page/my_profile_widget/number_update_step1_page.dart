import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profil_update_bloc.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profil_update_state.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_pages/number_update_page.dart';
import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/services/navigator_service.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_widgets.dart';

class NumberUpdateStep1 extends StatelessWidget {
  static const String routeName = "/numberUpdateStep1Page";

  const NumberUpdateStep1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyProfileUpdateBloc, MyProfileUpdateState>(
      builder: (context, state) {
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xFFFDFFFF),
                  border: Border.all(
                    color: Color(0xFF97C2BA),
                    width: 2,
                  ),
                ),
                child: !state.nextPage
                    ? AppWidgets.textLocale(
                        text: "1 2 3 4 5 6",
                        textAlign: TextAlign.center,
                        color: Color(0xFFBCBEC0),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      )
                    : Container(
                        width: 150,
                        child: Row(
                          children: [
                            AppWidgets.textLocale(
                                    text: "1 2 3 4 5 6",
                                    textAlign: TextAlign.center,
                                    color: Color(0xFF0BA42D),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600)
                                .paddingOnly(right: 10),
                            SvgPicture.asset(AppImageUtils.CHECK),
                          ],
                        ),
                      ),
              ),
              SizedBox(height: 16.h),
              InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 10, bottom: 13),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xFF0BBF90),
                  ),
                  child: AppWidgets.textLocale(
                    text: LocaleKeys.confirmation,
                    textAlign: TextAlign.center,
                    color: Color(0xFFFFFFFF),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ).paddingOnly(bottom: 18.h),
              state.nextPage
                  ? InkWell(
                      onTap: () {
                        NavigatorService.to
                            .pushNamed(NumberUpdatePage.routeName);
                      },
                      child: Container(
                        child: AppWidgets.textLocale(
                          text: LocaleKeys.send_again,
                          color: Color(0xFF0B58B2),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ).paddingOnly(left: 120.w),
                    )
                  : SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
