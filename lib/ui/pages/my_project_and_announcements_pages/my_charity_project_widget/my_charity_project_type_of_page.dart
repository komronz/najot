import 'package:flutter/material.dart';
import 'package:najot/data/model/charity_model.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';

import '../my_charity_item_project_full_widget/my_charity_item_full_page.dart';
import '../my_charity_project_full_widget/my_charity_project_full_page.dart';
import 'charity_cash_widget.dart';
import 'charity_item_project_widget.dart';

class MyCharityProjectTypeOfPage extends StatelessWidget {
  final CharityModel charityModel;

  const MyCharityProjectTypeOfPage({required this.charityModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorUtils.WHITE,
      body: charityModel.typeOfCharity == "cash"
          ? CharityCashWidget(
              model: charityModel,
              onTap: () {
                NavigatorService.to.pushNamed(
                    MyCharityProjectFullPage.routeName,
                    arguments: charityModel);
              },
            )
          : CharityItemProjectWidget(
              model: charityModel,
              onTap: () {
                NavigatorService.to.pushNamed(MyCharityItemFullPage.routeName,
                    arguments: charityModel);
              },
            ),
    );
  }
}
