import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/styles/app_colors.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/loading_page/loading_page.dart';
import 'package:super_rich_text/super_rich_text.dart';

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
  static Widget iconButton({
    required VoidCallback onTap,
    required Widget iconWidget,
    Color? color = AppColorUtils.GREEN_BTN,
    double borderRadius = 3.0,
    double height = 23,
    double width = 23,
  }) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Ink(
          child: iconWidget,
          height: height,
          width: width,
        ),
        onTap: onTap,
      ),
    );
  }

  static Widget favouriteButton(
      {required bool select,
      required double height,
      required double width,
      required VoidCallback onTap}) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: select ? AppColorUtils.PURPLE : AppColorUtils.IC_GREEN,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Container(
            height: height,
            width: width,
            child: SvgPicture.asset(
              select ? AppImageUtils.UNLIKE_ICON : AppImageUtils.LIKE_ICON,
            ).paddingAll(10.w),
          ),
        ),
      ),
    );
  }

  static Widget circleImages({required int count}) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              height: 25.w,
              width: 25.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(AppImageUtils.DEF_PERSON),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 8.w),
              height: 25.w,
              width: 25.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(AppImageUtils.DEF_PERSON),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16.w),
              height: 25.w,
              width: 25.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(AppImageUtils.DEF_PERSON),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        AppWidgets.text(
          text: "+${count}",
          color: AppColorUtils.TEXT_GREEN2,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ).paddingOnly(left: 3),
      ],
    ).paddingOnly(top: 3);
  }

  static Widget starTextWidget({
    required String text,
    Color? color = AppColorUtils.DARK_6,
    double? fontSize = 10,
    FontWeight fontWeight = FontWeight.w400,
    bool isCenter = false,
    bool hasStar = true,
    int maxLines = 2,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return Row(
      mainAxisAlignment:
          isCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        hasStar
            ? SizedBox(
                child: textLocale(
                  text: '*',
                  fontSize: fontSize,
                  color: AppColorUtils.RED,
                ),
              )
            : SizedBox(),
        textLocale(
          text: text,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          maxLines: maxLines,
          fontStyle: fontStyle,
        ),
      ],
    );
  }

  static Widget appButton({
    required String title,
    required VoidCallback onTap,
    double? width,
    double? height,
    Color color = AppColorUtils.GREEN_APP,
    Color textColor = AppColorUtils.WHITE,
    double fontSize = 16.0,
    FontWeight fontWeight = FontWeight.w600,
    double borderRadius = 12.0,
    Widget icon = const SizedBox(),
  }) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Ink(
          width: width ?? ScreenUtil().screenWidth,
          height: height ?? 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                textLocale(
                  textAlign: TextAlign.center,
                  text: title,
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
              ],
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }

  static Widget selectLangWidget(BuildContext context, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        height: 44.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColorUtils.LANG_BACK),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.language,
                  color: AppColorUtils.BORDER_COLOR,
                ),
                SizedBox(
                  width: 10.w,
                ),
                AppWidgets.text(
                  text: context.locale == Locale('uz', 'UZ') ? "Til" : " Язык",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColorUtils.DARK2,
                )
              ],
            ),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(3.w),
                  child: context.locale == Locale('uz', 'UZ')
                      ? SvgPicture.asset(
                          AppImageUtils.UZ_FLAG,
                        )
                      : SvgPicture.asset(
                          AppImageUtils.RUS_FLAG,
                        ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                AppWidgets.text(
                  text: context.locale == Locale('uz', 'UZ')
                      ? "O'zbek tili"
                      : "Русский язык",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColorUtils.DARK2,
                ),
                SizedBox(
                  width: 15.w,
                ),
                Icon(Icons.chevron_right)
              ],
            )
          ],
        ),
      ).paddingOnly(bottom: 24.w),
    );
  }

  static Widget deleteProfile(BuildContext context, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        height: 44.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: AppColorUtils.PINK),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row().paddingOnly(left: 50.w),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(3.w),
                  child: SvgPicture.asset(
                    AppImageUtils.TRASH,
                    height: 16.w,
                    alignment: Alignment.topCenter,
                    color: AppColors.RED,
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                AppWidgets.text(
                  text: LocaleKeys.delete_profile.tr(),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColorUtils.RED,
                ).paddingOnly(top: 5.w),
              ],
            ),
            SizedBox(
              width: 15.w,
            ),
            Icon(Icons.chevron_right)
          ],
        ),
      ).paddingOnly(bottom: 24.w),
    );
  }

  static Widget appBarMenu(
      {required String title,
      required VoidCallback onTapMenu,
      VoidCallback? onTapIcon,
      Color? textColor = AppColorUtils.BLACK,
      bool visibleIcon = false,
      String icon = ""}) {
    return Container(
      height: 80.w,
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: Container(
              height: 35.w,
              width: 35.w,
              child: SvgPicture.asset(AppImageUtils.MENU),
            ),
            onTap: onTapMenu,
          ),
          AppWidgets.textLocale(
            text: title,
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
          ),
          visibleIcon
              ? InkWell(
                  child: Container(
                    height: 35.w,
                    width: 35.w,
                    child: SvgPicture.asset(icon),
                  ),
                  onTap: onTapIcon,
                )
              : SizedBox(
                  width: 20,
                )
        ],
      ),
    );
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
                fontSize: 20.sp,
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

  static Widget rowIconText({
    required String icon,
    required String iconSelect,
    required String text,
    required VoidCallback onTap,
    bool direction = false,
    bool isActive = false,
    double fontSize = 15,
    EdgeInsets padding = const EdgeInsets.all(10),
  }) {
    var color = isActive ? AppColorUtils.GREEN_TEXT : AppColorUtils.DARK3;
    var iconSelected = isActive ? iconSelect : icon;
    var fontWeight = isActive ? FontWeight.w600 : FontWeight.w500;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  iconSelected,
                ),
                SizedBox(
                  width: 8.w,
                ),
                textLocale(
                  text: text,
                  fontWeight: fontWeight,
                  fontSize: fontSize,
                  color: color,
                )
              ],
            ),
            direction == true
                ? SvgPicture.asset(
                    AppImageUtils.RIGHT_DIRECTION,
                  )
                : SizedBox()
          ],
        ),
      ),
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

  static Widget networkImage(
      {required String url,
      double? height,
      double? width,
      Color? color,
      BoxFit fit = BoxFit.cover,
      int? scale}) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(14)),
      child: CachedNetworkImage(
          imageUrl: url,
          width: width,
          height: height,
          fit: fit,
          color: color,
          placeholder: (context, url) {
            return Center(
              widthFactor: 20,
              heightFactor: 20,
              child: CircularProgressIndicator(),
            );
          },
          errorWidget: (context, url, error) {
            return Container(color: Colors.black12, child: Container());
          }),
    );
  }

  static Widget imageFile({
    required String path,
    double? height,
    double? width,
    Color? color,
    BoxFit fit = BoxFit.cover,
  }) {
    return Image.file(
      File(path),
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
