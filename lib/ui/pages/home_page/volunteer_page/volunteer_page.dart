


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class VolunteerPage extends StatelessWidget {
  const VolunteerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        height: 80,
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              child: SvgPicture.asset(AppImageUtils.MENU),
              onTap: () {

              },
            ),
            AppWidgets.textLocale(
              text: LocaleKeys.main,
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
            SizedBox()
          ],
        ),
      ),
    );

  }
}
