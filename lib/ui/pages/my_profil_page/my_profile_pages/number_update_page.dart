import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profil_update_bloc.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profil_update_state.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/auth_model/user.dart';
import 'package:najot/data/services/hive_service.dart';
import '../../../../data/bloc/my_profile_bloc/my_profil_update_bloc.dart';
import '../../../../data/config/const/decoration_const.dart';
import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_widgets.dart';
import '../../home_page/home_page.dart';
import '../my_profile_widget/app_disable_text_field.dart';
import '../my_profile_widget/number_updating.dart';

class NumberUpdatePage extends StatefulWidget {
  static const String routeName = "/numberUpdatePage";
  MyProfileUpdateBloc bloc;
  NumberUpdatePage({required this.bloc}) ;

  @override
  State<NumberUpdatePage> createState() => _NumberUpdatePageState();
}

class _NumberUpdatePageState extends State<NumberUpdatePage> {
  bool isVisible = true;

  User? user = HiveService.to.getUser();

  final maskFormatter = MaskTextInputFormatter(mask: '## ### ## ##');

  final TextEditingController numberController = TextEditingController();

  bool hasError = false;

  @override
  Widget build(BuildContext con) {
    Size size = MediaQuery.of(con).size;
    return SafeArea(
      child: BlocBuilder<MyProfileUpdateBloc, MyProfileUpdateState>(
        bloc: widget.bloc,
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColorUtils.BACKGROUND,
                titleSpacing: 0,
                elevation: 0,
                automaticallyImplyLeading: false,
                title: Container(
                  color: AppColorUtils.BACKGROUND,
                  child: AppWidgets.appBarMenu(
                    title: LocaleKeys.edit_my_profile.tr(),
                    onTapMenu: () {
                      HomePage.globalKey.currentState!.openDrawer();
                    },
                    visibleIcon: true,
                    onTapIcon: () {
                      widget.bloc.add(EditProfileChangePage(1));
                    },
                    icon: AppImageUtils.REMOVE,
                  ),
                ),
              ),
              backgroundColor: AppColorUtils.WHITE,
              body: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        width: 375.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColorUtils.WHITE,
                        ),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppDisableTextField(
                                  isFill: false,
                                  hintText: state.phone,
                                  onChanged: (v) {},
                                  title: LocaleKeys.phone_number,
                                ).paddingOnly(
                                  bottom: 23.h,
                                  top: 20.h,
                                ),
                                AppWidgets.textLocale(
                                  text: LocaleKeys.new_phone_number,
                                  color: AppColorUtils.DARK_4,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ).paddingOnly(
                                  bottom: 8.w,
                                ),
                                TextFormField(
                                  style: TextStyle(color: AppColorUtils.BLACK),
                                  inputFormatters: [maskFormatter],
                                  controller: numberController,
                                  onChanged: (v) {
                                    widget.bloc
                                        .add(PhoneChanged(v));
                                  },
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    return null;

                                    // return AppValidator.validateNumber(
                                    //     value!);
                                  },
                                  decoration: DecorationConst().inputDecoration(
                                    prefixIcon: Container(
                                      padding: EdgeInsets.only(left: 10),
                                      width: size.width * 0.2,
                                      child: Center(
                                        child: AppWidgets.text(
                                          text: "(+998)",
                                          fontSize: 16,
                                          color: AppColorUtils.DARK_6,
                                        ),
                                      ),
                                    ),
                                  ),
                                  cursorColor: Colors.black,
                                ),
                                hasError
                                    ? AppWidgets.starTextWidget(
                                    text: "Telefon raqamni to'g'ri kiriting",
                                    color: AppColorUtils.RED)
                                    : SizedBox(),
                                SizedBox(
                                  height: 20.w,
                                )
                              ],
                            ).paddingOnly(
                              left: 20.w,
                              right: 20.w,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 8.h),
                                  widget.bloc
                                      .state
                                      .isVisible
                                      ? InkWell(
                                    onTap: () {
                                      if(numberController.text.length==12){
                                        setState((){
                                          hasError=false;
                                        });
                                        widget.bloc
                                            .add(SendCode(
                                            numberController.text));
                                      }else{
                                        setState((){
                                          hasError=true;
                                        });
                                      }

                                    },
                                    child: Visibility(
                                      visible: widget.bloc
                                          .state
                                          .isVisible,
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 10,
                                            bottom: 13,
                                            right: 10,
                                            left: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(12),
                                          color: AppColorUtils.BLUE_BUTTON,
                                        ),
                                        child: AppWidgets.textLocale(
                                            text: LocaleKeys.send_code,
                                            textAlign: TextAlign.center,
                                            color: AppColorUtils.WHITE,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  )
                                      : NumberUpdating(
                                    state: state,
                                    number: numberController.text,
                                    confirmation: (v) {
                                      if (numberController.text.length ==
                                          12) {
                                        setState((){
                                          hasError=false;
                                        });
                                        widget.bloc
                                            .add(ChangeNumber(
                                          int.parse(v),
                                          numberController.text,
                                        ));
                                      } else {
                                        setState(() {
                                          hasError = true;
                                        });
                                      }
                                    },
                                    resend: () {
                                      if (numberController.text.length == 12) {
                                        setState((){
                                          hasError=false;
                                        });
                                        widget.bloc
                                            .add(SendCode(
                                          numberController.text,
                                        ));
                                      } else {
                                        setState(() {
                                          hasError = true;
                                        });
                                      }
                                    },
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
              )
          );
        },
      ),
    );
  }
}
