import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/project_details_widgets.dart';

class MoreWidget extends StatelessWidget {
  const MoreWidget({
    Key? key,
    required this.cardModel,
  }) : super(key: key);

  final CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: List.generate(
            cardModel.infoModel!.length,
            (index) => listDetail(
              cardModel.infoModel![index].title!,
              cardModel.infoModel![index].text!,
            ).paddingSymmetric(horizontal: 20.w),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 10.w,
          ),
          height: 218.w,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            child: CachedNetworkImage(
              imageUrl: cardModel.image!,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
      ],
    );
  }
}
