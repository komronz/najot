import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/bloc/add_project_bloc/add_project_bloc.dart';
import 'package:najot/data/bloc/add_project_bloc/add_project_event.dart';
import 'package:najot/data/bloc/add_project_bloc/add_project_state.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/services/main_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/my_volunteering_page/my_volunteering_widget/add_project_show_success.dart';
import 'package:najot/ui/widgets/app_text_field.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/localization/locale_keys.g.dart';
import '../../home_page/home_page.dart';


class AddingProjectPage extends StatefulWidget {
  static const String routeName = '/addingProjectPage';

  AddingProjectPage({Key? key}) : super(key: key);

  @override
  _AddingProjectPageState createState() => _AddingProjectPageState();
}

class _AddingProjectPageState extends State<AddingProjectPage> {
  List<String> projectType = [
    "CF",
    "VL",
    "CH",
  ];
  List<String> projectName = [
    "user",
    "organization",
  ];
  AddProjectBloc addProjectBloc = AddProjectBloc();
  Key _key = Key("");

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => addProjectBloc,
      child: Scaffold(
        key: UniqueKey(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleSpacing: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  HomePage.globalKey.currentState!.openDrawer();
                },
                child: SvgPicture.asset(
                  AppImageUtils.MENU,
                  height: 35.w,
                  width: 35.w,
                ),
              ),
              AppWidgets.textLocale(
                text: LocaleKeys.charity,
                fontSize: 26.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                width: 35.w,
                height: 35.w,
              )

              ///Change later
              ///
              // InkWell(
              //   onTap: () {
              //     NavigatorService.to
              //         .pushNamed(NotificationPage.routeName);
              //   },
              //   child: SvgPicture.asset(
              //     AppImageUtils.NOTIFICATION,
              //     height: 35.w,
              //     width: 35.w,
              //     fit: BoxFit.fill,
              //   ),
              // )
            ],
          ).paddingSymmetric(
            horizontal: 20.w,
          ),
        ),
        body: BlocBuilder<AddProjectBloc, AddProjectState>(
          bloc: addProjectBloc,
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: AppWidgets.imageSvg(
                      path: AppImageUtils.ADDING_PROJECT,
                    ).paddingOnly(top: 18.h),
                  ),
                  AppWidgets.textLocale(
                    text: LocaleKeys.fill_out_form,
                    maxLines: 2,
                    color: AppColorUtils.DARK2,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                  ).paddingSymmetric(horizontal: 20.w),
                  SizedBox(
                    height: 60.w,
                  ),
                  //? Who is adding project widget
                  // DropDownWidget(
                  //   height: 52.w,
                  //   items: projectName,
                  //   key: _key,
                  //   hasTitle: true,
                  //   title: LocaleKeys.who_joining_project.tr(),
                  //   isEmpty: context.read<AddProjectBloc>().state.whoAddFill,
                  //   selectValue: context.read<AddProjectBloc>().state.whoAdd,
                  //   onChange: (v) {
                  //     context
                  //         .read<AddProjectBloc>()
                  //         .add(AddProjectAddWhoChanged(v));
                  //   },
                  // ).paddingOnly(
                  //   bottom: 18.w,
                  // ),

                  AppTextField(
                    isFill: context.read<AddProjectBloc>().state.nameFill,
                    hintText: LocaleKeys.enter_project_name.tr(),
                    key: _key,
                    height: 52.w,
                    onChanged: (v) {
                      context
                          .read<AddProjectBloc>()
                          .add(AddProjectNameChanged(v));
                    },
                    title: LocaleKeys.project_name.tr(),
                  ).paddingOnly(bottom: 18.w),

                  //? Announcement type
                  // DropDownWidget(
                  //   height: 52.w,
                  //   items: projectType,
                  //   key: _key,
                  //   hasTitle: true,
                  //   title: LocaleKeys.project_or_announcement_type.tr(),
                  //   isEmpty: context.read<AddProjectBloc>().state.typeFill,
                  //   selectValue: context.read<AddProjectBloc>().state.type,
                  //   onChange: (v) {
                  //     context
                  //         .read<AddProjectBloc>()
                  //         .add(AddProjectTypeChanged(v));
                  //   },
                  // ).paddingOnly(
                  //   bottom: 18.w,
                  // ),
                  AppTextField(
                    isFill:
                        context.read<AddProjectBloc>().state.descriptionFill,
                    isMultiLine: true,
                    key: _key,
                    height: 145.w,
                    hintText: LocaleKeys.write_short_card.tr(),
                    onChanged: (v) {
                      context
                          .read<AddProjectBloc>()
                          .add(AddProjectDescriptionChanged(v));
                    },
                    textInputType: TextInputType.multiline,
                    title: LocaleKeys.brief_information_project,
                  ),
                  AppWidgets.appButton(
                    title: LocaleKeys.send,
                    onTap: () async {
                      var connection =
                          await MainService().checkInternetConnection();
                      if (connection) {
                        _key = UniqueKey();
                        await showDialog(
                          context: context,
                          builder: (context) => AddProjectShowSuccessSend(
                            addProjectBloc: addProjectBloc,
                          ),
                        );
                      } else {
                        AppWidgets.showText(
                            text: LocaleKeys.disConnection.tr());
                      }
                    },
                    textColor: Colors.white,
                    color: context.read<AddProjectBloc>().state.isBtnActive
                        ? AppColorUtils.PERCENT_COLOR
                        : AppColorUtils.GREEN_BTN,
                  ).paddingSymmetric(
                    vertical: 18.w,
                  ),
                ],
              ).paddingSymmetric(horizontal: 20.w),
            );
          },
        ),
      ),
    );
  }
}
