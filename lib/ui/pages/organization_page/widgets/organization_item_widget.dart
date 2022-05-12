import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/organization_cubit/organization_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/organization_model.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/organization_page/organization_item_detail_page/organization_item_detail_page.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class OrganizationItemWidget extends StatelessWidget {
  final OrganizationModel model;
  final OrganizationCubit cubit;

  const OrganizationItemWidget({
    required this.model,
    required this.cubit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 1,
        color: AppColorUtils.WHITE,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 140.w,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: CachedNetworkImage(
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  imageUrl: model.image,
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                  width: 1.sw,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppWidgets.text(
                    text: model.name,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    maxLines: 2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidgets.textLocale(
                        text: LocaleKeys.number_of_projects,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColorUtils.DARK_6,
                      ).paddingOnly(top: 12.w),
                      AppWidgets.text(
                        text: "${model.count}",
                        fontWeight: FontWeight.w600,
                        color: AppColorUtils.BLUE_PERCENT,
                        fontSize: 14.sp,
                      ).paddingOnly(top: 5.w),
                    ],
                  )
                ],
              ).paddingSymmetric(vertical: 14, horizontal: 12),
            )
          ],
        ),
      ),
      onTap: () {
        NavigatorService.to.pushNamed(
          OrganizationItemDetailPage.routeName,
          arguments: OrganizationItemDetailPageModel(
            cubit: cubit,
            model: model,
          ),
        );
      },
    );
  }
}
