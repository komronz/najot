import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../../data/config/const/decoration_const.dart';
import '../../../../../data/utils/app_image_utils.dart';
import '../../../../data/bloc/my_crowdfunding_support_cubit/my_crowdfunding_support_cubit.dart';

class MyCrowdfundingCommentsWidget extends StatefulWidget {
  MyCrowdfundingCommentsWidget({
    required this.cubit,
    required this.projectModel,
  });

  final MyCrowdfundingSupportCubit cubit;
  final ProjectModel projectModel;

  @override
  State<MyCrowdfundingCommentsWidget> createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends State<MyCrowdfundingCommentsWidget> {
  bool hasTextTitle = false;
  bool hasTextComment = false;
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var list = widget.cubit.state.commentsData;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        list.isNotEmpty
            ? Column(
                children: List.generate(
                  widget.cubit.state.commentsData.length,
                  (index) => Container(
                    padding: EdgeInsets.only(
                      top: 12.w,
                      left: 12.w,
                      right: 12.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
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
                                color: Colors.black12,
                              ),
                              child: CachedNetworkImage(
                                imageUrl: list[index].user!.photo!,
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
                                    text: list[index].title ?? "",
                                    color: AppColorUtils.TEXT_GREEN2,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                  ),
                                  width: 220.w,
                                ),
                                AppWidgets.text(
                                  text:
                                      "${list[index].user!.lastName} ${list[index].user!.firstName}",
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColorUtils.DARK_6,
                                ).paddingOnly(top: 5.w),
                              ],
                            ).paddingOnly(left: 10),
                          ],
                        ),
                        AppWidgets.text(
                          text: list[index].content ?? "",
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: AppColorUtils.TEXT_GREY2,
                          maxLines: 100,
                          height: 1.5,
                        ).paddingSymmetric(vertical: 15.w),
                      ],
                    ),
                  ).paddingOnly(bottom: 10),
                ),
              )
            : Container(
                child: Center(
                  child: Column(
                    children: [
                      SvgPicture.asset(AppImageUtils.NEWS),
                      SizedBox(
                        width: 200.sp,
                        child: AppWidgets.textLocale(
                          textAlign: TextAlign.center,
                          text: LocaleKeys.comments_empty,
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
        Divider(
          thickness: 1,
          color: AppColorUtils.BLACK_12,
        ),
        AppWidgets.textLocale(
          text: LocaleKeys.writing_comment,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: AppColorUtils.TEXT_GREEN2,
        ).paddingSymmetric(vertical: 8.w),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 270.w,
              height: 46.w,
              child: TextField(
                controller: title,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                maxLines: null,
                enabled: true,
                style: GoogleFonts.inter(
                  fontSize: 15.sp,
                ),
                decoration: InputDecoration(
                  // border: _border,
                  disabledBorder: DecorationConst.INPUT_BORDER,
                  focusedBorder: DecorationConst.INPUT_BORDER,
                  enabledBorder: DecorationConst.INPUT_BORDER,
                  contentPadding: EdgeInsets.all(14),
                  hintText: LocaleKeys.comment_title.tr(),
                  hintStyle: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColorUtils.GRAY_4,
                  ),
                ),
                keyboardType: TextInputType.multiline,
                onChanged: (v) {
                  if (v != "") {
                    setState(() {
                      hasTextTitle = true;
                    });
                  } else {
                    setState(() {
                      hasTextTitle = false;
                    });
                  }
                },
              ),
            ).paddingOnly(top: 12.w),
            Material(
              child: Ink(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: hasTextTitle == false || hasTextComment == false
                      ? AppColorUtils.DISABLE_BC
                      : AppColorUtils.PERCENT_COLOR,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () {
                    if (hasTextComment && hasTextTitle) {
                      widget.cubit.postCommentById(
                        widget.projectModel.id!,
                        title.text,
                        content.text,
                      );
                      widget.cubit.load(widget.projectModel.id!);
                      title.text = "";
                      content.text = "";
                      hasTextTitle = false;
                      hasTextComment = false;
                    } else {
                      AppWidgets.showText(text: LocaleKeys.enter_info.tr());
                    }
                  },
                  child: Container(
                    height: 46.w,
                    width: 46.w,
                    child: Icon(
                      Icons.arrow_upward,
                      color: AppColorUtils.WHITE,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 170,
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
              disabledBorder: DecorationConst.INPUT_BORDER,
              focusedBorder: DecorationConst.INPUT_BORDER,
              enabledBorder: DecorationConst.INPUT_BORDER,
              contentPadding: EdgeInsets.all(14),
              hintText: LocaleKeys.write_your_comment.tr(),
              hintStyle: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColorUtils.GRAY_4,
              ),
            ),
            keyboardType: TextInputType.multiline,
            onChanged: (v) {
              if (content.text != "") {
                setState(() {
                  hasTextComment = true;
                });
              } else {
                setState(() {
                  hasTextComment = false;
                });
              }
            },
          ),
        ).paddingOnly(top: 12.w),
      ],
    );
  }
}
