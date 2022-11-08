import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:store_redirect/store_redirect.dart';

import '../../../../../data/utils/app_color_utils.dart';

class NewVersionAvailableDialog extends StatefulWidget {
  bool isActiveCheckbox = false;

  NewVersionAvailableDialog({Key? key}) : super(key: key);

  @override
  State<NewVersionAvailableDialog> createState() =>
      _NewVersionAvailableDialogState();
}

class _NewVersionAvailableDialogState extends State<NewVersionAvailableDialog> {
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
          height: 415.w,
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
                      text: LocaleKeys.have_new_version.tr(),
                      maxLines: 2,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    AppWidgets.textLocale(
                      textAlign: TextAlign.center,
                      text:
                          LocaleKeys.might_for_update,
                      maxLines: 2,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColorUtils.DARK_4,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: Colors.white,
                    checkColor: AppColorUtils.GREEN_1,
                    value: widget.isActiveCheckbox,
                    onChanged: (value) {
                      setState(() {
                        widget.isActiveCheckbox = !widget.isActiveCheckbox;
                      });
                    },
                  ),
                  AppWidgets.textLocale(
                    text: LocaleKeys.ask_no_more,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                  ),
                ],
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
              CupertinoButton(
                child: Text(
                  LocaleKeys.reminder_later.tr(),
                  style: TextStyle(
                    color: AppColorUtils.RED,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () async {
                  var isActiveValue =
                      await HiveService.to.getIsUpdateAvailableActive();
    
                  if (widget.isActiveCheckbox) {
                    await HiveService.to.setIsUpdateAvailableActive(false);
                  } else {
                    await HiveService.to.setIsUpdateAvailableActive(true);
                  }
    
                  Navigator.pop(context);
                },
              ),
            ],
          ).paddingAll(24.w),
        ),
      ),
    );
  }
}
