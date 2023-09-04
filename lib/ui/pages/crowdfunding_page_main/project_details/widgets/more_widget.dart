import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/project_model.dart';

import '../../../../../data/utils/app_color_utils.dart';

class MoreWidget extends StatelessWidget {
  const MoreWidget({
    required this.cardModel,
  });

  final ProjectModel cardModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 18.h),
              child: Text(
                cardModel.title!,
                style: TextStyle(
                  fontSize: 17.sp,
                  color: AppColorUtils.DARK2,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 6.h),
            Container(
              child: HtmlWidget(
                cardModel.content ?? "",
                textStyle: TextStyle(
                    fontSize: 14.sp,
                    color: AppColorUtils.DARK3,
                    fontWeight: FontWeight.w400,
                    height: 1.5),
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 10.w,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(12.w),
            ),
            child: CachedNetworkImage(
              imageUrl: cardModel.coverUrl!,
              fit: BoxFit.contain,
              width: MediaQuery.of(context).size.width,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),
      ],
    ).paddingSymmetric(
      horizontal: 20.w,
    );
  }
}
