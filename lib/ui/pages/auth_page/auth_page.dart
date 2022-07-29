import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/login_page/login_page.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:najot/data/extensions/context_extension.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);
  static const String routeName = 'authPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPathWidget(height: context.height*0.5,),
                Align(
                  alignment: Alignment.center,
                  child: AppWidgets.imageSvg(path: AppImageUtils.LOGO_WORD_BIG)
                      .paddingOnly(top: 120.w),
                ),
              ],
            ),
            AppWidgets.appButton(
              title: LocaleKeys.log_in,
              onTap: () {
                NavigatorService.to.pushNamed(LoginPage.routeName);

              },
            ).paddingSymmetric(horizontal: 20),

          ],
        ),
      ),
    );
  }
}
