import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/bloc/volunteer_detail_cubit/volunteer_detail_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/pages/volunteer_page/volunteer_detail_page/widgets/time_picker_volunteer.dart';
import 'package:najot/ui/widgets/app_bar_with_title.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class VolunteerHelpModel {
  CardModel cardModel;

  VolunteerDetailCubit cubit;

  VolunteerHelpModel({
    required this.cardModel,
    required this.cubit,
  });
}

class VolunteerHelpWidget extends StatelessWidget {
  static const String routeName = '/volunteerHelpWidget';

  const VolunteerHelpWidget({Key? key, required this.volunteerHelpModel})
      : super(key: key);

  final VolunteerHelpModel volunteerHelpModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColorUtils.background,
        appBar: AppBarWithTitle(
          title: LocaleKeys.help,
          onPress: () {
            NavigatorService.to.pop();
          },
        ),
        body: BlocBuilder<VolunteerDetailCubit, VolunteerDetailState>(
          bloc: volunteerHelpModel.cubit,
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
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: volunteerHelpModel.cardModel.image!,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
                    ],
                  ),
                  AppWidgets.textLocale(
                    text: LocaleKeys.project_name,
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                    color: AppColorUtils.dark6,
                  ).paddingOnly(
                    left: 20.w,
                    top: 12.w,
                    bottom: 3.w,
                  ),
                  AppWidgets.text(
                    text: "Drenajni kuzatish uchun mo’ljallangan moslama",
                    fontSize: 20.sp,
                    color: AppColorUtils.dark2,
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
                          image: DecorationImage(
                              image: NetworkImage(
                                  volunteerHelpModel.cardModel.image!),
                              fit: BoxFit.cover),
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
                            color: AppColorUtils.dark6,
                          ),
                          SizedBox(
                            width: 150.w,
                            child: AppWidgets.text(
                              text: "Eshonov Fakhriyor",
                              color: AppColorUtils.textGreen2,
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
                          SvgPicture.asset(AppImageUtils.date),
                          AppWidgets.text(
                            text: volunteerHelpModel.cardModel.date!,
                            color: AppColorUtils.bluePercent,
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
                    color: AppColorUtils.dark6,
                  ).paddingOnly(top: 13.w, left: 20.w, bottom: 3.w),
                  AppWidgets.text(
                          text: "Ovqat qilib berish va uyni yig'ishtirish",
                          maxLines: 2,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: AppColorUtils.greenText)
                      .paddingSymmetric(horizontal: 20.w),
                  AppWidgets.textLocale(
                    text: LocaleKeys.address,
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                    color: AppColorUtils.dark6,
                  ).paddingOnly(
                    left: 20.w,
                    top: 12.w,
                    bottom: 3.w,
                  ),
                  AppWidgets.text(
                          text: "Toshkent Shahar, Mirobod tumani*********",
                          fontSize: 14.w,
                          fontWeight: FontWeight.w500,
                          color: AppColorUtils.textBlue,
                          maxLines: 2)
                      .paddingSymmetric(horizontal: 20.w),
                  ButtonCard(
                    onPress: () {
                      if (state.checkBox) {
                        showDialog(
                            context: context,
                            builder: (ctx) => TimePikerVolunteer(
                                  model: volunteerHelpModel.cardModel,
                                  cubit: volunteerHelpModel.cubit,
                                  con: context,
                                ));
                      }
                    },
                    text: LocaleKeys.help,
                    height: 48.w,
                    width: 1.sw,
                    color: state.checkBox
                        ? AppColorUtils.percentColor
                        : AppColorUtils.disableBc,
                    textSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    textColor: AppColorUtils.white,
                  ).paddingOnly(
                    left: 20.w,
                    right: 20.w,
                    top: 20.w,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        onChanged: (v) {
                          volunteerHelpModel.cubit.onTapCheckBox(v!);
                        },
                        value: state.checkBox,
                        checkColor: AppColorUtils.borderColor,
                        activeColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        side: MaterialStateBorderSide.resolveWith(
                          (states) => const BorderSide(
                            width: 2.0,
                            color: AppColorUtils.borderColor,
                          ),
                        ),
                      ).paddingOnly(left: 8.w),
                      AppWidgets.textLocale(
                          text: LocaleKeys.i_agree,
                          color: AppColorUtils.dark1,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400)
                    ],
                  ),
                  AppWidgets.textLocale(
                          text: LocaleKeys.attention_agree_help,
                          color: AppColorUtils.red,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          maxLines: 2)
                      .paddingSymmetric(horizontal: 20.w),
                  SizedBox(
                    height: 20.w,
                  )
                ],
              ),
            );
          },
        ));
  }
}
