import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/product_model.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/main_page/widgets/button_card_widget.dart';
import 'package:najot/ui/widgets/app_bar_with_title.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../../data/bloc/product_cubit/product_cubit.dart';

class ProductDetailModel{

  ProductDetailModel(this.products, this.cubit);
  final Products products;

  final ProductCubit cubit;
}

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({required this.model});

  final ProductDetailModel model;
  static const String routeName = "/productDetailPage";

  @override
  Widget build(BuildContext context) {
    var createdAt= DateTime.parse(model.products.createdAt!);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColorUtils.BACKGROUND,
      appBar: AppBarWithTitle(
        title: LocaleKeys.buy_product.tr(),
        onPress: () {
          NavigatorService.to.pop();
        },
      ),
      body: BlocBuilder<ProductCubit, ProductState>(
        bloc: model.cubit,
       builder: (context, state) {

    return Container(
        decoration: BoxDecoration(
          color: AppColorUtils.WHITE,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(11),
            topLeft: Radius.circular(11),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: size.height*0.8,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 300.w,
                      margin: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 18.w,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: "productModel.imgUrl!",
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                    ),
                    AppWidgets.textLocale(
                      text: LocaleKeys.project_name,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColorUtils.DARK_6,
                    ).paddingOnly(
                      left: 20.w,
                      bottom: 3.w,
                    ),
                    AppWidgets.text(
                      text: model.products.title!,
                      fontSize: 20.sp,
                      color: AppColorUtils.DARK2,
                      fontWeight: FontWeight.w500,
                      maxLines: 2,
                    ).paddingSymmetric(horizontal: 20.w),
                    Row(
                      children: [
                        Container(
                          height: 50.w,
                          width: 50.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage("productModel.imgUrl!"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppWidgets.textLocale(
                              text: LocaleKeys.project_author,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColorUtils.DARK_6,
                            ),
                            SizedBox(
                              width: 150.w,
                              child: AppWidgets.text(
                                text: "Eshonov Fakhriyor",
                                color: AppColorUtils.TEXT_GREEN2,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ).paddingOnly(top: 2.w),
                            ),
                          ],
                        ).paddingOnly(left: 10),
                      ],
                    ).paddingOnly(
                      top: 18.w,
                      left: 20.w,
                      bottom: 18.w,
                    ),
                    AppWidgets.textLocale(
                      text: LocaleKeys.about_product,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColorUtils.DARK_6,
                    ).paddingOnly(
                      left: 20.w,
                      bottom: 3.w,
                    ),
                    AppWidgets.text(
                      text: model.products.title!,
                      fontSize: 14.sp,
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                      maxLines: 50,
                      color: AppColorUtils.DARK2,
                    ).paddingSymmetric(horizontal: 20.w),
                    SizedBox(height: 18.w,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppWidgets.textLocale(
                          text: LocaleKeys.prize_amount,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColorUtils.DARK_6,
                        ),
                        AppWidgets.textLocale(
                          text: LocaleKeys.approximate_branch,
                          color: AppColorUtils.DARK_6,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 20.w),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppWidgets.textLocale(
                          text: LocaleKeys.sum,
                          args: ["${model.products.price}".tr()],
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: AppColorUtils.TEXT_GREEN,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(AppImageUtils.DATE),
                            AppWidgets.text(
                              text: DateFormat("dd.MM.yyyy").format(createdAt),
                              color: AppColorUtils.BLUE_PERCENT,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ).paddingOnly(left: 6.w),
                          ],
                        ),
                      ],
                    ).paddingSymmetric(
                      horizontal: 20.w,
                    ),
                    SizedBox(height: 18.w,),

                  ],
                ),
              ),
            ),
            Container(
              color: AppColorUtils.WHITE,

              child: ButtonCard(
                height: 48.w,
                width: MediaQuery.of(context).size.width,
                onPress: () {},
                text: LocaleKeys.switch_amount.tr(),
                color: AppColorUtils.PERCENT_COLOR,
                textColor: AppColorUtils.WHITE,
                textSize: 16.sp,
              ).paddingOnly(
                left: 20.w,
                right: 20.w,
                top: 10.w,
              ),
            )
          ],
        ),
      );
  },
),
    );
  }
}
