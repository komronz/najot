

import 'package:flutter/material.dart';
import 'package:najot/data/extensions/context_extension.dart';

import '../../../../data/utils/app_color_utils.dart';
import '../../login_page/custom_shape.dart';

class IntroClipPathWidget extends StatelessWidget {
  final double height;

  IntroClipPathWidget({required this.height});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomShape(),
      child: Container(
        width: context.width,
        height: height,
        color: AppColorUtils.GREEN_INTRO,
      ),
    );
  }
}
