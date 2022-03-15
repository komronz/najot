import 'package:flutter/material.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/widgets/app_bar_with_title.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorUtils.BACKGROUND,
      appBar: AppBarWithTitle(onPress: (){},title: "FAQ",),
      body: Container(

      ),
    );
  }
}
