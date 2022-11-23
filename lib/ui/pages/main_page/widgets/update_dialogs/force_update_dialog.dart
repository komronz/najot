import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:store_redirect/store_redirect.dart';

import '../../../../../data/utils/app_color_utils.dart';
import '../../../../widgets/app_widgets.dart';

class ForceUpdateDialog extends StatelessWidget {
  const ForceUpdateDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        alignment: Alignment.center,
        // elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          width: 336.w,
          height: 328.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: double.infinity,
                height: 218.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 80.w,
                      height: 80.w,
                      child: SvgPicture.asset(
                        AppImageUtils.UPDATE_ICON,
                        fit: BoxFit.cover,
                      ),
                    ),
                    AppWidgets.textLocale(
                      textAlign: TextAlign.center,
                      text: LocaleKeys.have_new_version,
                      maxLines: 2,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    AppWidgets.textLocale(
                      textAlign: TextAlign.center,
                      text: LocaleKeys.must_update
                          ,   maxLines: 3,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColorUtils.DARK_4,
                    ),
                  ],
                ),
              ),
              AppWidgets.appButton(
                color: AppColorUtils.GREEN_APP,
                width: double.infinity,
                height: 44.w,
                title: LocaleKeys.update,
                onTap: () {
                  ///O'zgartirish kerak
                  StoreRedirect.redirect(
                    androidAppId: "org.khanacademy.android",
                    iOSAppId: "469863705",
                  );
                },
              ),
            ],
          ).paddingAll(24.w),
        ),
      ),
    );
  }
}
