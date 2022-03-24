import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profil_update_bloc.dart';
import 'package:najot/data/bloc/my_profile_bloc/my_profil_update_state.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_widget/show_picker_widget.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_widget/user_update_app_radio_button.dart';

import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/services/navigator_service.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_text_field.dart';
import '../../../widgets/app_widgets.dart';
import '../my_profile_page.dart';

class UserUpdatePage extends StatefulWidget {
  static const String routeName = "/userUpdatePage";
  TextEditingController nameController=TextEditingController();
  TextEditingController surNameController=TextEditingController();
  UserUpdatePage({Key? key}) : super(key: key);
  @override
  _UserUpdatePageState createState() => _UserUpdatePageState();
}
class _UserUpdatePageState extends State<UserUpdatePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
      create: (context) => MyProfileUpdateBloc(),
      child: BlocBuilder<MyProfileUpdateBloc, MyProfileUpdateState>(
        builder: (context, state) => Column(
          children: [
            Container(
              color: Color(0xFFF6FCFA),
              child: AppWidgets.appBarMenu(
                title: LocaleKeys.edit_my_profile,
                onTapMenu: () {},
                visibleIcon: true,
                onTapIcon: () {
                  Navigator.of(context).pop();
                },
                icon: AppImageUtils.REMOVE,
              ),
            ),
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
                              isFill: context.read<MyProfileUpdateBloc>().state.nameFill,
                              hintText: "(abdumalik)",
                              onChanged: (v) {
                                context.read<MyProfileUpdateBloc>().add(FirstNameChanged(v));
                              },
                              title: LocaleKeys.name,
                            ).paddingOnly(bottom: 23.h),
                            AppTextField(
                              isFill: context.read<MyProfileUpdateBloc>().state.sureNameFill,
                              hintText: "(sapoqulov)",
                              onChanged: (v) {
                                context.read<MyProfileUpdateBloc>().add(LastNameChanged(v));
                              },
                               title: LocaleKeys.surname,
                            ).paddingOnly(bottom: 24.h),
                            Row(
                              children: [
                                UserUpdateAppRadioButton(
                                  onChanged: (v) {
                                    var gender =
                                        v == 1 ? Gender.MAN : Gender.WOMAN;
                                    context
                                        .read<MyProfileUpdateBloc>()
                                        .add(GenderChanged(gender));
                                  },
                                ).paddingOnly(top: 20),
                              ],
                            ).paddingOnly(left: 20,right: 20),
                          ],
                        ),
                      ).paddingOnly(bottom: 24.h),
                      InkWell(
                        onTap: () {
                            context.read<MyProfileUpdateBloc>().add(SaveIn());
                             NavigatorService.to.pushNamed(MyProfilePage.routeName);

                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(
                            top: 10,
                            bottom: 15,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xFF0BBF90),
                          ),
                          child: AppWidgets.textLocale(
                            text: LocaleKeys.save,
                            textAlign: TextAlign.center,
                            color: Color(0xFFFFFFFF),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ).paddingOnly(right: 20, left: 20),
                      ),
                    ],
                  ),
                  ),
                ),
              ),
            ],
          ),
          ),
        ),
      );
  }
}
