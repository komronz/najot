import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:najot/data/bloc/my_crowdfunding_support_cubit/my_crowdfunding_support_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_widget/show_picker_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/config/const/decoration_const.dart';

class MyCrowdfundingNewsWidget extends StatelessWidget {
  MyCrowdfundingNewsWidget({
    required this.cardModel,
    required this.cubit,
    Key? key,
  }) : super(key: key);

  final ProjectModel cardModel;
  final MyCrowdfundingSupportCubit cubit;
  final TextEditingController title = TextEditingController();
  final TextEditingController content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        cubit.state.newsData.isNotEmpty
            ? Column(
                children: List.generate(cubit.state.newsData.length, (index) {
                  var createdAt = DateTime.parse(
                    cubit.state.newsData[index].createdAt!,
                  );
                  var name = cubit.state.newsData[index].user!.firstName??"";
                  var lastname = cubit.state.newsData[index].user!.lastName??"";
                  return Container(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
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
                                    imageUrl: cubit
                                        .state.newsData[index].user!.photo!,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.person),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 150.w,
                                      child: AppWidgets.text(
                                        text:
                                            "${name} ${lastname}",
                                        color: AppColorUtils.TEXT_GREEN2,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        AppWidgets.textLocale(
                                          text: LocaleKeys.project_author,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColorUtils.DARK_6,
                                        ).paddingOnly(right: 65.w),
                                        AppWidgets.text(
                                          text: DateFormat("dd.MM.yyyy hh:mm")
                                              .format(createdAt),
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColorUtils.BLUE_PERCENT,
                                        )
                                      ],
                                    ).paddingOnly(top: 5),
                                  ],
                                ).paddingOnly(left: 10),
                              ],
                            ),
                          ],
                        ),
                        AppWidgets.text(
                          text: cubit.state.newsData[index].title ?? "",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColorUtils.BLACK,
                        ).paddingOnly(
                          bottom: 7.w,
                          top: 18.w,
                        ),
                        AppWidgets.text(
                          height: 1.5,
                          text: cubit.state.newsData[index].content ?? "",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColorUtils.TEXT_GREY2,
                          maxLines: 40,
                        ),
                        SizedBox(
                          height: 18.w,
                        ),
                        Container(
                          height: 229.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: cubit.state.newsData[index].cover!,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).paddingOnly(bottom: 10.w);
                }),
              )
            : Container(
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          SvgPicture.asset(AppImageUtils.NEWS)
                              .paddingOnly(bottom: 11.h),
                          SizedBox(
                            width: 200.sp,
                            child: AppWidgets.textLocale(
                              textAlign: TextAlign.center,
                              text: LocaleKeys.news_empty,
                              color: AppColorUtils.DARK_6,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ).paddingOnly(
                      top: 52.h,
                      bottom: 98.h,
                    ),
                  ],
                ),
              ),
        AppWidgets.textLocale(
          text: LocaleKeys.add_news,
          fontSize: 18.sp,
          color: AppColorUtils.TEXT_GREEN2,
          fontWeight: FontWeight.w600,
        ).paddingOnly(
          top: 10.w,
          bottom: 5.w,
        ),
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
              ),
            ),
            ShowPickerWidget(
              width: 46,
              height: 46,
              image: AppImageUtils.IC_UPLOAD,
              color: AppColorUtils.PERCENT_COLOR,
              padding: 10,
              imageSelect: (v) {
                cubit.saveFile(v);
              },
              imageFile: cubit.state.file,
            ),
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
          ),
        ).paddingOnly(
          top: 12.w,
          bottom: 12.w,
        ),
        AppWidgets.appButton(
          title: LocaleKeys.send,
          onTap: () async {
            if (title.text != "" &&
                content.text != "" &&
                cubit.state.file != null) {
              cubit.postNews(
                cardModel.id!,
                title.text,
                content.text,
                cubit.state.file!,
              );
              cubit.state.file = null;
              cubit.load(cardModel.id!);
            } else {
              return AppWidgets.showText(
                text: LocaleKeys.enter_info.tr(),
              );
            }
          },
        ),
      ],
    );
  }
}
