import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot/data/bloc/notification_cubit/notification_cubit.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/ui/pages/notification_page/widget/attension_note.dart';
import 'package:najot/ui/pages/notification_page/widget/my_note_widget.dart';
import 'package:najot/ui/pages/notification_page/widget/notification_api.dart';
import 'package:najot/ui/widgets/app_bar_with_title.dart';

import '../../../data/model/volunteering_model.dart';
import '../../../data/services/navigator_service.dart';

class NotificationPage extends StatefulWidget {
  static const String routeName = "/notificationPage";

  NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    // TODO: implement initState
    NotificationApi.init(initScheduled: true);
    listenNotifications();
    super.initState();

  }
  void listenNotifications() =>
      NotificationApi.onNotification.stream.listen(onClickNotification);

  void onClickNotification(String? payload) {
    // NavigatorService.to.pushNamed(AttentionNote.routeName, arguments: payload != null ? VolunteeringModel.fromJson(jsonDecode(payload)) : null,);

    showDialog(
      context: context,
      builder: (context) {
        return AttentionNote(
          model: VolunteeringModel.fromJson(
            jsonDecode(payload!),
          ),
        );
      },
    );
  }
  bool isRead=true;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit(),
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
      reverse: true,
      itemBuilder: (context, index) {
        if (index == state.cardList.length -1) {
          return MyNoteWidget(
            model: state.cardList[index],
            isLast: isRead,
            onTap: (){
              setState(() {
                isRead=false;
              });
              NotificationApi.showNotification(
                  title:LocaleKeys.attention_hello_volunteer.tr(),
                  body: LocaleKeys.you_go_to_help.tr(),
                  payload: jsonEncode(state.cardList[index].toJson()),
                  // scheduledDate: DateTime.now().add(Duration(seconds: 10))
              );
            },
          );
        }
        return MyNoteWidget(
          model: state.cardList[index],
          onTap: () {
            NotificationApi.showNotification(
              title:LocaleKeys.attention_hello_volunteer.tr(),
              body: LocaleKeys.you_go_to_help.tr(),
              payload: jsonEncode(state.cardList[index].toJson()),
              // scheduledDate: DateTime.now().add(Duration(seconds: 10)),
            );
          },
        );
      },
      itemCount: state.cardList.length,
    );
  }
}
