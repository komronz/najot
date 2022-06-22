import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class ImgUploadWidget extends StatelessWidget {
  final XFile? img;
  final VoidCallback uploadBtn;
  final String title;
  final VoidCallback onTapImg;
  final VoidCallback deleteImg;

  const ImgUploadWidget({
    required this.uploadBtn,
    required this.title,
    required this.img,
    required this.onTapImg,
    required this.deleteImg,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DottedBorder(
          borderType: BorderType.RRect,
          strokeWidth: 1,
          radius: const Radius.circular(12),
          color: AppColorUtils.dotColor,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: img != null
                ? GestureDetector(
                    onTap: onTapImg,
                    child: Hero(
                      tag: img!.path,
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 114.w,
                            width: double.infinity,
                            child: AppWidgets.imageFile(path: img!.path),
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: AppWidgets.iconButton(
                              onTap: deleteImg,
                              iconWidget: AppWidgets.imageSvg(
                                path: AppImageUtils.icBasket,
                              ).paddingAll(5),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : Container(
                    height: 114.w,
                    color: AppColorUtils.white,
                    child: Center(
                      child: ClipOval(
                        child: Material(
                          color: AppColorUtils.percentColor,
                          child: InkWell(
                            splashColor: AppColorUtils.disableBc,
                            onTap: uploadBtn,
                            child: SizedBox(
                              width: 35.w,
                              height: 35.w,
                              child: AppWidgets.imageSvg(
                                path: AppImageUtils.icUpload,
                                fit: BoxFit.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ),
        img != null
            ? Row(
                children: [
                  AppWidgets.imageSvg(
                    path: AppImageUtils.icSuccess,
                    width: 12,
                    height: 12,
                  ),
                  AppWidgets.textLocale(
                    text: LocaleKeys.uploaded,
                    color: AppColorUtils.successGreen,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ).paddingOnly(left: 2)
                ],
              ).paddingOnly(top: 10)
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppWidgets.text(
                    text: '*',
                    color: AppColorUtils.red,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                  Expanded(
                    child: AppWidgets.text(
                      text: title,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColorUtils.gray4,
                      maxLines: 2,
                      fontStyle: FontStyle.italic,
                      height: 1.5,
                    ),
                  )
                ],
              ).paddingOnly(top: 10)
      ],
    ).paddingOnly(top: 8);
  }
}
