import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/data/model/project_model.dart';
import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/utils/app_image_utils.dart';

class AuthorWidget extends StatelessWidget {
  final ProjectModel projectModel;
  const AuthorWidget({Key? key, required this.projectModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.r),
            border: Border.all(color: const Color(0xFF0BBF90), width: 0.5)
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40.r),
            child: CachedNetworkImage(
              imageUrl: 'https://api.najot.uz${projectModel.owner!.photo!}',
              fit: BoxFit.cover,
              width: 50.w,
              height: 50.w,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Icon(Icons.person, color: const Color(0xFF0BBF90), size: 40.w,),
            ),
          ),
        ),
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '* ',
                style: TextStyle(
                  color: const Color(0xFFF50000),
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1.40,
                ),
              ),
              TextSpan(
                text: LocaleKeys.volunteer.tr(),
                style: TextStyle(
                  color: const Color(0xFF939598),
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1.40,
                ),
              ),
            ],
          ),
        ),
        subtitle: Row(
          children: [
            Container(
              padding: EdgeInsets.all(2.w),
              height: 12.w,
              width: 12.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: const Color(0xFFE8FEF2),
              ),
              child: SvgPicture.asset(
                AppImageUtils.CHECK_SMALL,
                color: const Color(0xFF038D69),
              ),
            ),
            SizedBox(width: 4.w,),
            Text(
              projectModel.owner!.firstName!,
              style: TextStyle(
                color: const Color(0xFF059D0B),
                fontSize: 14.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 1.40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
