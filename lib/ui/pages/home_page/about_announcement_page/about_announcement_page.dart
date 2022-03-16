import 'package:flutter/material.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class AboutAnnouncementPage extends StatelessWidget {
  const AboutAnnouncementPage({Key? key}) : super(key: key);
  static const String routeName = '/announcement';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppWidgets.appBarWidget(
            title: "E'lon haqida",
            onTap: () {},

          )
        ],
      ),
    );
  }
}
