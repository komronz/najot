import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/charity_model.dart';
import 'package:najot/ui/widgets/app_bar_with_title.dart';

import '../../../../../data/services/navigator_service.dart';
import '../../../../../data/utils/app_color_utils.dart';
import '../../../../data/bloc/my_project_charity_cubit/my_project_charity_cubit.dart';
import 'about_my_charity_item_project_widget.dart';

class MyCharityItemFullPage extends StatefulWidget {
  MyCharityItemFullPage({required this.cardModel});

  static const String routeName = "/myCharityItemFullPage";
  static int tabChange = 0;
  CharityModel cardModel;

  @override
  State<MyCharityItemFullPage> createState() => _MyCharityItemFullPageState();
}

class _MyCharityItemFullPageState extends State<MyCharityItemFullPage>
    with TickerProviderStateMixin {
  late TabController _controller;

  MyProjectCharityCubit cubit = MyProjectCharityCubit();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = TabController(length: 1, vsync: this);
    _controller.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
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
          title: LocaleKeys.about_the_ad,
          onPress: () {
            NavigatorService.to.pop();
          },
        ),
        body: BlocBuilder<MyProjectCharityCubit, MyProjectCharityState>(
          builder: (context, state) {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                child: [
                  AboutMyCharityItemProjectWidget(model: widget.cardModel),
                ][_controller.index],
              ),
            );
          },
        ),
      ),
    );
  }
}
