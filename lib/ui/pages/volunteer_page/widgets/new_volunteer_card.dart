import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/bloc/volunteer_bloc/volunteer_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/volunteer_page/volunteer_detail_page/volunteer_detail_page.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class NewVolunteerCard extends StatelessWidget {
  NewVolunteerCard({required this.cardModel});

  CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 245.w,
      width: 162.w,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              NavigatorService.to.pushNamed(
                VolunteerDetailPage.routeName,
                arguments: cardModel,
              );
            },
            child: Card(
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
                      child: CachedNetworkImage(
                        width: double.infinity,
                        imageUrl: cardModel.image!,
                        errorWidget: (context, url, error) => Image.asset(
                          AppImageUtils.Splash2,
                        ),
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        fit: BoxFit.cover,
                      ),
                    ),
                    flex: 1,
                  ),
                  Container(
                    height: 105.w,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppWidgets.text(
                          text:
                              "Drenajni kuzatish uchun mo’jallangan moslama...",
                          fontSize: 14.sp,
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
                              height: 2,
                            ),
                            AppWidgets.text(
                              text: "10 000 000 so'm",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColorUtils.GREEN_TEXT,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.read<VolunteerCubit>().changeLike(cardModel: cardModel);
            },
            child: Align(
              child: Container(
                width: 24.w,
                height: 24.w,
                child: SvgPicture.asset(
                  cardModel.isFavorite!
                      ? AppImageUtils.UNLIKE
                      : AppImageUtils.LIKE,
                ),
              ),
              alignment: Alignment.topRight,
            ).paddingAll(15),
          ),
        ],
      ),
    );
  }
}
