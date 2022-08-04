import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/bloc/charity_page_cubit/charity_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/charity_page/widgets/time_picker_charity.dart';
import 'package:najot/ui/pages/main_page/widgets/button_card_widget.dart';
import 'package:najot/ui/widgets/app_bar_with_title.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/model/project_model.dart';

class CharityHelpModel {
  ProjectModel cardModel;

  CharityCubit cubit;

  CharityHelpModel({
    required this.cardModel,
    required this.cubit,
  });
}

class CharityHelpWidget extends StatelessWidget {
  static const String routeName = '/charityHelpWidget';

  CharityHelpWidget({required this.helpModel});

  CharityHelpModel helpModel;

  @override
  Widget build(BuildContext context) {
    var modifiedAt = DateTime.parse(helpModel.cardModel.modifiedAt!);
    return Scaffold(
        backgroundColor: AppColorUtils.BACKGROUND,
        appBar: AppBarWithTitle(
          title: LocaleKeys.donate_items.tr(),
          onPress: () {
            NavigatorService.to.pop();
          },
        ),
        body: BlocBuilder<CharityCubit, CharityState>(
          bloc: helpModel.cubit,
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
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
                            imageUrl: helpModel.cardModel.coverUrl!,
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
                    ],
                  ),
                  AppWidgets.textLocale(
                    text: LocaleKeys.project_name,
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                    color: AppColorUtils.DARK_6,
                  ).paddingOnly(
                    left: 20.w,
                    top: 12.w,
                    bottom: 3.w,
                  ),
                  AppWidgets.text(
                    text: helpModel.cardModel.title ?? "",
                    fontSize: 20.sp,
                    color: AppColorUtils.DARK2,
                    fontWeight: FontWeight.w500,
                    maxLines: 2,
                  ).paddingSymmetric(horizontal: 20.w),
                  Row(
                    children: [
                      Container(
                        height: 50.w,
                        width: 50.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black12,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25.w),
                          child: CachedNetworkImage(
                            imageUrl: helpModel.cardModel.owner!.photo!,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.person),
                          ),
                        ),
                      ).paddingOnly(
                        top: 15.w,
                        left: 20.w,
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
                              text: helpModel.cardModel.owner!.firstName!,
                              color: AppColorUtils.TEXT_GREEN2,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ).paddingOnly(top: 2.w),
                          ),
                        ],
                      ).paddingOnly(left: 10),
                    ],
                  ),
                  SizedBox(height: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidgets.starTextWidget(
                        text: LocaleKeys.done_date.tr(),
                      ),
                      SizedBox(
                        height: 3.w,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(AppImageUtils.DATE),
                          AppWidgets.text(
                            text: DateFormat("dd.MM.yyyy").format(modifiedAt),
                            color: AppColorUtils.BLUE_PERCENT,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ).paddingOnly(left: 6.w),
                        ],
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 20.w),
                  AppWidgets.starTextWidget(
                    text: LocaleKeys.help_type.tr(),
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                    color: AppColorUtils.DARK_6,
                  ).paddingOnly(
                    top: 13.w,
                    left: 20.w,
                    bottom: 3.w,
                  ),
                  AppWidgets.text(
                    text: helpModel.cardModel.title ?? "",
                    maxLines: 2,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: AppColorUtils.GREEN_TEXT,
                  ).paddingSymmetric(horizontal: 20.w),
                  AppWidgets.textLocale(
                    text: LocaleKeys.address,
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                    color: AppColorUtils.DARK_6,
                  ).paddingOnly(
                    left: 20.w,
                    top: 12.w,
                    bottom: 3.w,
                  ),
                  AppWidgets.text(
                          text: helpModel.cardModel.address ?? "",
                          fontSize: 14.w,
                          fontWeight: FontWeight.w500,
                          color: AppColorUtils.TEXT_BLUE,
                          maxLines: 2)
                      .paddingSymmetric(horizontal: 20.w),
                  ButtonCard(
                    onPress: () {
                      if (state.checkBox) {
                        showDialog(
                            context: context,
                            builder: (ctx) => TimePikerCharity(
                                  model: helpModel.cardModel,
                                  cubit: helpModel.cubit,
                                  con: context,
                                ));
                      }
                    },
                    text: LocaleKeys.doing_charity.tr(),
                    height: 48.w,
                    width: 1.sw,
                    color: state.checkBox
                        ? AppColorUtils.PERCENT_COLOR
                        : AppColorUtils.DISABLE_BC,
                    textSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    textColor: AppColorUtils.WHITE,
                  ).paddingOnly(
                    left: 20.w,
                    right: 20.w,
                    top: 20.w,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        onChanged: (v) {
                          helpModel.cubit.onTapCheckBox(v!);
                        },
                        value: state.checkBox,
                        checkColor: AppColorUtils.BORDER_COLOR,
                        activeColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                          (states) => BorderSide(
                            width: 2.0,
                            color: AppColorUtils.BORDER_COLOR,
                          ),
                        ),
                      ).paddingOnly(left: 8.w),
                      AppWidgets.textLocale(
                          text: LocaleKeys.i_agree,
                          color: AppColorUtils.DARK_1,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400)
                    ],
                  ),
                  AppWidgets.textLocale(
                    text: LocaleKeys.attention_agree_help,
                    color: AppColorUtils.RED,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    maxLines: 2,
                  ).paddingSymmetric(horizontal: 20.w),
                  SizedBox(height: 20.w)
                ],
              ),
            );
          },
        ));
  }
}
