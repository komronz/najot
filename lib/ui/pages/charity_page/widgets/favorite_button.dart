import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;

  const FavoriteButton({
    this.isFavorite = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !isFavorite
        ? Container(
      width: 24.w,
      height: 24.w,
      decoration: BoxDecoration(
        color: AppColorUtils.PURPLE,
        borderRadius: BorderRadius.circular(2),
      ),
      child: AppWidgets.imageSvg(
        path: AppImageUtils.UNLIKE,
        fit: BoxFit.none,
      ),
    )
        : Container(
      width: 24.w,
      height: 24.w,
      decoration: BoxDecoration(
        color: AppColorUtils.IC_GREEN,
        borderRadius: BorderRadius.circular(2),
      ),
      child: AppWidgets.imageSvg(
        path: AppImageUtils.IC_FAVORITE_ADD,
        fit: BoxFit.none,
      ),
    );
  }
}