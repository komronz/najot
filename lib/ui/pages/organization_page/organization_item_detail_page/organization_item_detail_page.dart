import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/bloc/organization_cubit/organization_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/organization_model.dart';
import 'package:najot/ui/pages/organization_page/organization_item_detail_page/organization_charity_item_widget.dart';

import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/services/navigator_service.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_widgets.dart';
import '../../charity_page/charity_full_page/charity_full_page.dart';
import '../../charity_page/charity_full_page/charity_full_page2.dart';
import '../../charity_page/widgets/charity_item2_widget.dart';
import '../../charity_page/widgets/charity_item_widget.dart';

class OrganizationItemDetailPageModel {
  final OrganizationModel model;
  final OrganizationCubit cubit;

  OrganizationItemDetailPageModel({
    required this.model,
    required this.cubit,
  });
}

class OrganizationItemDetailPage extends StatelessWidget {
  OrganizationItemDetailPage({required this.model});

  static const String routeName = "/organizationItemDetailPage";
  OrganizationItemDetailPageModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColorUtils.BACKGROUND,
          titleSpacing: 0,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: AppWidgets.appBarWidget(
            title: model.model.name,
            onTap: () {},
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColorUtils.BACKGROUND,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(11),
                    bottomRight: Radius.circular(11),
                  ),
                ),
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
                          imageUrl: model.model.image,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50.w,
                          width: 50.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(model.model.image),
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
                    ).paddingSymmetric(horizontal: 20.w),
                    AppWidgets.textLocale(
                      text: "Tashkilot haqida",
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: AppColorUtils.DARK_1,
                    ).paddingOnly(
                      left: 20.w,
                      top: 12.w,
                      bottom: 10.w,
                    ),
                    AppWidgets.text(
                            text: model.model.title,
                            fontSize: 16.w,
                            fontWeight: FontWeight.w400,
                            color: AppColorUtils.DARK3,
                            maxLines: 50,
                            height: 1.5.w)
                        .paddingSymmetric(horizontal: 20.w),
                    AppWidgets.textLocale(
                      text: "Tashkilot loyihalari",
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      color: AppColorUtils.DARK_1,
                    ).paddingOnly(
                      left: 20.w,
                      top: 12.w,
                      bottom: 10.w,
                    ),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          model.model.list.length,
                          (index) {
                            if (model.model.list[index].progres != null) {
                              return CharityItemWidget(
                                onTap: () {
                                  NavigatorService.to.pushNamed(
                                    CharityFullPage.routName,
                                    arguments: model.model.list[index],
                                  );
                                },
                                model: model.model.list[index],
                              ).paddingOnly(left: 10);
                            } else {
                              return CharityItem2Widget(
                                model: model.model.list[index],
                                onTap: () {
                                  NavigatorService.to.pushNamed(
                                    OrganizationCharityItemWidget.routName,
                                    arguments: OrganizationCharityItemModel(
                                      cardModel: model.model.list[index],
                                      cubit: model.cubit,
                                    ),
                                  );
                                },
                              ).paddingOnly(left: 10);
                            }
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}