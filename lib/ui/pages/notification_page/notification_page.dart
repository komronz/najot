import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot/data/bloc/notification_cubit/notification_cubit.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/ui/pages/notification_page/widget/my_note_widget.dart';
import 'package:najot/ui/widgets/app_bar_with_title.dart';

import '../../../data/services/navigator_service.dart';

class NotificationPage extends StatelessWidget {
  static const String routeName="/notificationPage";

  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NotificationCubit(),
      child: BlocBuilder<NotificationCubit,NotificationState>(
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
  Widget _buildBody(NotificationState state,BuildContext context) {
      return ListView.builder(
        shrinkWrap: true,
        reverse: true,
      itemBuilder: (context, index) {
        if (index == state.cardList.length -1) {
          return MyNoteWidget(
            model: state.cardList[index],
            isLast: true,

          );
        }
        return MyNoteWidget(
          model: state.cardList[index],
        );
      },
      itemCount: state.cardList.length,
    );
  }
}
