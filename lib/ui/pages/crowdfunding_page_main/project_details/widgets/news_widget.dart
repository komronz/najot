import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/bloc/project_data_cubit/project_data_cubit.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({
    required this.cubit,
    Key? key,
  }) : super(key: key);

  final ProjectDataCubit cubit;

  @override

  Widget build(BuildContext context) {
    return cubit.state.newsData.isNotEmpty
        ? Column(
            children: List.generate(cubit.state.newsData.length, (index) {
              var createdAt =
                  DateTime.parse(cubit.state.newsData[index].createdAt!);

              return Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: 15.h),
                padding: EdgeInsets.only(top: 12.w, left: 12.w, right: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColorUtils.GREEN_ACCENT5,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50.w,
                          width: 50.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black12,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25.w),
                            child: CachedNetworkImage(
                              imageUrl:
                                  cubit.state.newsData[index].user!.photo!,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.person),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppWidgets.text(
                              text:
                                  "${cubit.state.newsData[index].user!.firstName!} ${cubit.state.newsData[index].user!.lastName!}",
                              color: AppColorUtils.TEXT_GREEN2,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                            AppWidgets.textLocale(
                              text: LocaleKeys.project_author,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColorUtils.DARK_6,
                            ),
                          ],
                        ),
                        Spacer(),
                        AppWidgets.text(
                          text:
                              DateFormat("dd.MM.yyyy HH:mm").format(createdAt),
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColorUtils.BLUE_PERCENT,
                        ),
                      ],
                    ),
                    AppWidgets.text(
                      text: cubit.state.newsData[index].title ?? "",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColorUtils.BLACK,
                    ).paddingOnly(
                      bottom: 7.w,
                      top: 18.w,
                    ),
                    AppWidgets.text(
                        height: 1.5,
                        text: cubit.state.newsData[index].content ?? "",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColorUtils.TEXT_GREY2,
                        maxLines: 40),
                    SizedBox(height: 18.w),
                    Container(
                      height: 229.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: cubit.state.newsData[index].cover!,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          )
        : Container(
            child: Center(
              child: Column(
                children: [
                  SvgPicture.asset(AppImageUtils.NEWS),
                  SizedBox(
                    width: 200.sp,
                    child: AppWidgets.textLocale(
                      textAlign: TextAlign.center,
                      text: LocaleKeys.news_empty,
                      color: AppColorUtils.DARK_4,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      maxLines: 2,
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
