import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/data/bloc/faq_cubit/faq_cubit.dart';
import '/data/bloc/faq_cubit/faq_state.dart';
import '/data/extensions/context_extension.dart';
import '/data/extensions/widget_padding_extension.dart';
import '/data/utils/app_color_utils.dart';
import '/data/utils/app_image_utils.dart';
import '/ui/pages/faq_page/widgets/faq_item_widget.dart';
import '/ui/widgets/app_widgets.dart';

import '../../widgets/app_error_widget.dart';


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
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Scaffold(
                  backgroundColor: AppColorUtils.BACKGROUND,
                  appBar: AppWidgets.appBarForFirstPages(title: 'FAQ'),
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
