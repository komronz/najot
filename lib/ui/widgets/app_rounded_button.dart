import 'package:flutter/material.dart';
import 'package:najot/data/utils/app_color_utils.dart';

class AppRoundedButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color color;
  final double height;
  final Widget icon;

  const AppRoundedButton({
    required this.onTap,
    required this.icon,
    this.color = AppColorUtils.kraudfanding,
    this.height = 46.0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: color,
        child: InkWell(
          splashColor: AppColorUtils.disableBc,
          onTap: onTap,
          child: SizedBox(
            width: height,
            height: height,
            child: icon,
          ),
        ),
      ),
    );
  }
}
