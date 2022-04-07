import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/kraudfanding_detail_cubit/kraudfanding_detail_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/about_project_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/products_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/tabbar_widget.dart';
import 'package:najot/ui/widgets/app_bar_with_title.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/services/navigator_service.dart';
import '../../../../data/utils/app_color_utils.dart';

class ProjectDetailsPage extends StatefulWidget {
  ProjectDetailsPage({required this.cardModel});

  static const String routeName = "/projectDetailsPage";
  static int tabChange = 0;
  CardModel cardModel;

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage>
    with TickerProviderStateMixin {
  late TabController _controller;

  KraudfandingDetailCubit cubit = KraudfandingDetailCubit();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    _controller.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_controller.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        backgroundColor: AppColorUtils.BACKGROUND,
        appBar: AppBarWithTitle(
          title: LocaleKeys.about_project.tr(),
          onPress: () {
            NavigatorService.to.pop();
          },
        ),
        body: BlocBuilder<KraudfandingDetailCubit, KraudfandingDetailState>(
          builder: (context, state) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 18.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(11),
                        topLeft: Radius.circular(11),
                      ),
                    ),
                    child: TabBarWidget(
                      _controller,
                      LocaleKeys.about_project.tr(),
                      LocaleKeys.products.tr(),
                    ),
                  ),
                  Container(
                    child: [
                      AboutProjectWidget(cardModel: widget.cardModel),
                      ProductsWidget(cardModel: widget.cardModel,)
                    ][_controller.index],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
