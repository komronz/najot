import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:najot/ui/pages/intro_page/project_information_page/open_alert_box_widget.dart';

class AskingQuestionCommon extends StatefulWidget {
  const AskingQuestionCommon({Key? key}) : super(key: key);

  @override
  _AskingQuestionCommonState createState() => _AskingQuestionCommonState();
}

class _AskingQuestionCommonState extends State<AskingQuestionCommon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            openAlertBox(context);
          },
          child: Text("Common"),
        ),
      ),
    );
  }
}
