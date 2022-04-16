import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/app.dart';
import 'package:najot/data/bloc/edit_volunteer_bloc/edit_volunteer_bloc.dart';
import 'package:najot/data/bloc/reg_volunteer_bloc/reg_volunteer_bloc.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/edit_volunteer_page/widgets/number_update_volunteer_page.dart';
import 'package:najot/ui/pages/edit_volunteer_page/widgets/user_update_volunteer_page.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_pages/user_update_page.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_widget/app_disable_text_field.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_widget/my_profile_radio_button.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_widget/show_picker_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class EditVolunteerPage extends StatelessWidget {
  const EditVolunteerPage({Key? key}) : super(key: key);

  static const String routeName = "/editVolunteerPage";

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (context) => EditVolunteerBloc()..add(MyProfileLoad()),
    child:  BlocConsumer<EditVolunteerBloc, EditVolunteerState>(
      listener: (context, state) {},
      builder: (context, state) {
           if(state.changePage==1){
             return Scaffold(
               appBar: AppBar(
                 backgroundColor: AppColorUtils.BACKGROUND,
                 titleSpacing: 0,
                 elevation: 0,
                 automaticallyImplyLeading: false,
                 title: Container(
                   color: Color(0xFFF6FCFA),
                   child: AppWidgets.appBarMenu(
                     title: LocaleKeys.my_profile,
                     onTapMenu: () {
                       HomePage.globalKey.currentState!.openDrawer();
                     },
                     visibleIcon: true,
                     onTapIcon: () {
                       context.read<EditVolunteerBloc>().add(EditProfileChangePage(2));

                     },
                     icon: AppImageUtils.EDIT,
                   ),
                 ),
               ),
               body: SingleChildScrollView(
                 child: Container(
                   padding: EdgeInsets.only(left: 19, right: 20,),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(5),
                     color: AppColorUtils.WHITE,
                   ),
                   child: Column(
                     children: [

                       ShowPickerWidget(),
                       Container (
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             AppWidgets.textLocale(
                               text: LocaleKeys.degree,
                               textAlign: TextAlign.center,
                               fontSize: 12.sp,
                               color: Color(0xFFBCBEC0),
                               fontWeight: FontWeight.w400,
                             ),
                             Container(
                               padding: EdgeInsets.only(
                                 top: 1,
                                 bottom: 1,
                                 left: 5.w,
                               ),
                               child: InkWell(
                                 onTap: () {},
                                 child: SvgPicture.asset(
                                   AppImageUtils.FAQ,
                                   color: Color(0xFF007A58),
                                 ),
                               ),
                             ),
                           ],
                         ),
                       ).paddingOnly(bottom: 6.h),
                       Container(
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             SvgPicture.asset(AppImageUtils.HANDS),
                             Container(
                               margin: EdgeInsets.only(left: 5),
                               child: AppWidgets.textLocale(
                                   text: "Volontyor",
                                   color: AppColorUtils.TEXT_GREEN,
                                   fontSize: 16.sp,
                                   fontWeight: FontWeight.w600),
                             )
                           ],
                         ),
                       ).paddingOnly(bottom: 24.w),
                       Container(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Container(
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   AppWidgets.textLocale(
                                       text: LocaleKeys.phone_number,
                                       color: Color(0xFF6D6E71),
                                       fontSize: 13.sp,
                                       fontWeight: FontWeight.w400)
                                       .paddingOnly(bottom: 8.w),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Container(
                                         width: 283.w,
                                         padding: EdgeInsets.only(left: 18),
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(12),
                                           color: Color(0xFFEDFCF9),
                                           border: Border.all(
                                             width: 1,
                                             color: Color(0xFFCEE1DD),
                                           ),
                                         ),
                                         child: TextField(
                                           decoration: InputDecoration(
                                             enabled: false,
                                             hintText: state.phoneNumber,
                                             border: InputBorder.none,
                                             hintStyle: TextStyle(
                                               color: AppColorUtils.REG_TEXT,
                                               fontSize: 16.sp,
                                               fontWeight: FontWeight.w500,
                                             ),
                                           ),
                                         ),
                                       ),
                                       InkWell(
                                         onTap: () {

                                           context.read<EditVolunteerBloc>().add(EditProfileChangePage(3));
                                         },
                                         child: Container(
                                           height: 33.w,
                                           width: 33.w,
                                           child: AppWidgets.imageSvg(
                                             path: AppImageUtils.EDIT,
                                           ),
                                         ),
                                       ),
                                     ],
                                   ),
                                 ],
                               ),
                             ),
                             Divider(
                               thickness: 2,
                               color: Color(0xFFE6EDEC),
                             ).paddingSymmetric(vertical: 24.w),
                             AppDisableTextField(
                               isFill: false,
                               hintText:
                               context.read<EditVolunteerBloc>().state.name,
                               onChanged: (v) {},
                               title: LocaleKeys.name,
                             ).paddingOnly(bottom: 23.w),
                             AppDisableTextField(
                               isFill: false,
                               hintText: context
                                   .read<EditVolunteerBloc>()
                                   .state
                                   .sureName,
                               onChanged: (v) {},
                               title: LocaleKeys.surname,
                             ).paddingOnly(bottom: 23.w),
                             AppWidgets.textLocale(
                               text: LocaleKeys.gender,
                               color: AppColorUtils.DARK_4,
                               fontSize: 14.sp,
                               fontWeight: FontWeight.w400,
                             ).paddingOnly(bottom: 10.w),
                             Row(
                               children: [
                                 Container(
                                   height: 48.h,
                                   decoration: BoxDecoration(
                                     color: AppColorUtils.REG_BACK,
                                     borderRadius: BorderRadius.circular(12),
                                     border: Border.all(
                                       color: AppColorUtils.BORDER,
                                       width: 1,
                                     ),
                                   ),
                                   child: Row(
                                     children: [
                                       Radio(
                                         activeColor:  AppColorUtils.BORDER,
                                         value: 1,
                                         groupValue: 1,
                                         onChanged: (v) {},
                                       ),
                                       AppWidgets.textLocale(
                                         text: LocaleKeys.man,
                                         color: AppColorUtils.REG_TEXT,
                                         fontSize: 16.sp,
                                         fontWeight: FontWeight.w500,
                                       ),
                                     ],
                                   ).paddingOnly(right: 18.w),
                                 ),
                                 Container(
                                   height: 48.h,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(12),
                                     color: AppColorUtils.REG_BACK,
                                     border: Border.all(
                                       color: AppColorUtils.BORDER,
                                       width: 1,
                                     ),
                                   ),
                                   child: Row(
                                     children: [
                                       Radio(
                                         fillColor: MaterialStateColor.resolveWith((states) =>  AppColorUtils.BORDER),
                                         value: 2,
                                         groupValue: 0,
                                         onChanged: (v) {},
                                       ),
                                       AppWidgets.textLocale(
                                         text: LocaleKeys.woman,
                                         color: AppColorUtils.REG_TEXT,
                                         fontSize: 16.sp,
                                         fontWeight: FontWeight.w500,
                                       ),
                                     ],
                                   ).paddingOnly(right: 18.w),
                                 ).paddingOnly(left: 20),

                               ],
                             ).paddingOnly(bottom: 23.w),
                             AppDisableTextField(
                               isFill: false,
                               hintText: "25.08.2022",
                               onChanged: (v) {},
                               title: "Tug'ilgan sana",
                             ).paddingOnly(bottom: 23.w),
                             AppDisableTextField(
                               isFill: false,
                               hintText: "Farg'ona shahar, Farg'ona viloyati dsfd",
                               onChanged: (v) {},
                               title: "Manzil",
                             ).paddingOnly(bottom: 23.w),
                           ],
                         ),
                       ).paddingOnly(bottom: 24.h),

                     ],
                   ),
                 ),
               ),
             );

           }else if(state.changePage==2){
             return UserUpdateVolunteerPage();
           }else {
            return NumberUpdateVolunteerPage();
           }
      },
    ),

    );
  }
}
