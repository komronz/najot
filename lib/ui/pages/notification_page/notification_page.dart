import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot/data/bloc/notification_cubit/notification_cubit.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/ui/pages/notification_page/widget/my_note_widget.dart';
import 'package:najot/ui/widgets/app_bar_with_title.dart';

class NotificationPage extends StatelessWidget {
  static const String routeName = "/notificationPage";
  NotificationPage({Key? key}) : super(key: key);

  NotificationCubit cubit=NotificationCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit..getList(),
      child: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) => Scaffold(
          appBar: AppBarWithTitle(
            title: LocaleKeys.note.tr(),
            onPress: () {
              NavigatorService.to.pop();
            },
          ),
          body: _buildBody(state, context),
        ),
      ),
    );
  }

  Widget _buildBody(NotificationState state, BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return MyNoteWidget(
          model: state.cardList[index],
          index: index,
          cubit: cubit,
        );
      },
      itemCount: state.cardList.length,
    );
  }
}
