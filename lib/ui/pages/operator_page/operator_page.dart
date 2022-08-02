import 'dart:async';

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
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_widget/show_picker_widget.dart';
import 'package:najot/ui/pages/operator_page/widgets/operator_clear_sms_widget.dart';
import 'package:najot/ui/widgets/app_rounded_button.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import 'widgets/operator_sms_widget.dart';
import 'widgets/operator_user_sms_widget.dart';

class OperatorPage extends StatefulWidget {
  static const String routeName = "/operatorPage";

  OperatorPage({Key? key}) : super(key: key);

  @override
  State<OperatorPage> createState() => _OperatorPageState();
}

class _OperatorPageState extends State<OperatorPage> {
  OperatorCubit operatorCubit = OperatorCubit();

  TextEditingController content = TextEditingController();
  late Timer? timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    operatorCubit.load();
    timer= Timer.periodic(Duration(seconds: 4), (timer) {
      operatorCubit.loads();
    });
  }

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OperatorCubit, OperatorState>(
      bloc: operatorCubit,
      builder: (context, state) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Container(
            decoration: BoxDecoration(
              color: AppColorUtils.WAIT_COLOR,
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
                      AppImageUtils.MENU,
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
                          cubit: operatorCubit,

                        ),
                      );
                    },
                    iconWidget: AppWidgets.imageSvg(
                      path: AppImageUtils.IC_BASKET,
                      color: AppColorUtils.RED,
                    ).paddingAll(6.w),
                    width: 31.w,
                    height: 31.w,
                    borderRadius: 3,
                    color: AppColorUtils.DELETE_BTN,
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
              decoration: BoxDecoration(
                color: AppColorUtils.GREEN_BACK,
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
                        color: AppColorUtils.WHITE,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: operatorCubit.textController,
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                        maxLines: null,
                        enabled: true,
                        style: GoogleFonts.inter(
                          fontSize: 15.sp,
                        ),
                        decoration: InputDecoration(
                          // border: _border,
                          disabledBorder: DecorationConst.INPUT_BORDER,
                          focusedBorder: DecorationConst.INPUT_BORDER,
                          enabledBorder: DecorationConst.INPUT_BORDER,
                          contentPadding: EdgeInsets.all(14),
                          hintText: LocaleKeys.send_message.tr(),
                          hintStyle: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColorUtils.GRAY_4,
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        onChanged: (v) {
                          operatorCubit.writeSms(v);
                        },
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShowPickerWidget(
                        width: 45.w,
                        height: 45.w,
                        image: AppImageUtils.IC_OTHER_FILE,
                        color: AppColorUtils.SMS_BTN1,
                        imageSelect: (v) {
                          operatorCubit.saveImage(v);
                        },
                        imageFile: state.userImgPath,
                        padding: 13.w,
                      ).paddingAll(5.w),
                      AppRoundedButton(
                        color: AppColorUtils.PERCENT_COLOR,
                        height: 45.w,
                        onTap: () {
                          if (operatorCubit
                              .textController
                              .text
                              .isNotEmpty) {
                            operatorCubit.sendSms(
                              state.userImgPath,
                              state.sendSmsTxt,
                            );
                          }
                        },
                        icon: Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                        ),
                      ).paddingOnly(bottom: 5.w),
                    ],
                  ).paddingOnly(left: 11),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context, OperatorState state) {
    var list = state.list;
    if (state.isLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (state.hasError) {
      return Center(child: Icon(Icons.error));
    } else if (!state.hasConnection) {
      return Center(
        child: Icon(Icons.network_check),
      );
    }
    if (list!.isEmpty) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppWidgets.imageSvg(
              path: AppImageUtils.IC_SMS_EMPTY,
              height: 93.w,
              width: 93.w,
              color: AppColorUtils.GRAY_3,
              fit: BoxFit.fitWidth,
            ).paddingOnly(top: 120.w),
            AppWidgets.text(
              textAlign: TextAlign.center,
              text: LocaleKeys.no_messages_found_yet.tr(),
              fontWeight: FontWeight.w600,
              maxLines: 2,
              fontSize: 18.sp,
              color: AppColorUtils.GRAY_4,
              height: 1.4,
            ).paddingOnly(top: 21).paddingSymmetric(horizontal: 86.w),
            // TODO: Warning
          ],
        ),
      );
    }

    return ListView.builder(
      controller: operatorCubit.controller,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        if (list[index]!.isClient == false) {
          return OperatorSmsWidget(
            model: list[index]!,
          );
        } else {
          return OperatorUserSmsWidget(
            model: list[index]!,
          );
        }
      },
      itemCount: state.list!.length,
    );
  }
}
