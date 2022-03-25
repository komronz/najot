import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import '../../../data/utils/app_color_utils.dart';
import '../../../data/utils/app_image_utils.dart';
import '../../widgets/app_widgets.dart';

class SmsWithOperatorPage extends StatelessWidget {
  static const String routeName = "/smsWithOperatorPage";

  const SmsWithOperatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              color: Color(0xFFF6FCFA),
              child: AppWidgets.appBarMenu(
                title: "write_operator",
                onTapMenu: () {},
                visibleIcon: true,
                onTapIcon: () {},
                icon: AppImageUtils.DELETE,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColorUtils.WHITE,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: SvgPicture.asset(AppImageUtils.MESSAGE),
                    ).paddingOnly(top: 118.h),
                    Container(
                      child: AppWidgets.textLocale(
                        text: "Hozircha hech qanday xabar topilmadi",
                        textAlign: TextAlign.center,
                        color: Color(0xFFBCBEC0),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        maxLines: 2,
                      ),
                    ).paddingOnly(
                      right: 86,
                      left: 86,
                      top: 18,
                      bottom: 280,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 3, right: 3),
                      padding: EdgeInsets.only(
                        left: 17,
                        right: 17,
                        top: 10,
                        bottom: 10,
                      ),
                      color: Color(0xFFF9FEFC),
                      child: Row(
                        children: [
                          Container(
                            height: 115.h,
                            width: 279.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Color(0xFF79B4A8), width: 1),
                              color: Colors.white,
                            ),
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "send_message",
                                  border: InputBorder.none
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: 19,
                                  left: 11,
                                  bottom: 18,
                                ),
                                height: 46.h,
                                width: 46.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color(0xFFEAEAEA),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 11),
                                height: 46.h,
                                width: 46.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color(0xFF0BBF90),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
