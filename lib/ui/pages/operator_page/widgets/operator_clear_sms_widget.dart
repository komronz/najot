import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/operator_cubit/operator_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
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
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColorUtils.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppWidgets.imageSvg(
                path: AppImageUtils.icOperatorDelete,
                width: 53.w,
                height: 70.w,
                color: AppColorUtils.gray4,
              ).paddingOnly(top: 20),
              AppWidgets.text(
                textAlign: TextAlign.center,
                text: LocaleKeys.want_clear_notification.tr(),
                richText: true,
                maxLines: 3,
                height: 1.35,
                color: AppColorUtils.dark2,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                othersMarkers: [
                  MarkerText(
                    marker: '//',
                    style: TextStyle(
                      color: AppColorUtils.red,
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
                      color: AppColorUtils.smsBtn2,
                      textColor: AppColorUtils.smsBtn3,
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
                      color: AppColorUtils.deleteBtn,
                      textColor: AppColorUtils.red,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      height: 48.w,
                      title: LocaleKeys.yes,
                      onTap: () {
                        cubit.deleteSmsList();
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
