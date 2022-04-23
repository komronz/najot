import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/kraufanding_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../widgets/app_text_field.dart';

class MyCrowdfundingNewsWidget extends StatelessWidget {
  const MyCrowdfundingNewsWidget({
    required this.cardModel,
    Key? key,
  }) : super(key: key);

  final KraufandingModel cardModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            false
                ? Container(
                    padding: EdgeInsets.only(
                      top: 12.w,
                      left: 12.w,
                      right: 12.w,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColorUtils.GREEN_ACCENT4),
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
                                    image: DecorationImage(
                                        image: NetworkImage(cardModel.imgUrl!),
                                        fit: BoxFit.cover),
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
                                        text: "Eshonov Fakhriyor",
                                        color: AppColorUtils.TEXT_GREEN2,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    AppWidgets.textLocale(
                                      text: LocaleKeys.project_author,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColorUtils.DARK_6,
                                    ).paddingOnly(top: 5.w),
                                  ],
                                ).paddingOnly(left: 10),
                              ],
                            ),
                            AppWidgets.text(
                                    text: "25.08.2022 18:19",
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColorUtils.BLUE_PERCENT)
                                .paddingOnly(bottom: 10.w),
                          ],
                        ),
                        AppWidgets.text(
                                text: cardModel.infoModel![0].title!,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColorUtils.BLACK)
                            .paddingOnly(
                          bottom: 7.w,
                          top: 18.w,
                        ),
                        AppWidgets.text(
                            height: 1.5,
                            text: cardModel.infoModel![0].text!,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColorUtils.TEXT_GREY2,
                            maxLines: 40),
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
                              imageUrl: cardModel.imgUrl!,
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
                        ).paddingOnly(top: 52.h, bottom: 98.h),
                      ],
                    ),
                  ),
          ],
        ),
        Column(
          children: [
            AppWidgets.textLocale(
              text: LocaleKeys.add_news,
              fontSize: 18.sp,
              color: AppColorUtils.TEXT_GREEN2,
              fontWeight: FontWeight.w600,
            ),
          ],
        ).paddingOnly(
          left: 12.w,
          bottom: 12.h,
          top: 12.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: AppTextField(
                title: '',
                hasTitle: false,
                hintText: LocaleKeys.comment_title.tr(),
                onChanged: (String value) {},
              ),
              width: 270.w,
            ),
            Material(
              child: Ink(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColorUtils.PERCENT_COLOR,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () {},
                  child: Container(
                    height: 46.w,
                    width: 46.w,
                    child: SvgPicture.asset(
                      AppImageUtils.IC_UPLOAD,
                      color: AppColorUtils.WHITE,
                    ).paddingAll(10),
                  ),
                ),
              ),
            )
          ],
        ),
        AppTextField(
          hintText: LocaleKeys.write_your_comment.tr(),
          onChanged: (v) {},
          title: "",
          hasTitle: false,
          height: 170.w,
          isMultiLine: true,
        ).paddingOnly(
          top: 12.w,
          bottom: 18.h,
        ),
        AppWidgets.appButton(
          title: LocaleKeys.send,
          onTap: () {},
        ),
      ],
    );
  }
}