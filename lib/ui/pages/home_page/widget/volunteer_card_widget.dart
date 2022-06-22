import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/crowd_founding_page_main/project_details/product_datail_page/product_detail_page.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/services/navigator_service.dart';

class VolunteerCardWidget extends StatelessWidget {
  const VolunteerCardWidget({Key? key, required this.projectModel})
      : super(key: key);

  final ProjectModel projectModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        height: 300.w,
        width: 220.w,
        child: Stack(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 2,
              color: AppColorUtils.white,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: CachedNetworkImage(
                        width: double.infinity,
                        imageUrl: projectModel.cover!,
                        errorWidget: (context, url, error) => Image.asset(
                          AppImageUtils.splash2,
                        ),
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(10),
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
                                color: AppColorUtils.dark6,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              AppWidgets.text(
                                  text: "Ovqat qilib berish",
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColorUtils.greenText),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  AppWidgets.textLocale(
                                    text: LocaleKeys.executable_date,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10.sp,
                                    color: AppColorUtils.dark6,
                                  ),
                                  AppWidgets.text(
                                    text: "*",
                                    color: AppColorUtils.red,
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
                                color: AppColorUtils.bluePercent,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(AppImageUtils.like),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        NavigatorService.to
            .pushNamed(ProductDetailPage.routeName, arguments: projectModel);
      },
    );
  }
}
