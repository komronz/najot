import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/login_bloc/login_bloc.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/login_page/login_page.dart';
import 'package:najot/ui/pages/reg_page/reg_page.dart';
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
                // Positioned(
                //   top: 50.h,
                //   left: 50.w,
                //   right: 50.w,
                //   child: Column(
                //     children: [
                //       Container(
                //         height: 125,
                //         width: 150,
                //         color: Colors.grey,
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
            AppWidgets.appButton(
              title: LocaleKeys.str_registration,
              onTap: () {
                // NavigatorService.to.pushNamed(RegPage.routeName);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider(
                      create: (context) => LoginBloc(),
                      child: RegPage(),
                    ),
                  ),
                );
              },
            ).paddingSymmetric(horizontal: 20),
            AppWidgets.appButton(
              title: LocaleKeys.log_in,
              onTap: () {
                NavigatorService.to.pushNamed(LoginPage.routeName);
              },
              color: Colors.transparent,
              textColor: AppColorUtils.TEXT_GREEN,
            ).paddingSymmetric(
              vertical: 10.h,
              horizontal: 20,
            ),
          ],
        ),
      ),
    );
  }
}
