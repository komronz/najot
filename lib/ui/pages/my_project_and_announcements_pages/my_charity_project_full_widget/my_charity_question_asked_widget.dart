import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/bloc/my_charity_support_list_cubit/my_charity_support_list_cubit.dart';
import '../../../../data/model/charity_model.dart';
import 'my_charity_question_list.dart';

class MyCharityQuestionsAskedWidget extends StatefulWidget {
  const MyCharityQuestionsAskedWidget({
    required this.cardModel,
    required this.cubit,
    Key? key,
  }) : super(key: key);

  final CharityModel cardModel;
  final MyCharitySupportListCubit cubit;
  @override
  _MyCharityQuestionsAskedWidgetState createState() =>
      _MyCharityQuestionsAskedWidgetState();
}

class _MyCharityQuestionsAskedWidgetState
    extends State<MyCharityQuestionsAskedWidget> {
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
                  text: "Javob berilganlar",
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
                (index) => MyCharityQuestionList(
              cardModel: widget.cubit.state.cardList[index],
            ),
          ),
        ),
      ],
    );
  }
}
