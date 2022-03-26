import 'package:flutter/material.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class ImgView extends StatelessWidget {
  final String imgPath;

  const ImgView({required this.imgPath, Key? key}) : super(key: key);
  static const String routeName = '/imgView';

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: imgPath,
      child: AppWidgets.imageFile(
        path: imgPath,
        height: context.height,
        width: context.width,
      ),
    );
  }
}
