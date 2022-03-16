import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/slider_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class VolunteerCardWidget extends StatelessWidget {
  VolunteerCardWidget({required this.sliderModel});

  final SliderModel sliderModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 300.w,
        width: 220.w,
        child: Stack(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 2,
              color: AppColorUtils.WHITE,
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      // child: CachedNetworkImage(
                      //   width: double.infinity,
                      //   imageUrl: productModel.photo!.image!,
                      //   errorWidget: (context, url, error) => Image.asset(
                      //     AppImageUtils.APP_LOGO,
                      //   ),
                      //   placeholder: (context, url) =>
                      //       Center(child: CircularProgressIndicator()),
                      //   fit: BoxFit.cover,
                      // ),
                      child: Image.asset(
                        sliderModel.image,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppWidgets.text(
                            text:
                                "Onaxonni yoshlari katta, ularga ovqat qilib beri...",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            maxLines: 2,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppWidgets.textLocale(
                                text: LocaleKeys.help_type,
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                                color: AppColorUtils.DARK6,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              AppWidgets.text(
                                  text: "Ovqat qilib berish",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColorUtils.GREEN_TEXT),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  AppWidgets.textLocale(
                                    text: LocaleKeys.Executable_date,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10.sp,
                                    color: AppColorUtils.DARK6,
                                  ),
                                  AppWidgets.text(
                                    text: "*",
                                    color: Colors.red,
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              AppWidgets.text(
                                text: "25.08.2022",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColorUtils.BLUE_PERCENT,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Align(
                child: SvgPicture.asset(AppImageUtils.LIKE),
                alignment: Alignment.topRight,
              ),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
