import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/bloc/faq_cubit/faq_cubit.dart';
import 'package:najot/data/bloc/faq_cubit/faq_state.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/faq_page/widgets/faq_item_widget.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../data/services/navigator_service.dart';
import '../../widgets/app_error_widget.dart';
import '../notification_page/notification_page.dart';

class FaqPage extends StatelessWidget {
  FaqPage({Key? key}) : super(key: key);
  FaqCubit cubit = FaqCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<FaqCubit, FaqState>(
          bloc: cubit..getFaqList(),
          builder: (context, state) {
            if (state.internetConnection) {
              if (state.hasLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Scaffold(
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
                        
                        SizedBox(
                          width: 35.w,
                          height: 35.w,
                        ),

                        /// Change later
                        ///
                        // InkWell(
                        //   onTap: () {
                        //     NavigatorService.to.pushNamed(
                        //       NotificationPage.routeName,
                        //     );
                        //   },
                        //   child: SvgPicture.asset(
                        //     AppImageUtils.NOTIFICATION,
                        //     height: 35.w,
                        //     width: 35.w,
                        //   ),
                        // )
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
                        buildBody(state)
                      ],
                    ),
                  ),
                );
              }
            } else {
              return AppErrorWidget(onTap: () async {
                AppWidgets.isLoading(true);
                await context.read<FaqCubit>().getFaqList();
                AppWidgets.isLoading(false);
              });
            }
          }),
    );
  }

  Widget buildBody(FaqState state) {
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
