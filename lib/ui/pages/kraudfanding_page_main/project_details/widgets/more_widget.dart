

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/project_details_page.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/project_details_widgets.dart';

class MoreWidget extends StatelessWidget {
  const MoreWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ProjectDetailsPage widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: List.generate(
            widget.cardModel.infoModel!.length,
                (index) => listDetail(
              widget.cardModel.infoModel![index].title!,
              widget.cardModel.infoModel![index].text!,
            ).paddingSymmetric(horizontal: 20.w),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          height: 218.w,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            child: CachedNetworkImage(
              imageUrl: widget.cardModel.image!,
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
    );
  }
}