import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/bloc/orders_cubit/orders_cubit.dart';
import 'package:najot/data/config/const/decoration_const.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/kraufanding_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/charity_history_page/widgets/date_widget.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersCubit()..load(),
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            titleSpacing: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: SvgPicture.asset(
                    AppImageUtils.MENU,
                    height: 35.w,
                    width: 35.w,
                  ),
                  onTap: () {
                    HomePage.globalKey.currentState!.openDrawer();
                  },
                ),
                AppWidgets.textLocale(
                  text: "Mahsulotlarim",
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w600,
                ),
                SvgPicture.asset(
                  AppImageUtils.NOTIFICATION,
                  height: 35.w,
                  width: 35.w,
                  fit: BoxFit.fill,
                )
              ],
            ).paddingSymmetric(horizontal: 20),
          ),
          body: _buildBody(state, context),
        ),
      ),
    );
  }

  Widget _buildBody(OrdersState state, BuildContext context) {
    if (state.isLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (state.hasError) {
      return Center(
        child: AppWidgets.imageSvg(path: AppImageUtils.IMG_WAIT),
      );
    }
    return Container(
      decoration: DecorationConst.DEC_WITH_SHADOW,
      height: context.height,
      width: context.width,
      child: buildList(state.list),
    );
  }

  Widget buildList(List list) {
    if (list.isEmpty) {
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppWidgets.imageSvg(path: AppImageUtils.IMG_ORDERS_EMPTY),
          AppWidgets.textLocale(
            text: "Hozircha mahsulot sotib olmagansiz",
            fontWeight: FontWeight.w600,
            color: AppColorUtils.GRAY_4,
          ).paddingOnly(top: 16.w),
        ],
      ).paddingOnly(top: 70.w);
    }
    return ListView.builder(
      itemBuilder: (context, index) => OrdersItemsWidget(
        model: list[index],
      ),
      itemCount: list.length,
    );
  }
}

class OrdersItemsWidget extends StatelessWidget {
  final KraufandingModel model;

  const OrdersItemsWidget({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppWidgets.textLocale(
            text: "Loyiha nomi",
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: AppColorUtils.ITEM_ORDERS_TEXT2,
          ).paddingOnly(bottom: 3.w),
          AppWidgets.text(
              text: model.title!,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColorUtils.DARK2,
              maxLines: 3),
          AppWidgets.textLocale(
            text: "Loyiha nomi",
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: AppColorUtils.ITEM_ORDERS_TEXT2,
          ).paddingOnly(top: 12.w, bottom: 3),
          AppWidgets.text(
            text:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, ",
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: AppColorUtils.DARK2,
            maxLines: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.starTextWidget(
                text: "Taxminiy yetkazib berish",
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: AppColorUtils.ITEM_ORDERS_TEXT2,
              ),
              AppWidgets.textLocale(
                text: "Loyiha summasi",
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: AppColorUtils.ITEM_ORDERS_TEXT2,
              )
            ],
          ).paddingOnly(top: 12.w, bottom: 3.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateWidget(date: model.createdDate!),
              AppWidgets.textLocale(
                text: LocaleKeys.sum,
                args: [model.totalSum!],
                color: AppColorUtils.KRAUDFANDING,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          ButtonCard(
            onPress: () {},
            text: "Qabul qildim",
            width: 145.w,
            height: 38.w,
            visibleIcon: true,

          )
        ],
      ).paddingAll(12),
    ).paddingSymmetric(horizontal: 20).paddingOnly(bottom: 18);
  }
}
