import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:najot/data/bloc/edit_volunteer_bloc/edit_volunteer_bloc.dart';
import 'package:najot/data/config/const/decoration_const.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/auth_model/user.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/ui/pages/edit_volunteer_page/widgets/number_updating.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_widget/app_disable_text_field.dart';
import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_widgets.dart';

class NumberUpdateVolunteerPage extends StatelessWidget {
  static const String routeName = "/numberUpdateVolunteerPage";

  NumberUpdateVolunteerPage({Key? key}) : super(key: key);
  bool isVisible = true;
  User? user = HiveService.to.getUser();
  final maskFormatter = MaskTextInputFormatter(mask: '## ### ## ##');
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext con) {
    Size size = MediaQuery.of(con).size;
    return WillPopScope(
      onWillPop: () {
        con.read<EditVolunteerBloc>().add(EditProfileChangePage(1));
        return Future(() => false);
      },
      child: GestureDetector(
        onTap: (){
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: BlocProvider(
          create: (BuildContext context) =>
              EditVolunteerBloc()..add(MyProfileLoad()),
          child: SafeArea(
            child: Scaffold(
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
                      con.read<EditVolunteerBloc>().add(EditProfileChangePage(1));
                    },
                    icon: AppImageUtils.REMOVE,
                  ),
                ),
              ),
              backgroundColor: AppColorUtils.WHITE,
              body: BlocBuilder<EditVolunteerBloc, EditVolunteerState>(
                  builder: (context, state) {
                return Column(
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
                                    hintText: user == null
                                        ? user.toString()
                                        : user!.phone.toString(),
                                    onChanged: (v) {},
                                    title: LocaleKeys.phone_number.tr(),
                                  ).paddingOnly(
                                    bottom: 23.w,
                                    top: 20.w,
                                    left: 20,
                                    right: 20,
                                  ),
                                  AppWidgets.textLocale(
                                    text: LocaleKeys.new_phone_number,
                                    color: AppColorUtils.DARK_4,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ).paddingOnly(
                                    left: 20.w,
                                    bottom: 8.w,
                                  ),
                                  TextFormField(
                                    style: TextStyle(color: AppColorUtils.BLACK),
                                    inputFormatters: [maskFormatter],
                                    controller: numberController,
                                    onChanged: (v) {
                                      context
                                          .read<EditVolunteerBloc>()
                                          .add(PhoneChanged(v));
                                    },
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
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
                                  ).paddingOnly(
                                    bottom: 23.w,
                                    left: 20.w,
                                    right: 20.w,
                                  ),

                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 8.w),
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<EditVolunteerBloc>()
                                            .add(SendCode());
                                      },
                                      child: context
                                              .read<EditVolunteerBloc>()
                                              .state
                                              .isVisible
                                          ? Visibility(
                                              visible: context
                                                  .read<EditVolunteerBloc>()
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
                                            )
                                          : NumberUpdating(
                                              state: state,
                                              con: con,
                                            ),
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
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
