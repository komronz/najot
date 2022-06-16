import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/add_project_bloc/add_project_bloc.dart';
import 'package:najot/data/bloc/add_project_bloc/add_project_event.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:super_rich_text/super_rich_text.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';

class AddProjectShowSuccessSend extends StatelessWidget {
  const AddProjectShowSuccessSend({
    required this.addProjectBloc,
    Key? key,
  }) : super(key: key);
  final AddProjectBloc addProjectBloc;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: AppColorUtils.WHITE,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric(
            vertical: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppWidgets.text(
                textAlign: TextAlign.center,
                text:
                LocaleKeys.project_successful_added.tr(),
                richText: true,
                othersMarkers: [
                  MarkerText(
                    marker: "//",
                    style: TextStyle(color: AppColorUtils.KRAUDFANDING),
                  )
                ],
                maxLines: 10,
                height: 1.3,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColorUtils.DARK3,
              ).paddingSymmetric(horizontal: 54),
              AppWidgets.imageSvg(
                path: AppImageUtils.SUCCESS,
                height: 100.w,
                width: 100.w,
                fit: BoxFit.none,
              ).paddingOnly(top: 20),
              AppWidgets.appButton(
                title: LocaleKeys.thank_you.tr(),
                textColor: AppColorUtils.KRAUDFANDING,
                onTap: () {
                  addProjectBloc.add(SendDateEvent());
                  addProjectBloc.add(AddProjectBtnEvent());
                  Navigator.pop(context);
                  },
                color: Color(0xFFECFFFA),
              ).paddingOnly(
                top: 26.w,
                left: 25.w,
                right: 25.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}