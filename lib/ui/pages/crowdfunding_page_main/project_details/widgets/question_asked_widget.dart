import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/bloc/project_data_cubit/project_data_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class QuestionsAnswerWidget extends StatelessWidget {
  const QuestionsAnswerWidget({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final ProjectDataCubit cubit;

  @override
  Widget build(BuildContext context) {

    return cubit.state.questionsData.isNotEmpty
        ? Column(
      children: List.generate(
          cubit.state.questionsData.length,
              (index) => Container(
            padding: EdgeInsets.only(
              top: 12.w,
              left: 12.w,
              right: 12.w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              // border: Border.all(color: AppColorUtils.GREY,width: 1),
              color: AppColorUtils.GREEN_ACCENT4,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50.w,
                      width: 50.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black12
                      ),
                      child: CachedNetworkImage(
                        imageUrl: cubit.state.questionsData[index].user!.photo!,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                            Icon(Icons.person),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: AppWidgets.text(
                            text: cubit.state.questionsData[index].title??"",
                            color: AppColorUtils.TEXT_GREEN2,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                            maxLines: 2,
                          ),
                          width: 220.w,
                        ),
                        AppWidgets.textLocale(
                          text: "${cubit.state.questionsData[index].user!.firstName!} ${cubit.state.questionsData[index].user!.lastName!}",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColorUtils.DARK_6,
                        ).paddingOnly(top: 2.w),
                      ],
                    ).paddingOnly(left: 10),
                  ],
                ),
                AppWidgets.text(
                  text: cubit.state.questionsData[index].content??"",
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: AppColorUtils.TEXT_GREY2,
                  maxLines: 100,
                  height: 1.5,
                ).paddingSymmetric(vertical: 15.w),
                Divider(
                  thickness: 1,
                  color: AppColorUtils.BLACK_12,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    cubit.state.questionsData[index].answers!.length,
                        (inde) =>
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppWidgets.textLocale(
                            text: LocaleKeys.author_answer,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColorUtils.TEXT_GREEN2,
                          ).paddingSymmetric(vertical: 8.w),
                          AppWidgets.text(
                            text: cubit.state.questionsData[index].answers![inde].content??"",
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: AppColorUtils.TEXT_GREY2,
                            maxLines: 100,
                            height: 1.5,
                          ),
                        ],
                      ),
                  ),
                ),

              ],
            ),
          ).paddingOnly(bottom: 5)),
    )
        : Container(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 30.w,),
                  SvgPicture.asset(AppImageUtils.EMPTY_QUESTIONS),
                  SizedBox(
                    width: 200.sp,
                    child: AppWidgets.textLocale(
                      textAlign: TextAlign.center,
                      text: LocaleKeys.questions_empty,
                      color: AppColorUtils.DARK_4,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      maxLines: 2,
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
