import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/operator_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/date_time_util.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class OperatorUserSmsWidget extends StatelessWidget {
  final OperatorModelResults model;

  const OperatorUserSmsWidget({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = calculateWidth(model.content??"");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        InkWell(
          onTap: (){
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return GestureDetector(
                  child: InteractiveViewer(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(model.file!, fit: BoxFit.contain,).paddingAll(15.w)
                        ,
                      ),
                    ),
                  ).paddingAll(10.w),
                  onTap: (){
                    Navigator.pop(context);
                  },

                );
              },
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: model.file==null?Container():Container(
              width: 250.w,
              height: 250.w,
              child: CachedNetworkImage(
                placeholder: (context, url)=>Center(
                  child: CircularProgressIndicator(),
                ),
                imageUrl: model.file??"",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ).paddingOnly(bottom: 5.w),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          width: width.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColorUtils.SMS_USER,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppWidgets.text(
                text: model.content??"",
                maxLines: 100,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColorUtils.WHITE,
                height: 1.5,
              ),
              AppWidgets.text(
                text: DateTimeUtil.dmy(
                  DateTime.now(),
                  context.locale,
                ),
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: AppColorUtils.WHITE,
              ).paddingOnly(top: 10),
            ],
          ),
        ),
      ],
    ).paddingOnly(
      bottom: 5.w,
      right: 18.w,
    );
  }

  static double calculateWidth(String s) {
    if (s.length < 12) {
      return 100.0;
    }
    if (s.length > 35) {
      return 250.0;
    }
    return s.length * 8 + 30;
  }
}
