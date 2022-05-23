import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/product_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/charity_history_page/widgets/date_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class MyCrowdfundingProductsItemsWidget extends StatelessWidget {
  final ProductModel model;
  final bool isLast;

  const MyCrowdfundingProductsItemsWidget({
    required this.model,
    this.isLast = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isLast ? EdgeInsets.only(bottom: 18.w) : null,
      width: context.width,
      decoration: BoxDecoration(
        color: AppColorUtils.ITEM_ORDERS_CARD,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColorUtils.ITEM_ORDERS_BORDER,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppWidgets.textLocale(
                      text: "Sotib oldi",
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColorUtils.ITEM_ORDERS_TEXT2,
                    ).paddingOnly(bottom: 8.w),
                    Row(
                      children: [
                        Container(
                          height: 36.w,
                          width: 36.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                  '',
                                ),
                                fit: BoxFit.cover),
                          ),
                        ).paddingOnly(right: 5.w),
                        Expanded(
                          child: AppWidgets.textLocale(
                            text: "Eshonov Fakhriyor",
                            fontSize: 14.sp,
                            maxLines: 2,
                            height: 1.2,
                            fontWeight: FontWeight.w500,
                            color: AppColorUtils.DARK2,
                          ),
                        ),
                      ],
                    )

                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppWidgets.textLocale(
                        text: "Telefon raqam",
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColorUtils.GRAY_4)
                        .paddingOnly(
                      bottom: 8.w,

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFEAF2FF),
                          ),
                          child: Row(
                            children: [
                              AppWidgets.imageSvg(
                                path: AppImageUtils.IC_PHONE,
                                color: AppColorUtils.BLUE_TEXT,
                              ).paddingOnly(right: 5),
                              AppWidgets.text(
                                text: "+998991234567",
                                fontWeight: FontWeight.w600,
                                color: AppColorUtils.BLUE_TEXT,
                                fontSize: 12.sp,
                              ).paddingOnly(bottom: 12.w, top: 12.w),
                            ],
                          ).paddingOnly(
                            left: 10,
                            right: 10,
                          ),
                        ),
                      ],
                    ).paddingOnly(
                      bottom: 8,
                    ),

                  ],
                ),
              ),
            ],
          ).paddingOnly(bottom: 17.w),
          AppWidgets.textLocale(
            text: LocaleKeys.briefly_about_the_product,
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: AppColorUtils.ITEM_ORDERS_TEXT2,
          ).paddingOnly(bottom: 3),
          AppWidgets.text(
            text:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ",
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            height: 1.3,
            color: AppColorUtils.DARK2,
            maxLines: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.starTextWidget(
                text: LocaleKeys.estimated_delivery.tr(),
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: AppColorUtils.ITEM_ORDERS_TEXT2,
              ),
              AppWidgets.textLocale(
                text: LocaleKeys.product_amount,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: AppColorUtils.ITEM_ORDERS_TEXT2,
              )
            ],
          ).paddingOnly(top: 12.w, bottom: 3.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateWidget(date: ""),
              AppWidgets.textLocale(
                text: LocaleKeys.sum,
                args: ["111111"],
                color: AppColorUtils.KRAUDFANDING,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ],
      ).paddingAll(12),
    ).paddingSymmetric(horizontal: 20).paddingOnly(top: 18.w);
  }
}
