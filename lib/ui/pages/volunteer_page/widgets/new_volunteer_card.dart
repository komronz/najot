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
  const NewVolunteerCard({Key? key, required this.cardModel}) : super(key: key);

  final CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                        imageUrl: cardModel.image!,
                        errorWidget: (context, url, error) => Image.asset(
                          AppImageUtils.splash2,
                        ),
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 105.w,
                    padding: const EdgeInsets.all(10),
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
                              color: AppColorUtils.dark6,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            AppWidgets.text(
                              text: "Ovqat qilib berish va uy tozalash",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColorUtils.greenText,
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
              alignment: Alignment.topRight,
              child: SizedBox(
                width: 24.w,
                height: 24.w,
                child: SvgPicture.asset(
                  cardModel.isFavorite!
                      ? AppImageUtils.unlike
                      : AppImageUtils.like,
                ),
              ),
            ).paddingAll(15),
          ),
        ],
      ),
    );
  }
}
