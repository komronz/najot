import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/bloc/faq_cubit/faq_cubit.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/faq_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/data/utils/app_logger_util.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

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
              SvgPicture.asset(
                AppImageUtils.NOTIFICATION,
                height: 35.w,
                width: 35.w,
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
                horizontal: 20,vertical: 30,
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

class FaqItemWidget extends StatelessWidget {
  final FaqModel faqModel;
  final int index;

  const FaqItemWidget({
    required this.faqModel,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: AppWidgets.text(
                  text: faqModel.title!,
                  maxLines: 10,
                  color: AppColorUtils.DARK2,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                ),
                width: 265.w,
              ),
              GestureDetector(
                child: Transform.rotate(
                  angle: faqModel.isOpen! ? 45 * pi / 180 : 0,
                  child: AppWidgets.imageSvg(path: AppImageUtils.IC_FAQ_OPEN),
                ),
                onTap: () {
                  AppLoggerUtil.i("$index  ${faqModel.isOpen}");
                  context.read<FaqCubit>().openFaqItem(index, faqModel.isOpen!);
                },
              )
            ],
          ),
          AnimatedContainer(
            height: faqModel.isOpen! ? null : 0,
            duration: Duration(milliseconds: 200),
            child: SizedBox(
              width: 280.w,
              child: AppWidgets.text(
                text: faqModel.text!,
                maxLines: 30,
                color: AppColorUtils.DARK3,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ).paddingOnly(top: 20),
            ),
          )
        ],
      ).paddingOnly(
        top: 32.w,
        left: 20.w,
        right: 20.w,
      ),
    );
  }
}
