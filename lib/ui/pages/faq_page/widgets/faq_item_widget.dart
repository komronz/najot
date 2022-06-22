import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/faq_cubit/faq_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/faq_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/data/utils/app_logger_util.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class FaqItemWidget extends StatelessWidget {
  final FaqModel faqModel;
  final int index;

  const FaqItemWidget({
    required this.faqModel,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 265.w,
                child: AppWidgets.text(
                  text: faqModel.title!,
                  maxLines: 10,
                  color: AppColorUtils.dark2,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                ),
              ),
              GestureDetector(
                child: Transform.rotate(
                  angle: faqModel.isOpen! ? 45 * pi / 180 : 0,
                  child: AppWidgets.imageSvg(path: AppImageUtils.icFaqOpen),
                ),
                onTap: () {
                  AppLoggerUtil.i("$index  ${faqModel.isOpen}");
                  context.read<FaqCubit>().openFaqItem(index, faqModel.isOpen!);
                },
              )
            ],
          ),
          AnimatedContainer(
            height: faqModel.isOpen! ? null : 0,
            duration: const Duration(milliseconds: 200),
            child: SizedBox(
              width: 280.w,
              child: AppWidgets.text(
                text: faqModel.text!,
                maxLines: 30,
                color: AppColorUtils.dark3,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ).paddingOnly(top: 20),
            ),
          )
        ],
      ).paddingOnly(
        top: 32.w,
        left: 20.w,
        right: 20.w,
      ),
    );
  }
}
