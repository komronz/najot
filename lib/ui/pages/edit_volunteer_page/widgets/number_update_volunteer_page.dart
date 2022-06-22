import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:najot/data/bloc/edit_volunteer_bloc/edit_volunteer_bloc.dart';
import 'package:najot/data/config/const/decoration_const.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/user.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/ui/pages/edit_volunteer_page/widgets/number_updating.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_widget/app_disable_text_field.dart';

import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_widgets.dart';

class NumberUpdateVolunteerPage extends StatefulWidget {
  static const String routeName = "/numberUpdateVolunteerPage";

  const NumberUpdateVolunteerPage({Key? key}) : super(key: key);

  @override
  State<NumberUpdateVolunteerPage> createState() =>
      _NumberUpdateVolunteerPageState();
}

class _NumberUpdateVolunteerPageState extends State<NumberUpdateVolunteerPage> {
  final bool isVisible = true;

  final User? user = HiveService.to.getUser();

  final maskFormatter = MaskTextInputFormatter(mask: '## ### ## ##');

  final TextEditingController numberController = TextEditingController();

  @override
  void dispose() {
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext con) {
    Size size = MediaQuery.of(con).size;
    return WillPopScope(
      onWillPop: () {
        con.read<EditVolunteerBloc>().add(const EditProfileChangePage(1));
        return Future(() => false);
      },
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: BlocProvider(
          create: (BuildContext context) =>
              EditVolunteerBloc()..add(const MyProfileLoad()),
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: AppColorUtils.background,
                titleSpacing: 0,
                elevation: 0,
                automaticallyImplyLeading: false,
                title: Container(
                  color: AppColorUtils.background,
                  child: AppWidgets.appBarMenu(
                    title: LocaleKeys.edit_my_profile.tr(),
                    onTapMenu: () {
                      HomePage.globalKey.currentState!.openDrawer();
                    },
                    visibleIcon: true,
                    onTapIcon: () {
                      con
                          .read<EditVolunteerBloc>()
                          .add(const EditProfileChangePage(1));
                    },
                    icon: AppImageUtils.remove,
                  ),
                ),
              ),
              backgroundColor: AppColorUtils.white,
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
                            color: AppColorUtils.white,
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
                                    color: AppColorUtils.dark4,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                  ).paddingOnly(
                                    left: 20.w,
                                    bottom: 8.w,
                                  ),
                                  TextFormField(
                                    style: const TextStyle(
                                        color: AppColorUtils.black),
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
                                      return null;
                                    },
                                    decoration:
                                        DecorationConst().inputDecoration(
                                      prefixIcon: Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        width: size.width * 0.2,
                                        child: Center(
                                          child: AppWidgets.text(
                                            text: "(+998)",
                                            fontSize: 16,
                                            color: AppColorUtils.dark6,
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
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
                                                padding: const EdgeInsets.only(
                                                    top: 10,
                                                    bottom: 13,
                                                    right: 10,
                                                    left: 10),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  color:
                                                      AppColorUtils.blueButton,
                                                ),
                                                child: AppWidgets.textLocale(
                                                    text: LocaleKeys.send_code,
                                                    textAlign: TextAlign.center,
                                                    color: AppColorUtils.white,
                                                    fontSize: 15.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
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
