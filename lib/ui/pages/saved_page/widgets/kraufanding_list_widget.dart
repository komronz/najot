import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/model/favorites-add_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/saved_page/widgets/charity_kraufanding.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/bloc/favorite-add_cubit/favorite_add_cubit.dart';

class CrowdfundingSavedListWidget extends StatelessWidget {
  final FavoriteAddCubit cubit;

  const CrowdfundingSavedListWidget({
    required this.cubit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (cubit.state.list.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppWidgets.imageSvg(
            path: AppImageUtils.BIG_HEART,
            height: 70.w,
            width: 70.w,
            fit: BoxFit.none,
          ).paddingOnly(top: 80.w),
          AppWidgets.textLocale(
            text: LocaleKeys.nothing_found_yet,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColorUtils.GRAY_4,
          ).paddingOnly(top: 20),
        ],
      );
    }
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      physics: ClampingScrollPhysics(),
      childAspectRatio: 160 / 267,
      padding: EdgeInsets.all(0),
      reverse: false,
      crossAxisSpacing: 8,
      mainAxisSpacing: 6,
      children: List.generate(
        cubit.state.list.length,
        (index) => CharityKraufanding(
          favouriteModel: cubit.state.list[index],
        ),
      ),
    );
  }
}
