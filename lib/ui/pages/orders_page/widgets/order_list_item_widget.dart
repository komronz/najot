import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/orders_cubit/orders_cubit.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/oreder_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/charity_history_page/widgets/date_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class OrdersItemsWidget extends StatelessWidget {
  final OrderModelResults model;
  final bool isLast;
  final int index;

  OrdersItemsWidget({
    required this.model,
    required this.index,
    this.isLast = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String date = DateFormat("dd.MM.yyyy").format(
      DateTime.parse(model.deliveryTime.toString()),
    );
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
          AppWidgets.textLocale(
            text: LocaleKeys.project_name,
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: AppColorUtils.ITEM_ORDERS_TEXT2,
          ).paddingOnly(bottom: 3.w),
          AppWidgets.text(
            text: model.title!,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColorUtils.DARK2,
            maxLines: 2,
          ),
          AppWidgets.textLocale(
            text: LocaleKeys.briefly_about_the_product,
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: AppColorUtils.ITEM_ORDERS_TEXT2,
          ).paddingOnly(top: 12.w, bottom: 3),
          AppWidgets.text(
            text: model.description!,
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
          ).paddingOnly(
            top: 12.w,
            bottom: 3.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateWidget(date: date),
              AppWidgets.textLocale(
                text: LocaleKeys.sum,
                args: [model.price!],
                color: AppColorUtils.KRAUDFANDING,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          AppWidgets.appButton(
            title: LocaleKeys.i_accepted.tr(),
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            borderRadius: 10,
            onTap: () {
              context.read<OrdersCubit>().isClick(index);
            },
            color: model.isClick!
                ? AppColorUtils.ITEM_ORDERS_BUTTON
                : AppColorUtils.ITEM_CHARITY_TEXT2,
            height: 38.w,
            width: 145.w,
            icon: AppWidgets.imageSvg(path: AppImageUtils.IC_ORDERS_SUCCESS)
                .paddingOnly(right: 5),
          ).paddingOnly(top: 15.w),
        ],
      ).paddingAll(12),
    )
        .paddingSymmetric(
          horizontal: 20,
        )
        .paddingOnly(
          top: 18.w,
        );
  }
}
