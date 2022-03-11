import 'package:auto_size_text/auto_size_text.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/styles/app_colors.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/loading_page/loading_page.dart';
import 'package:super_rich_text/super_rich_text.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';

/// Please don't change [fontSize] directly.
/// [fontSize] used project wide.
Widget _baseText({
  required String text,
  FontStyle fontStyle = FontStyle.normal,
  double? fontSize,
  Color? color,
  FontWeight fontWeight = FontWeight.normal,
  int maxLines = 1,
  bool autoResize = false,
  TextAlign textAlign = TextAlign.start,
  bool richText = false,
  double height = 1,
  List<MarkerText> othersMarkers = const [],
}) {
  TextStyle textStyle = GoogleFonts.inter(
    fontSize: fontSize ?? 16.sp,
    color: color ?? AppColors.BLACK,
    fontStyle: fontStyle,
    fontWeight: fontWeight,
    height: height,
  );
  if (richText) {
    return SuperRichText(
      text: text,
      style: textStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      othersMarkers: othersMarkers,
    );
  }
  if (autoResize) {
    return AutoSizeText(
      text,
      style: textStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
  return Text(
    text,
    textAlign: textAlign,
    style: textStyle,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,
  );
}

class AppWidgets {
  static Widget appButton({
    required String title,
    required VoidCallback onTap,
    double? width,
    double? height,
    Color? color = AppColorUtils.GREEN_APP,
    Color? textColor = AppColorUtils.WHITE,
    double borderRadius = 12.0,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Ink(
        width: width ?? ScreenUtil().screenWidth,
        height: height ?? 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius)
        ),
        child: Center(
          child: textLocale(
            textAlign: TextAlign.center,
            text: title,
            color: textColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      onTap: onTap,
    ).paddingSymmetric(horizontal: 20);
  }

  static Widget appBarWidget({
    required String title,
    required VoidCallback onTap,
    Color? color = AppColorUtils.BACK_BUTTON,
    Color? textColor = AppColorUtils.BLACK,

  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          InkWell(
            child: Container(
              width: 31,
              height: 34,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(AppImageUtils.BACK_ICON),
            ),
            onTap: onTap,
          ),
          Expanded(
            child: Container(
              child: AppWidgets.textLocale(
                text: title,
                fontWeight: FontWeight.w600,
                color: textColor,
                fontSize: 20,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 34,
            width: 31,
          )
        ],
      ),
    );
  }

  static Widget text({
    required String text,
    double? fontSize,
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    FontStyle fontStyle = FontStyle.normal,
    int maxLines = 1,
    bool autoResize = false,
    TextAlign textAlign = TextAlign.start,
    bool richText = false,
    List<MarkerText> othersMarkers = const [],
    double height = 1,
  }) {
    return _baseText(
      textAlign: textAlign,
      text: text,
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      maxLines: maxLines,
      autoResize: autoResize,
      fontStyle: fontStyle,
      richText: richText,
      othersMarkers: othersMarkers,
      height: height,
    );
  }

  static Widget textLocale({
    required String text,
    double? fontSize,
    Color? color,
    FontWeight fontWeight = FontWeight.normal,
    FontStyle fontStyle = FontStyle.normal,
    int maxLines = 1,
    bool autoResize = false,
    TextAlign textAlign = TextAlign.start,
    List<String> args = const [],
    bool richText = false,
    double height = 1.4,
    List<MarkerText> othersMarkers = const [],
  }) {
    return _baseText(
      textAlign: textAlign,
      text: tr(text, args: args),
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      maxLines: maxLines,
      autoResize: autoResize,
      fontStyle: fontStyle,
      richText: richText,
      othersMarkers: othersMarkers,
      height: height,
    );
  }

  static Widget imageAsset({
    required String path,
    double? height,
    double? width,
    Color? color,
    BoxFit fit = BoxFit.cover,
  }) {
    return Image.asset(
      path,
      height: height,
      width: width,
      fit: fit,
      color: color,
    );
  }

  static Widget imageSvg({
    required String path,
    double? height,
    double? width,
    BoxFit fit = BoxFit.cover,
    Color? color,
  }) {
    return SvgPicture.asset(
      path,
      height: height,
      width: width,
      fit: fit,
      color: color,
    );
  }

  static void showText({
    required String text,
    Duration? duration,
  }) {
    if (duration == null) {
      duration = Duration(seconds: 2);
    }
    BotToast.showText(
      text: text,
      textStyle: GoogleFonts.inter(
        fontSize: 14.sp,
        color: AppColors.WHITE,
      ),
      align: Alignment.center,
      duration: duration,
    );
  }

  static Widget noAvatar({double? size}) {
    return Container(
      height: size ?? 35.w,
      width: size ?? 35.w,
      color: AppColors.GREY,
      padding: EdgeInsets.all(5.w),
      child: FittedBox(
        fit: BoxFit.fill,
        child: Icon(
          Icons.person,
          color: AppColors.WHITE,
        ),
      ),
    );
  }

  static Widget title16(String text, [Color? color]) {
    return AppWidgets.text(
      text: text,
      maxLines: 50,
      color: color,
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      textAlign: TextAlign.center,
    );
  }

  static void isLoading(bool value) {
    if (value) {
      NavigatorService.to.push(
        PageRouteBuilder(
          opaque: false,
          pageBuilder: (context, animation, secondaryAnimation) =>
              LoadingPage(),
        ),
      );
    } else {
      NavigatorService.to.pop();
    }
  }
}
