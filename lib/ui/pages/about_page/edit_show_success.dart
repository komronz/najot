import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/applied_bloc/appeal_bloc.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:super_rich_text/super_rich_text.dart';

import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../data/bloc/applied_bloc/appeal_bloc.dart';

class EditShowSuccessSend extends StatelessWidget {
  const EditShowSuccessSend({
    required this.appealBloc,
    Key? key,
  }) : super(key: key);
  final AppealBloc appealBloc;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: AppColorUtils.white,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(
            vertical: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppWidgets.text(
                textAlign: TextAlign.center,
                text: LocaleKeys.successful_send.tr(),
                richText: true,
                othersMarkers: [
                  MarkerText(
                    marker: "//",
                    style: const TextStyle(color: AppColorUtils.kraudfanding),
                  )
                ],
                maxLines: 10,
                height: 1.3,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColorUtils.dark3,
              ).paddingSymmetric(horizontal: 54),
              AppWidgets.imageSvg(
                path: AppImageUtils.icEarphones,
                height: 54,
                width: 54,
                fit: BoxFit.none,
              ).paddingOnly(top: 20),
              AppWidgets.appButton(
                title: LocaleKeys.thank_you.tr(),
                textColor: AppColorUtils.kraudfanding,
                onTap: () {
                  appealBloc.add(AppealBtnEvent());
                  Navigator.pop(context);
                },
                color: const Color(0xFFECFFFA),
              ).paddingOnly(
                top: 26,
                left: 20,
                right: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
