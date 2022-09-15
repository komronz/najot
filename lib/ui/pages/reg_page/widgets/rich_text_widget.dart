import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/reg_page/loyiha_shartlari_page/loyiha_shartlari_page.dart';

class RichTextWidget extends StatefulWidget {
  const RichTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<RichTextWidget> createState() => _RichTextWidgetState();
}

class _RichTextWidgetState extends State<RichTextWidget> {
  late TapGestureRecognizer _onTapGestureRecognizer;

  @override
  void initState() {
    _onTapGestureRecognizer = TapGestureRecognizer()..onTap = _onTap;
    super.initState();
  }

  @override
  void dispose() {
    _onTapGestureRecognizer.dispose();
    super.dispose();
  }

  void _onTap() {
    NavigatorService.to.push(
      MaterialPageRoute(
        builder: (BuildContext context) => LoyihaShartlariPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      child: RichText(
        text: TextSpan(
          text: LocaleKeys.i_am.tr(),
          style: TextStyle(
            color: AppColorUtils.BLACK,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          children: [
            TextSpan(
              recognizer: _onTapGestureRecognizer,
              text: LocaleKeys.project_conditions.tr(),
              style: TextStyle(
                color: AppColorUtils.GREEN_APP,
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(
              text: LocaleKeys.agree_with_them.tr(),
            )
          ],
        ),
      ),
    );
  }
}
