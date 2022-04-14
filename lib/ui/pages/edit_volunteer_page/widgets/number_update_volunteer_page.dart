import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/edit_volunteer_bloc/edit_volunteer_bloc.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/user.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/ui/pages/edit_volunteer_page/widgets/number_updating.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_widget/app_disable_text_field.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_widget/number_update_step1_page.dart';
import 'package:najot/ui/widgets/app_text_field.dart';

import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_widgets.dart';

class NumberUpdateVolunteerPage extends StatelessWidget {
  static const String routeName = "/numberUpdateVolunteerPage";

  NumberUpdateVolunteerPage({Key? key}) : super(key: key);
  bool isVisible = true;
  User? user = HiveService.to.getUser();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        context.read<EditVolunteerBloc>().add(EditProfileChangePage(1));
        return Future(()=>false);
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
                title: LocaleKeys.edit_my_profile,
                onTapMenu: () {

                  HomePage.globalKey.currentState!.openDrawer();
                },
                visibleIcon: true,
                onTapIcon: () {
                  context.read<EditVolunteerBloc>().add(EditProfileChangePage(1));
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
                                  title: LocaleKeys.phone_number,
                                ).paddingOnly(
                                  bottom: 23.w,
                                  top: 20.w,
                                  left: 20,
                                  right: 20,
                                ),
                                AppTextField(
                                  isFill: context
                                      .read<EditVolunteerBloc>()
                                      .state
                                      .phoneNumberFill,
                                  initialText: context
                                      .read<EditVolunteerBloc>()
                                      .state
                                      .phoneNumber,
                                  hintText: "+998",
                                  onChanged: (v) {
                                    context
                                        .read<EditVolunteerBloc>()
                                        .add(PhoneChanged(v));
                                  },
                                  title: LocaleKeys.new_phone_number,
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
                                                color: Color(0xFF1F6ADE),
                                              ),
                                              child: AppWidgets.textLocale(
                                                  text: LocaleKeys.send_code,
                                                  textAlign: TextAlign.center,
                                                  color: Color(0xFFFFFFFF),
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )
                                        : NumberUpdating(
                                            state: state,
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
    );
  }
}
