import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/crowd_founding_page_main/project_details/product_datail_page/product_detail_page.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({Key? key, required this.cardModel}) : super(key: key);

  final CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColorUtils.white,
      child: Column(
        children: [
          RichText(
            text: TextSpan(children: [
              const TextSpan(
                text: "*",
                style: TextStyle(
                  color: AppColorUtils.red,
                ),
              ),
              TextSpan(
                text: LocaleKeys.buy_use_product.tr(),
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColorUtils.dark2,
                ),
              ),
            ]),
          ).paddingSymmetric(
            horizontal: 24.w,
            vertical: 15.w,
          ),
          SingleChildScrollView(
            child: Column(
              children: List.generate(
                cardModel.productModel!.length,
                (index) => Container(
                  padding: EdgeInsets.all(18.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColorUtils.greenAccent4,
                    border: Border.all(
                      width: 2,
                      color: AppColorUtils.divider,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          AppWidgets.text(
                            text: "500 000",
                            color: AppColorUtils.smsBtn3,
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          AppWidgets.textLocale(
                            text: LocaleKeys.toSum,
                            color: AppColorUtils.smsBtn3,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      AppWidgets.text(
                        text: cardModel.productModel![index]!.title!,
                        maxLines: 10,
                        color: AppColorUtils.dark3,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppWidgets.starTextWidget(
                            text: LocaleKeys.approximate_branch.tr(),
                          ),
                          AppWidgets.textLocale(
                            text: LocaleKeys.bought,
                            color: AppColorUtils.dark6,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppWidgets.text(
                            text: "25.02.2022",
                            color: AppColorUtils.textGreen2,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ).paddingOnly(left: 6.w),
                          AppWidgets.circleImages(
                            image: cardModel.productModel![index]!.imgUrl!,
                            count: 100,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 18.w,
                      ),
                      ButtonCard(
                        height: 48.w,
                        width: MediaQuery.of(context).size.width,
                        onPress: () {
                          NavigatorService.to.pushNamed(
                              ProductDetailPage.routeName,
                              arguments: cardModel.productModel![index]);
                        },
                        text: LocaleKeys.buy.tr(),
                        color: AppColorUtils.percentColor,
                        textColor: AppColorUtils.white,
                        textSize: 16.sp,
                      )
                    ],
                  ),
                ).paddingOnly(
                  left: 20.w,
                  right: 20.w,
                  bottom: 12.w,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
