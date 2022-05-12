import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/bloc/faq_cubit/faq_cubit.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/faq_page/widgets/faq_item_widget.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../data/services/navigator_service.dart';
import '../notification_page/notification_page.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FaqCubit()..getFaqList(),
      child: Scaffold(
        backgroundColor: AppColorUtils.BACKGROUND,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          titleSpacing: 0,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: SvgPicture.asset(
                  AppImageUtils.MENU,
                  height: 35.w,
                  width: 35.w,
                ),
                onTap: () {
                  HomePage.globalKey.currentState!.openDrawer();
                },
              ),
              AppWidgets.textLocale(
                text: "FAQ",
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
              InkWell(
                onTap: () {
                  NavigatorService.to.pushNamed(
                    NotificationPage.routeName,
                  );
                },
                child: SvgPicture.asset(
                  AppImageUtils.NOTIFICATION,
                  height: 35.w,
                  width: 35.w,
                ),
              )
            ],
          ).paddingSymmetric(horizontal: 20),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppWidgets.imageSvg(
                path: AppImageUtils.FAQ_IMG,
                width: context.width,
                height: 336.w,
              ).paddingSymmetric(
                horizontal: 20,
                vertical: 30,
              ),
              BlocBuilder<FaqCubit, FaqState>(
                builder: (context, state) => buildBody(state),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBody(FaqState state) {
    if (state.hasLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state.hasError) {
      return Center(
        child: Icon(Icons.error),
      );
    } else {
      return Container(
        child: Column(
          children: List.generate(
            state.list.length,
            (index) => FaqItemWidget(
              faqModel: state.list[index],
              index: index,
            ),
          ),
        ).paddingOnly(bottom: 30),
      );
    }
  }
}
