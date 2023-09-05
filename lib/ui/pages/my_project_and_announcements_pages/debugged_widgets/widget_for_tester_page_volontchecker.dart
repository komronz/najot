import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/model/project_model.dart';
import 'volunteering_author.dart';

class WidgetForTesterPageVolontChecker extends StatelessWidget {
  final bool hasVolont;
  final bool isCharityTap;
  final ProjectModel projectModel;

  const WidgetForTesterPageVolontChecker(
      {Key? key,
      required this.hasVolont,
      required this.isCharityTap,
      required this.projectModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isCharityTap
      ? Container()
      : hasVolont
          ? Column(
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: const Divider(thickness: 1),
                ),
                AuthorWidget(
                  projectModel: projectModel,
                )
              ],
            )
          : Container();
  }
}
