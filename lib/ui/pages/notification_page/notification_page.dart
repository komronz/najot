import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/notification_cubit/notification_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/notification_page/widget/my_note_widget.dart';
import 'package:najot/ui/widgets/app_bar_with_title.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class NotificationPage extends StatelessWidget {
  static const String routeName = "/notificationPage";
  NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      bloc: NotificationCubit.to..getList(),
      builder: (context, state) => Scaffold(
        appBar: AppBarWithTitle(
          title: LocaleKeys.note.tr(),
          onPress: () {
            NavigatorService.to.pop();
          },
        ),
        body: _buildBody(state, context),
      ),
    );
  }

  Widget _buildBody(NotificationState state, BuildContext context) {
    if(state.cardList.isEmpty){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppWidgets.imageAsset(
          path: AppImageUtils.NOTIFICATION_BIG,
        ).paddingOnly(top: 80.w),
        AppWidgets.textLocale(
          text: LocaleKeys.nothing_found_yet,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColorUtils.GRAY_4,
          textAlign: TextAlign.center,
          maxLines: 2,
        ).paddingOnly(
          top: 20,
          left: 50.w,
          right: 50.w,
        ),
      ],
    );
    }
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return MyNoteWidget(
          model: state.cardList[index],
          index: index,
          cubit: NotificationCubit.to,
        );
      },
      itemCount: state.cardList.length,
    );
  }
}
