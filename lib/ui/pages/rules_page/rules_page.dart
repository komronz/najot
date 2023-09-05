import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/bloc/rule_page_cubit/rule_page_cubit.dart';
import 'package:najot/data/bloc/rule_page_cubit/rule_page_state.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import '../../widgets/app_error_widget.dart';

class RulesPage extends StatelessWidget {
  const RulesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RulePageCubit()..getFaqList(),
      child:
          BlocBuilder<RulePageCubit, RulePageState>(builder: (context, state) {
        if (state.internetConnection) {
          return Scaffold(
            backgroundColor: AppColorUtils.BACKGROUND,
            appBar: AppWidgets.appBarForFirstPages(title: LocaleKeys.project_rules),
            body: buildBody(state, context),
          );
        }
        return AppErrorWidget(onTap: () async {
          AppWidgets.isLoading(true);
          await context.read<RulePageCubit>().getFaqList();
          AppWidgets.isLoading(false);
        });
      }),
    );
  }

  Widget buildBody(RulePageState state, BuildContext context) {
    if (state.hasLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state.hasError) {
      return Center(
        child: Icon(Icons.error),
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          children: [
            AppWidgets.imageSvg(
              path: AppImageUtils.IMG_RULES,
              width: context.width,
              height: 295.w,
            ).paddingOnly(
              left: 20,
              right: 20,
              top: 30,
            ),
            Column(
              children: List.generate(
                state.list.length,
                (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppWidgets.text(
                      text:
                          "${(index + 1).toString()}. ${state.list[index].title}",
                      color: AppColorUtils.BLACK,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      maxLines: 5
                    ).paddingOnly(top: 20),
                    AppWidgets.text(
                      text: state.list[index].content!,
                      maxLines: 100,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColorUtils.DARK3,
                      height: 1.2,
                    ).paddingOnly(top: 10),
                  ],
                ),
              ),
            ).paddingSymmetric(
              horizontal: 20,
              vertical: 30,
            )
          ],
        ),
      );
    }
  }
}
