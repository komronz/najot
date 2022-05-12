import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/crowd_founding_model.dart';
import 'package:najot/ui/pages/my_project_and_announcements_pages/my_charity_project_full_widget/my_charity_project_details_widgets.dart';

class MyCrowdfundingMoreWidget extends StatelessWidget {
  const MyCrowdfundingMoreWidget({
    required this.cardModel,
    Key? key,
  }) : super(key: key);

  final CrowdFoundingModel cardModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: List.generate(
            cardModel.infoModel!.length,
            (index) => listDetailCharity(
              cardModel.infoModel![index].title!,
              cardModel.infoModel![index].text!,
            ).paddingSymmetric(horizontal: 20.w),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          height: 218.w,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            child: CachedNetworkImage(
              imageUrl: cardModel.imgUrl!,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ).paddingOnly(top: 20.h),
      ],
    );
  }
}
