import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/product_cubit/product_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/main_page/widgets/button_card_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/product_datail_page/product_detail_page.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class ProductsWidget extends StatelessWidget {
   ProductsWidget({required this.cubit});

final ProductCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
    builder: (context, state) {
      if(state.loading){
        return Center(
          child: CircularProgressIndicator(),
        ).paddingOnly(top: 250.w);
      }else {
        return Container(
          color: AppColorUtils.WHITE,
          child: Column(
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "*",
                    style: TextStyle(
                      color: AppColorUtils.RED,
                    ),
                  ),
                  TextSpan(
                    text: LocaleKeys.buy_use_product.tr(),
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColorUtils.DARK2,
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
                    state.list.length,
                        (index) => Container(
                      padding: EdgeInsets.all(18.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColorUtils.GREEN_ACCENT4,
                        border: Border.all(
                          width: 2,
                          color: AppColorUtils.DIVIDER,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              AppWidgets.text(
                                text: state.list[index].price!,
                                color: AppColorUtils.SMS_BTN3,
                                fontWeight: FontWeight.w600,
                                fontSize: 20.sp,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              AppWidgets.textLocale(
                                text: LocaleKeys.toSum,
                                color: AppColorUtils.SMS_BTN3,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          AppWidgets.text(
                            text: state.list[index].title!,
                            maxLines: 10,
                            color: AppColorUtils.DARK3,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              AppWidgets.starTextWidget(
                                text: LocaleKeys.approximate_branch.tr(),
                              ),
                              AppWidgets.textLocale(
                                text: LocaleKeys.bought,
                                color: AppColorUtils.DARK_6,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              AppWidgets.text(
                                text: "25.02.2022",
                                color: AppColorUtils.TEXT_GREEN2,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                              ).paddingOnly(left: 6.w),
                              AppWidgets.circleImages(
                                image: ""  ,
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
                                  arguments: ProductDetailModel(state.list[index], cubit,));
                            },
                            text: LocaleKeys.buy.tr(),
                            color: AppColorUtils.PERCENT_COLOR,
                            textColor: AppColorUtils.WHITE,
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
    },
);
  }
}
