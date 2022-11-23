import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../data/localization/locale_keys.g.dart';
import '../../data/utils/app_color_utils.dart';
import '../../data/utils/app_image_utils.dart';
import '../pages/main_page/widgets/button_card_widget.dart';
import 'app_widgets.dart';

class AppErrorWidget extends StatelessWidget {
  final VoidCallback onTap;

  AppErrorWidget({required this.onTap});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        // AppWidgets.errorAppBarWidget(
        //     appNavigationType:
        //         RootService.appBloc.navigationBloc.state.appNavigationType),
        Expanded(
          child: Container(
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              color: AppColorUtils.WHITE,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  spreadRadius: 10,
                  blurRadius: 5,
                  offset: Offset(0, 7), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(AppImageUtils.NETWORK_ERROR),
                SizedBox(height: 24.h),
                AppWidgets.textLocale(
                  text: LocaleKeys.disConnection,
                  color: AppColorUtils.DARK3,
                  fontSize: 18.sp,
                ),
                SizedBox(
                  height: 12.h,
                ),
                SizedBox(height: 24.h),
                ButtonCard(
                  width: double.infinity,
                  height: 50,
                  color: AppColorUtils.RED,
                  onPress: onTap,
                  text: LocaleKeys.try_again,
                  textColor: Colors.white,
                  borderRadius: 10,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
