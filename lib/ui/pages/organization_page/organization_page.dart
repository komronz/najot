import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/organization_cubit/organization_cubit.dart';
import 'package:najot/ui/pages/organization_page/widgets/organization_item_widget.dart';
import '../../../data/localization/locale_keys.g.dart';
import '../../../data/services/navigator_service.dart';
import '../../../data/utils/app_color_utils.dart';
import '../../../data/utils/app_image_utils.dart';
import '../../widgets/app_error_widget.dart';
import '../../widgets/app_widgets.dart';
import '../home_page/home_page.dart';
import '../notification_page/notification_page.dart';

class OrganizationPage extends StatelessWidget {
  OrganizationPage({Key? key}) : super(key: key);
  static const String routeName = "/organizationPage";
  OrganizationCubit cubit = OrganizationCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrganizationCubit.to..load(),
      child: BlocBuilder<OrganizationCubit, OrganizationState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColorUtils.BACKGROUND,
                titleSpacing: 0,
                elevation: 0,
                automaticallyImplyLeading: false,
                title: AppWidgets.appBarMenu(
                  title: LocaleKeys.organizations,
                  onTapMenu: () {
                    HomePage.globalKey.currentState!.openDrawer();
                  },
                  visibleIcon: true,
                  onTapIcon: () {
                    NavigatorService.to.pushNamed(NotificationPage.routeName,);

                  },
                  icon: AppImageUtils.NOTIFICATION,
                ),
              ),
              body: Container(
                padding: EdgeInsets.all(15.w),
                color: AppColorUtils.BACKGROUND,
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  physics: ClampingScrollPhysics(),
                  childAspectRatio: 160.w / 238.w,
                  padding: EdgeInsets.all(0),
                  reverse: false,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 6,
                  children: List.generate(state.list.length, (index) {
                    return OrganizationItemWidget(
                      model: state.list[index],
                      cubit: cubit,
                    );
                  }),
                ),
              ),
            );
          }
          return AppErrorWidget(
              onTap: () async{
                AppWidgets.isLoading(true);
                await OrganizationCubit.to.load();
                AppWidgets.isLoading(false);
              });
          }),
    );
  }
}
