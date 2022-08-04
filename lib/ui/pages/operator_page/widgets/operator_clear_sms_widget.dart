import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/operator_cubit/operator_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:super_rich_text/super_rich_text.dart';


class OperatorClearSmsWidget extends StatelessWidget {
  final OperatorCubit cubit;


  const OperatorClearSmsWidget({
    required this.cubit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColorUtils.WHITE,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppWidgets.imageSvg(
                path: AppImageUtils.IC_OPERATOR_DELETE,
                width: 53.w,
                height: 70.w,
                color: AppColorUtils.GRAY_4,
              ).paddingOnly(top: 20),
              AppWidgets.text(
                textAlign: TextAlign.center,
                text: LocaleKeys.want_clear_notification.tr(),
                richText: true,
                maxLines: 3,
                height: 1.35,
                color: AppColorUtils.DARK2,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                othersMarkers: [
                  MarkerText(
                    marker: '//',
                    style: TextStyle(
                      color: AppColorUtils.RED,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ).paddingOnly(
                top: 24.w,
                left: 38.w,
                right: 38.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: AppWidgets.appButton(
                      width: double.infinity,
                      color: AppColorUtils.SMS_BTN2,
                      textColor: AppColorUtils.SMS_BTN3,
                      height: 48.w,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      title: LocaleKeys.go_back,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 25.w,
                  ),
                  Expanded(
                    flex: 2,
                    child: AppWidgets.appButton(
                      width: double.infinity,
                      color: AppColorUtils.DELETE_BTN,
                      textColor: AppColorUtils.RED,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      height: 48.w,
                      title: LocaleKeys.yes,
                      onTap: () {
                        cubit.deleteSmsList(cubit.state.list![0]!.id!);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ).paddingAll(24.w)
            ],
          ),
        ),
      ),
    );
  }
}