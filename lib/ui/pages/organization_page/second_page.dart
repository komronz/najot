import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../data/bloc/crowdFounding_cubit/kraud_fanding_cubit.dart';
import '../../../data/localization/locale_keys.g.dart';
import '../../../data/services/navigator_service.dart';
import '../../../data/utils/app_color_utils.dart';
import '../../widgets/app_bar_with_title.dart';
import '../crowdfunding_page_main/project_details/widgets/about_project_widget.dart';
import '/data/model/project_model.dart';



class SecondPage extends StatelessWidget {
  final ProjectModel model;
  const SecondPage({Key? key, required this.model,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorUtils.BACKGROUND,
      appBar: AppBarWithTitle(
        title: LocaleKeys.about_the_ad.tr(),
        onPress: () {
          NavigatorService.to.pop();
        },
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: AboutProjectWidget(cardModel: model, cubit: CrowdfundingCubit(),),
      ),
    );
  }
}
