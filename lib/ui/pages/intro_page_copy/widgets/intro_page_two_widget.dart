// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:najot/data/extensions/context_extension.dart';
// import 'package:najot/data/extensions/widget_padding_extension.dart';
//
// import '../../../../data/utils/app_color_utils.dart';
// import '../../../widgets/app_widgets.dart';
// import 'intro_view_widgets.dart';
//
// class IntroPageTwoWidget extends StatelessWidget {
//   IntroPageTwoWidget({
//     required this.image,
//     required this.title,
//     required this.content,
//     Key? key,
//   }) : super(key: key);
//   String image;
//   String title;
//   String content;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         IntroClipPathWidget(height: context.height * 0.82.w),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             AppWidgets.textLocale(
//               text: title,
//               color: AppColorUtils.GREEN_BLACK,
//               fontSize: 30.sp,
//               fontWeight: FontWeight.w600,
//               textAlign: TextAlign.center,
//             ).paddingOnly(bottom: 8.w),
//             AppWidgets.textLocale(
//               text: content,
//               color: AppColorUtils.GREEN_WHITE,
//               textAlign: TextAlign.center,
//               maxLines: 2,
//               fontSize: 15.sp,
//               fontWeight: FontWeight.w400,
//             ).paddingOnly(bottom: 58.w),
//             AppWidgets.imageAsset(path: image)
//           ],
//         ).paddingOnly(top: 120.w),
//       ],
//     );
//   }
// }
