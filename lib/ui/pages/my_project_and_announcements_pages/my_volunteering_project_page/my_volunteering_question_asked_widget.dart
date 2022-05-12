import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/volunteering_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/bloc/my_volunteering_project_cubit/my_volunteering_project_cubit.dart';
import 'my_volunteering_question_list.dart';

class MyVolunteeringQuestionsAskedWidget extends StatefulWidget {
  const MyVolunteeringQuestionsAskedWidget({
    required this.cardModel,
    required this.cubit,
    Key? key,
  }) : super(key: key);
  final MyVolunteeringProjectCubit cubit;
  final VolunteeringModel cardModel;

  @override
  _MyVolunteeringQuestionsAskedWidgetState createState() =>
      _MyVolunteeringQuestionsAskedWidgetState();
}

class _MyVolunteeringQuestionsAskedWidgetState
    extends State<MyVolunteeringQuestionsAskedWidget> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            widget.cubit.widgetChange(true);
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColorUtils.GREEN_ACCENT8,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppWidgets.textLocale(
                  text: LocaleKeys.answered,
                  color: AppColorUtils.GREEN_TEXT_1,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ).paddingOnly(
                  left: 10.w,
                  top: 7.w,
                  bottom: 10.w,
                  right: 15.w,
                ),
                AppWidgets.imageSvg(
                  path: AppImageUtils.RIGHT_DIRECTION,
                  color: AppColorUtils.GREEN_TEXT_1,
                  height: 15.w,
                ).paddingOnly(right: 15.w),
              ],
            ),
          ).paddingSymmetric(vertical: 18.w),
        ),
        Column(
          children: List.generate(
            widget.cubit.state.cardList.length,
            (index) => MyVolunteeringQuestionList(
              cardModel: widget.cubit.state.cardList[index],
            ),
          ),
        ),
      ],
    );
  }
}
