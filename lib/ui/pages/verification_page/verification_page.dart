import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/app_page_cubit/app_page_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/pages/verification_page/widgets/pin_put_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({Key? key}) : super(key: key);
  static const String routeName = '/verificationPage';

  @override
  Widget build(BuildContext context) {
    final TextEditingController _pinPutController = TextEditingController();
    final FocusNode _pinPutFocusNode = FocusNode();

    return Scaffold(
      backgroundColor: AppColorUtils.BACKGROUND,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppWidgets.appBarWidget(
              onTap: () {
                NavigatorService.to.pop();
              },
              title: "Shaxsiy ma'lumotlar",
            ).paddingOnly(top: 58.h),
            Column(
              children: [
                AppWidgets.textLocale(
                  text: "6 raqamli kodni kiriting",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                PinPutWidget(
                  pinPutFocusNode: _pinPutFocusNode,
                  pinPutController: _pinPutController,
                ).paddingOnly(top: 20),
                TextButton(
                  onPressed: () {},
                  child: AppWidgets.textLocale(
                      text: "Qayta yuborish",
                      color: AppColorUtils.TEXT_BLUE,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      textAlign: TextAlign.center),
                ),
                AppWidgets.appButton(
                    title: "Ro'yhatdan o'tish",
                    onTap: () {
                      NavigatorService.to.pushNamed(
                        HomePage.routeName,
                        arguments: AppPageType.MAIN,
                      );
                    }).paddingOnly(top: 100.h),
                AppWidgets.appButton(
                  title: "Boshqa raqam kiritish",
                  onTap: () {},
                  color: Colors.transparent,
                  textColor: AppColorUtils.TEXT_GREEN,
                ).paddingOnly(top: 10.h),
              ],
            ).paddingOnly(top: 100.h)
          ],
        ),
      ),
    );
  }
}
