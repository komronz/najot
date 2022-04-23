import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/bloc/my_products_cubit/my_products_cubit.dart';
import 'package:najot/data/bloc/orders_cubit/orders_cubit.dart';
import 'package:najot/data/config/const/decoration_const.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/pages/my_products_page/widgets/my_products_items_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../data/bloc/my_products_cubit/my_products_state.dart';
import '../../../data/services/navigator_service.dart';
import '../notification_page/notification_page.dart';

class MyProductsPage extends StatelessWidget {
  static const String routeName = "/myProductsPage";

  const MyProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyProductsCubit()..load(),
      child: BlocBuilder<MyProductsCubit, MyProductsState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColorUtils.BACKGROUND,
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
                  text: LocaleKeys.my_products,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w600,
                ),
                InkWell(
                  onTap: (){
                    NavigatorService.to.pushNamed(NotificationPage.routeName,);
                  },
                  child: SvgPicture.asset(
                    AppImageUtils.NOTIFICATION,
                    height: 35.w,
                    width: 35.w,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ).paddingSymmetric(horizontal: 20),
          ),
          body: _buildBody(state, context),
        ),
      ),
    );
  }

  Widget _buildBody(MyProductsState state, BuildContext context) {
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
      child: buildList(state),
    );
  }

  Widget buildList(MyProductsState state) {
    if (state.list.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppWidgets.imageSvg(path: AppImageUtils.IMG_ORDERS_EMPTY),
          AppWidgets.textLocale(
            text: LocaleKeys.you_have_not_purchased_the_product_yet,
            maxLines: 2,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
            color: AppColorUtils.GRAY_4,
          ).paddingOnly(top: 16.w),
        ],
      ).paddingOnly(
        top: 70.w,
        right: 60.w,
        left: 60.w,
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index == state.list.length - 1) {
          return MyProductsItemsWidget(
            model: state.list[index],
            isLast: true,
          );
        }
        return MyProductsItemsWidget(
          model: state.list[index],
        );
      },
      itemCount: state.list.length,
    );
  }
}
