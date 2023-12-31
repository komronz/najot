import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profil_update_bloc.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profil_update_state.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/services/hive_service.dart';
import 'package:najot/data/utils/app_utils.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_widget/show_picker_widget.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_widget/user_update_app_radio_button.dart';
import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_text_field.dart';
import '../../../widgets/app_widgets.dart';
import '../../home_page/home_page.dart';

class UserUpdatePage extends StatelessWidget {
  final MyProfileUpdateBloc bloc;
  static const String routeName = "/userUpdatePage";

  UserUpdatePage({
    required this.bloc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<MyProfileUpdateBloc>().add(EditProfileChangePage(1));
        return Future(() => false);
      },
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: BlocBuilder<MyProfileUpdateBloc, MyProfileUpdateState>(
          bloc: bloc,
          builder: (context, state) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                backgroundColor: AppColorUtils.BACKGROUND,
                titleSpacing: 0,
                elevation: 0,
                automaticallyImplyLeading: false,
                title: Container(
                  color: AppColorUtils.WAIT_COLOR,
                  child: AppWidgets.appBarMenu(
                    title: LocaleKeys.edit_my_profile,
                    onTapMenu: () {
                      HomePage.globalKey.currentState!.openDrawer();
                    },
                    visibleIcon: true,
                    onTapIcon: () {
                      context
                          .read<MyProfileUpdateBloc>()
                          .add(EditProfileChangePage(1));
                    },
                    icon: AppImageUtils.REMOVE,
                  ),
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColorUtils.WHITE,
                        ),
                        child: Column(
                          children: [
                            ShowPickerWidget(
                              width: 150.w,
                              height: 150.w,
                              image: AppImageUtils.USERADD,
                              color: AppColorUtils.WHITE,
                              imageSelect: (v) {
                                bloc.add(SaveImagePickers(v));
                              },
                              imageFile: state.userImgPath,
                            ).paddingOnly(top: 15.w),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppTextField(
                                    isFill: bloc.state.firstName.isNotEmpty,
                                    initialText: bloc.state.firstName,
                                    hintText: "(abdumalik)",
                                    onChanged: (v) {
                                      bloc.add(FirstNameChanged(v));
                                    },
                                    title: LocaleKeys.name.tr(),
                                  ).paddingOnly(bottom: 23.h),
                                  AppTextField(
                                    isFill: bloc.state.lastName.isNotEmpty,
                                    initialText: bloc.state.lastName,
                                    hintText: "(sapoqulov)",
                                    onChanged: (v) {
                                      bloc.add(LastNameChanged(v));
                                    },
                                    title: LocaleKeys.surname.tr(),
                                  ).paddingOnly(bottom: 24.h),
                                  bloc.state.gender != null
                                      ? Row(
                                          children: [
                                            UserUpdateAppRadioButton(
                                              onChanged: (v) {
                                                var gender;
                                                if (v == 1) {
                                                  gender =
                                                      Gender.MAN.toString();
                                                } else if (v == 2) {
                                                  gender =
                                                      Gender.WOMAN.toString();
                                                }

                                                bloc.add(
                                                  GenderChanged(
                                                    gender.toString(),
                                                  ),
                                                );
                                              },
                                              initial: state.gender ?? "Erkak",
                                            ).paddingOnly(top: 20),
                                          ],
                                        )
                                      : SizedBox(),
                                ],
                              ),
                            ).paddingOnly(bottom: 24.h),
                            InkWell(
                              onTap: () {
                                bloc.add(SaveIn());
                                /// To let know if user changed
                                /// then get api request only once
                                HiveService.to.userChanged(true);
                                context
                                    .read<MyProfileUpdateBloc>()
                                    .add(EditProfileChangePage(1));
                              },
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(
                                  top: 10,
                                  bottom: 15,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColorUtils.PERCENT_COLOR,
                                ),
                                child: AppWidgets.textLocale(
                                  text: LocaleKeys.save,
                                  textAlign: TextAlign.center,
                                  color: AppColorUtils.WHITE,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ).paddingOnly(
                          bottom: 15.w,
                          right: 20,
                          left: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
