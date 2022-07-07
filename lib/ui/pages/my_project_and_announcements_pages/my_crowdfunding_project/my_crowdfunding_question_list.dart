import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/project_model.dart';

import '../../../../data/bloc/my_crowdfunding_support_cubit/my_crowdfunding_support_cubit.dart';
import '../../../../data/config/const/decoration_const.dart';
import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_widgets.dart';

class MyCrowdfundingQuestionList extends StatefulWidget {
  MyCrowdfundingQuestionList({
    required this.index,
    required this.cubit,
    required this.projectModel,
  });

  final int index;
  final ProjectModel projectModel;
  final MyCrowdfundingSupportCubit cubit;

  @override
  _MyCrowdfundingQuestionListState createState() =>
      _MyCrowdfundingQuestionListState();
}

bool isVisible = true;

class _MyCrowdfundingQuestionListState
    extends State<MyCrowdfundingQuestionList> {
  TextEditingController content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 12.w,
        left: 12.w,
        right: 12.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1.w,
          color: AppColorUtils.GRAY_3,
        ),
        color: AppColorUtils.GREEN_ACCENT4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.cubit.state.questionData.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50.w,
                          width: 50.w,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.black12),
                          child: CachedNetworkImage(
                            imageUrl: widget.cubit.state
                                .questionData[widget.index].user!.photo!,
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
                                text: widget.cubit.state
                                        .questionData[widget.index].title ??
                                    "",
                                color: AppColorUtils.TEXT_GREEN2,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                                maxLines: 2,
                              ).paddingOnly(top: 5.w),
                              width: 240.w,
                            ),
                            AppWidgets.textLocale(
                              text: "${widget.cubit.state.questionData[widget.index].user!.lastName}"
                                  " ${widget.cubit.state.questionData[widget.index].user!.firstName}",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColorUtils.DARK_6,
                            ).paddingOnly(top: 3.w),
                          ],
                        ).paddingOnly(left: 10),
                      ],
                    ),
                    AppWidgets.text(
                      text: widget
                              .cubit.state.questionData[widget.index].content ??
                          "",
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: AppColorUtils.TEXT_8,
                      maxLines: 100,
                      height: 1.5,
                    ).paddingSymmetric(vertical: 10.w),
                    Visibility(
                        visible: !isVisible,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(
                                thickness: 1,
                                color: AppColorUtils.BLACK_12,
                              ),
                              AppWidgets.textLocale(
                                text: "Sizning javobingiz",
                                fontSize: 14.sp,
                                color: AppColorUtils.TEXT_GREEN2,
                                fontWeight: FontWeight.w600,
                              ).paddingOnly(
                                bottom: 3.w,
                                top: 7.w,
                              ),
                              SizedBox(
                                height: 200.w,
                                child: TextField(
                                  controller: content,
                                  expands: true,
                                  textAlignVertical: TextAlignVertical.top,
                                  maxLines: null,
                                  enabled: true,
                                  style: GoogleFonts.inter(
                                    fontSize: 15.sp,
                                  ),
                                  decoration: InputDecoration(
                                    // border: _border,
                                    disabledBorder:
                                        DecorationConst.INPUT_BORDER,
                                    focusedBorder: DecorationConst.INPUT_BORDER,
                                    enabledBorder: DecorationConst.INPUT_BORDER,
                                    contentPadding: EdgeInsets.all(14),
                                    hintText: "Sizning  javobingiz",
                                    hintStyle: GoogleFonts.inter(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColorUtils.GRAY_4,
                                    ),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                ).paddingOnly(
                                  top: 12.w,
                                  bottom: 18.h,
                                ),
                              ),
                              AppWidgets.appButton(
                                title: LocaleKeys.send,
                                height: 38.w,
                                width: 152.w,
                                onTap: () {
                                  if (content.text != "") {
                                    widget.cubit.postAnswer(
                                      widget.cubit.state
                                          .questionData[widget.index].id!,
                                      content.text,
                                    );
                                    widget.cubit.load(widget.projectModel.id!);
                                    content.text = "";
                                    setState(() {
                                      isVisible = true;
                                    });
                                  }else{
                                    AppWidgets.showText(text: "Javobingizni yozing");
                                  }
                                },
                              ).paddingOnly(bottom: 12.w),
                            ],
                          ),
                        )),
                    Visibility(
                      visible: isVisible,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFDFF8F3),
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: AppColorUtils.BORDER_COLOR,
                            width: 1,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isVisible = false;
                            });
                            print(widget.cubit.state.questionData.length);
                            print(widget.projectModel.id);
                          },
                          child: AppWidgets.textLocale(
                            text: "Javob yozish",
                            color: Color(0xFF024739),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ).paddingOnly(
                            left: 10.w,
                            top: 7.w,
                            bottom: 10.w,
                            right: 15.w,
                          ),
                        ),
                      ).paddingSymmetric(vertical: 18.w),
                    ),
                  ],
                )
              : Container(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30.w,
                        ),
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
                ),
        ],
      ),
    ).paddingOnly(bottom: 18.w);
  }
}
