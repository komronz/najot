import 'package:flutter/material.dart';
import 'package:najot/data/model/project_model.dart';

import '../../../data/bloc/project_data_cubit/project_data_cubit.dart';
import '../crowdfunding_page_main/project_details/widgets/comment_to_author_dialog.dart';
import '../crowdfunding_page_main/project_details/widgets/crowdfunding_author_widget.dart';

class WidgetForTesterPageVolontChecker extends StatelessWidget {
  final bool hasVolont;
  final bool isCharityTap;
  final ProjectModel projectModel;
  const WidgetForTesterPageVolontChecker({Key? key,  required this.hasVolont, required this.isCharityTap, required this.projectModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isCharityTap
        ? Container() : hasVolont ?
    // CrowdfundingAuthorWidget(
    //   model: projectModel,
    //   onTap: () {
    //     showDialog(
    //       context: context,
    //       builder: (context) {
    //         return CommentToAuthorDialog(
    //           cubit: ProjectDataCubit(),
    //           projectModel: projectModel,
    //         );
    //       },
    //     );
    //   },
    // )
    Container()
        : Container();
  }
}
