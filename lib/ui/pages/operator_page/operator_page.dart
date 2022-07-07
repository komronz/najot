import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:najot/data/bloc/operator_cubit/operator_cubit.dart';
import 'package:najot/data/config/const/decoration_const.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/sms_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/widgets/app_rounded_button.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import 'widgets/operator_clear_sms_widget.dart';
import 'widgets/operator_sms_widget.dart';
import 'widgets/operator_user_sms_widget.dart';

class OperatorPage extends StatelessWidget {
  const OperatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OperatorCubit()..load(),
      child: BlocBuilder<OperatorCubit, OperatorState>(
        builder: (context, state) => Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: Container(
              decoration: const BoxDecoration(
                color: AppColorUtils.waitColor,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    offset: Offset(0, 2),
                    blurRadius: 10,
                  )
                ],
              ),
              child: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                titleSpacing: 0,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: SvgPicture.asset(
                        AppImageUtils.menu,
                        height: 35.w,
                        width: 35.w,
                      ),
                      onTap: () {
                        HomePage.globalKey.currentState!.openDrawer();
                      },
                    ),
                    Expanded(
                      child: AppWidgets.textLocale(
                        textAlign: TextAlign.center,
                        text: LocaleKeys.write_to_the_operator,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    AppWidgets.iconButton(
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (ctx) => OperatorClearSmsWidget(
                            cubit: context.read<OperatorCubit>(),
                          ),
                        );
                      },
                      iconWidget: AppWidgets.imageSvg(
                        path: AppImageUtils.icBasket,
                        color: AppColorUtils.red,
                      ).paddingAll(6.w),
                      width: 31.w,
                      height: 31.w,
                      borderRadius: 3,
                      color: AppColorUtils.deleteBtn,
                    )
                  ],
                ).paddingSymmetric(horizontal: 20),
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.white,
                  width: context.width,
                  height: context.height,
                  child: buildBody(context, state),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 18.w,
                ),
                height: 150.w,
                decoration: const BoxDecoration(
                  color: AppColorUtils.greenBack,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(11, 191, 144, 0.08),
                      offset: Offset(0, -2),
                      blurRadius: 10,
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 110.w,
                        decoration: BoxDecoration(
                          color: AppColorUtils.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          controller:
                              context.read<OperatorCubit>().textController,
                          expands: true,
                          textAlignVertical: TextAlignVertical.top,
                          maxLines: null,
                          enabled: true,
                          style: GoogleFonts.inter(
                            fontSize: 15.sp,
                          ),
                          decoration: InputDecoration(
                            // border: _border,
                            disabledBorder: DecorationConst.inputBorder,
                            focusedBorder: DecorationConst.inputBorder,
                            enabledBorder: DecorationConst.inputBorder,
                            contentPadding: const EdgeInsets.all(14),
                            hintText: LocaleKeys.send_message.tr(),
                            hintStyle: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColorUtils.gray4,
                            ),
                          ),
                          keyboardType: TextInputType.multiline,
                          onChanged: (v) {
                            // context.read<OperatorCubit>().writeSms(v);
                          },
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppRoundedButton(
                          color: AppColorUtils.smsBtn1,
                          onTap: () {},
                          icon: AppWidgets.imageSvg(
                            path: AppImageUtils.icOtherFile,
                            fit: BoxFit.none,
                          ).paddingAll(5),
                        ),
                        AppRoundedButton(
                          color: AppColorUtils.percentColor,
                          onTap: () {
                            if (context
                                .read<OperatorCubit>()
                                .textController
                                .text
                                .isNotEmpty) {
                              context
                                  .read<OperatorCubit>()
                                  .sendSms(state.sendSmsTxt);
                            }
                          },
                          icon: const Icon(
                            Icons.arrow_forward_rounded,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ).paddingOnly(left: 11),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context, OperatorState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state.hasError) {
      return const Center(child: Icon(Icons.error));
    } else if (!state.hasConnection) {
      return const Center(
        child: Icon(Icons.network_check),
      );
    }
    return buildList(context, state);
  }

  Widget buildList(BuildContext context, OperatorState state) {
    var list = state.list;
    if (list.isEmpty) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppWidgets.imageSvg(
              path: AppImageUtils.icSmsEmpty,
              height: 93.w,
              width: 93.w,
              color: AppColorUtils.gray3,
              fit: BoxFit.fitWidth,
            ).paddingOnly(top: 120.w),
            AppWidgets.text(
              textAlign: TextAlign.center,
              text: LocaleKeys.no_messages_found_yet.tr(),
              fontWeight: FontWeight.w600,
              maxLines: 2,
              fontSize: 18.sp,
              color: AppColorUtils.gray4,
              height: 1.4,
            ).paddingOnly(top: 21).paddingSymmetric(horizontal: 86.w),
          ],
        ),
      );
    }

    return ListView.builder(
      controller: context.read<OperatorCubit>().controller,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        if (list[index].type! == SmsType.operator) {
          return OperatorSmsWidget(
            model: list[index],
          );
        } else {
          return OperatorUserSmsWidget(
            model: list[index],
          );
        }
      },
      itemCount: state.list.length,
    );
  }
}
