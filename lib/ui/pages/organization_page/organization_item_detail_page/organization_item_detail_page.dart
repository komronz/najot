import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/organization_cubit/organization_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/organization_model.dart';
import 'package:najot/ui/pages/organization_page/organization_item_detail_page/organization_item_widget2.dart';

import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/services/navigator_service.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../widgets/app_widgets.dart';
import '../../charity_page/widgets/charity_item2_widget.dart';
import '../../charity_page/widgets/charity_item_widget.dart';
import 'organization_item_widget.dart';

class OrganizationItemDetailPageModel {
  final OrganizationModelResults model;

  OrganizationItemDetailPageModel({
    required this.model,
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
          title: model.model.name ?? "",
          onTap: () {
            NavigatorService.to.pop();
          },
        ),
      ),
      body: BlocBuilder<OrganizationCubit, OrganizationState>(
        bloc: OrganizationCubit.to..findProject(model.model.id!),
        builder: (context, state) {
          return SingleChildScrollView(
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
                            imageUrl: model.model.logo!,
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
                                image: NetworkImage(model.model.founderImage!),
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
                                child: Row(
                                  children: [
                                    AppWidgets.text(
                                      text:
                                          model.model.founder!.firstName ?? "",
                                      color: AppColorUtils.TEXT_GREEN2,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                    ).paddingOnly(top: 6.w, right: 5.w),
                                    AppWidgets.text(
                                      text: model.model.founder!.lastName ?? "",
                                      color: AppColorUtils.TEXT_GREEN2,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                    ).paddingOnly(top: 2.w),
                                  ],
                                ),
                              ),
                            ],
                          ).paddingOnly(left: 10),
                        ],
                      ).paddingSymmetric(horizontal: 20.w),
                      AppWidgets.textLocale(
                        text: LocaleKeys.about_the_organization,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: AppColorUtils.DARK_1,
                      ).paddingOnly(
                        left: 20.w,
                        top: 12.w,
                        bottom: 10.w,
                      ),
                      AppWidgets.text(
                        text: model.model.description ?? "",
                        fontSize: 16.w,
                        fontWeight: FontWeight.w400,
                        color: AppColorUtils.DARK3,
                        maxLines: 50,
                        height: 1.1.w,
                      ).paddingSymmetric(horizontal: 20.w),
                      AppWidgets.textLocale(
                        text: LocaleKeys.organizational_projects,
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
                            OrganizationCubit
                                    .to.state.project?.results?.length ??
                                0,
                            (index) {
                              if (state.project!.results![index].requiredFund !=
                                  null) {
                                return CharityItemWidget(
                                  onTap: () {
                                    NavigatorService.to.pushNamed(
                                      OrganizationItemWidget.routName,
                                      arguments: OrganizationItemModel(
                                        cardModel:
                                            state.project!.results![index],
                                        id: model.model.id!,
                                      ),
                                    );
                                  },
                                  model: state.project!.results![index],
                                  onTapLike: () {
                                    OrganizationCubit.to.changeLike(
                                      state.project!.results![index].id!,
                                    );
                                  },
                                );
                              } else {
                                return CharityItem2Widget(
                                  model: state.project!.results![index],
                                  onTap: () {
                                    NavigatorService.to.pushNamed(
                                      OrganizationItemWidget2.routName,
                                      arguments: OrganizationItemModel(
                                        cardModel:
                                        state.project!.results![index],
                                        id: model.model.id!,
                                      ),
                                    );
                                  },
                                  onTapLike: () async {
                                    OrganizationCubit.to.changeLike(
                                      state.project!.results![index].id!,
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        ),
                      ).paddingOnly(
                        bottom: 10.w,
                        left: 15.w,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
