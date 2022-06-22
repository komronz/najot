import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/charity_model.dart';
import 'package:najot/ui/widgets/app_bar_with_title.dart';

import '../../../../../data/services/navigator_service.dart';
import '../../../../../data/utils/app_color_utils.dart';
import '../../../../data/bloc/my_project_charity_cubit/my_project_charity_cubit.dart';
import 'about_my_charity_project_widget.dart';

class MyCharityProjectFullPage extends StatefulWidget {
  const MyCharityProjectFullPage({Key? key, required this.cardModel})
      : super(key: key);

  static const String routeName = "/myCharityProjectFullPage";
  static int tabChange = 0;
  final CharityModel cardModel;

  @override
  State<MyCharityProjectFullPage> createState() =>
      _MyCharityProjectFullPageState();
}

class _MyCharityProjectFullPageState extends State<MyCharityProjectFullPage>
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
        backgroundColor: AppColorUtils.background,
        appBar: AppBarWithTitle(
          title: LocaleKeys.about_project.tr(),
          onPress: () {
            NavigatorService.to.pop();
          },
        ),
        body: BlocBuilder<MyProjectCharityCubit, MyProjectCharityState>(
          builder: (context, state) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                child: [
                  AboutMyCharityProjectWidget(model: widget.cardModel),
                ][_controller.index],
              ),
            );
          },
        ),
      ),
    );
  }
}
