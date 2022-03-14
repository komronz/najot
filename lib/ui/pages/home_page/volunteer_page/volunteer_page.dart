import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class VolunteerPage extends StatelessWidget {
  const VolunteerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: 80,
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: SvgPicture.asset(AppImageUtils.BACK),
                onTap: () {},
              ),
              AppWidgets.textLocale(
                text: "Volontyorlik",
                fontSize: 26.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
