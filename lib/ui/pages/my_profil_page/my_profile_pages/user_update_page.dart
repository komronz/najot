import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profil_update_bloc.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profil_update_state.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
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
        onWillPop: (){
          context.read<MyProfileUpdateBloc>().add(EditProfileChangePage(1));
          return Future(()=>false);
        },
        child: GestureDetector(
          onTap: (){
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: BlocConsumer<MyProfileUpdateBloc,MyProfileUpdateState>(
            bloc: bloc,
            listener: (context, state) {},
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
                          context.read<MyProfileUpdateBloc>().add(EditProfileChangePage(1));
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
                                    ShowPickerWidget(),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          AppTextField(
                                            isFill: bloc.state.name.isNotEmpty,
                                            initialText: bloc.state.name,
                                            hintText: "(abdumalik)",
                                            onChanged: (v) {
                                              bloc.add(FirstNameChanged(v));
                                            },
                                            title: LocaleKeys.name.tr(),
                                          ).paddingOnly(bottom: 23.h),
                                          AppTextField(
                                            isFill: bloc.state.sureName.isNotEmpty,
                                            initialText: bloc.state.sureName,
                                            hintText: "(sapoqulov)",
                                            onChanged: (v) {
                                              bloc.add(LastNameChanged(v));
                                            },
                                            title: LocaleKeys.surname.tr(),
                                          ).paddingOnly(bottom: 24.h),
                                          Row(
                                            children: [
                                              UserUpdateAppRadioButton(
                                                onChanged: (v) {
                                                  var gender =
                                                  v == 1 ? Gender.MAN : Gender.WOMAN;
                                                  bloc.add(GenderChanged(gender));
                                                },
                                              ).paddingOnly(top: 20),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ).paddingOnly(bottom: 24.h),
                                    InkWell(
                                      onTap: () {
                                        bloc.add(SaveIn());
                                        context.read<MyProfileUpdateBloc>().add(EditProfileChangePage(1));
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
                                ).paddingOnly(right: 20, left: 20),
                              ),
                            ),
                          ),
                    ],
                  ),
                );
              }),
        ),
    );
  }
}
