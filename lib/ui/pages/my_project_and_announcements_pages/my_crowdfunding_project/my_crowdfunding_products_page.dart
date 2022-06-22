import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/my_products_cubit/my_products_cubit.dart';
import 'package:najot/data/config/const/decoration_const.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/bloc/my_products_cubit/my_products_state.dart';
import 'my_crowdfunding_products_items_widget.dart';

class MyCrowdfundingProductPage extends StatelessWidget {
  const MyCrowdfundingProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyProductsCubit()..load(),
      child: BlocBuilder<MyProductsCubit, MyProductsState>(
        builder: (context, state) => Scaffold(
          body: _buildBody(state, context),
        ),
      ),
    );
  }

  Widget _buildBody(MyProductsState state, BuildContext context) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state.hasError) {
      return Center(
        child: AppWidgets.imageSvg(path: AppImageUtils.imgWait),
      );
    }
    return Container(
      decoration: DecorationConst.decWithShadow,
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
          AppWidgets.imageSvg(path: AppImageUtils.imgOrdersEmpty),
          AppWidgets.textLocale(
            text: LocaleKeys.not_purchased_product,
            maxLines: 2,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
            color: AppColorUtils.gray4,
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
          return MyCrowdfundingProductsItemsWidget(
            model: state.list[index],
            isLast: true,
          );
        }
        return MyCrowdfundingProductsItemsWidget(
          model: state.list[index],
        );
      },
      itemCount: state.list.length,
    );
  }
}
