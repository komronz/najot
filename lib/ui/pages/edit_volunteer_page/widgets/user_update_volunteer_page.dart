import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot/data/bloc/edit_volunteer_bloc/edit_volunteer_bloc.dart';
import 'package:najot/data/bloc/reg_volunteer_bloc/reg_volunteer_bloc.dart';
import 'package:najot/data/config/const/decoration_const.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/ui/pages/edit_volunteer_page/widgets/edit_view1.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_widgets.dart';
import 'edit_view2.dart';

class UserUpdateVolunteerPage extends StatelessWidget {
  static const String routeName = "/userUpdateVolunteerPage";

  const UserUpdateVolunteerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<EditVolunteerBloc>().add(const EditProfileChangePage(1));
        return Future(() => false);
      },
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: BlocProvider(
          create: (context) => RegVolunteerBloc(),
          child: BlocConsumer<RegVolunteerBloc, RegVolunteerState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  backgroundColor: AppColorUtils.background,
                  titleSpacing: 0,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  title: Container(
                    color: AppColorUtils.waitColor,
                    child: AppWidgets.appBarMenu(
                      title: LocaleKeys.edit_my_profile,
                      onTapMenu: () {
                        HomePage.globalKey.currentState!.openDrawer();
                      },
                      visibleIcon: true,
                      onTapIcon: () {
                        context
                            .read<EditVolunteerBloc>()
                            .add(const EditProfileChangePage(1));
                      },
                      icon: AppImageUtils.remove,
                    ),
                  ),
                ),
                body: Container(
                  // padding: EdgeInsets.symmetric(horizontal: 20.w),
                  decoration: DecorationConst.decWithShadow,
                  child: Column(
                    children: [
                      SmoothPageIndicator(
                        controller:
                            context.read<RegVolunteerBloc>().pageController,
                        count: 2,
                        effect: const WormEffect(
                          dotColor: AppColorUtils.indicator,
                          activeDotColor: AppColorUtils.greenApp,
                        ),
                      ).paddingOnly(top: 18),
                      Expanded(
                        child: PageView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller:
                              context.read<RegVolunteerBloc>().pageController,
                          children: [
                            const EditView1(),
                            EditView2(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
