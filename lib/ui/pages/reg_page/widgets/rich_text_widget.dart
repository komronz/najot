import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_logger_util.dart';
import 'package:url_launcher/url_launcher.dart';

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
    _onTapGestureRecognizer = TapGestureRecognizer();

    super.initState();
  }

  @override
  void dispose() {
    _onTapGestureRecognizer.dispose();
    super.dispose();
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
              recognizer: _onTapGestureRecognizer
                ..onTap = () async {
                  AppLoggerUtil.e("Hellooo");
                  final Uri url = Uri.parse("https://najot.uz/privacy/");

                  if (await canLaunchUrl(url)) {
                    await launchUrl(
                      url,
                      mode: LaunchMode.externalNonBrowserApplication,
                      webViewConfiguration: WebViewConfiguration(
                        enableJavaScript: true,
                      ),
                    );
                  }
                },
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
