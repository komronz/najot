import 'package:flutter/material.dart';
import 'package:najot/data/model/charity_model.dart';
import 'package:najot/data/services/navigator_service.dart';

import '../charity_history_page/widgets/charity_list_widget.dart';
import 'my_charity_project_full_page.dart';
import 'my_charity_project_widget/charity_cash_widget.dart';
import 'my_charity_project_widget/charity_item_project_widget.dart';

class MyCharityProjectTypeOfPage extends StatelessWidget {
  final CharityModel charityModel;

  const MyCharityProjectTypeOfPage({required this.charityModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: charityModel.typeOfCharity=="item"
          ?CharityCashWidget(model: charityModel,onTap: () {
           NavigatorService.to.pushNamed(MyCharityProjectFullPage.routeName, arguments: charityModel);
        },
        )
          :CharityItemProjectWidget(model:charityModel, onTap: () {  },)
    );
  }
}
