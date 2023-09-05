import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/localization/locale_keys.g.dart';
import '/data/bloc/organization_cubit/organization_cubit.dart';
import '/ui/pages/organization_page/widgets/organization_item_widget.dart';
import '../../../data/utils/app_color_utils.dart';
import '../../widgets/app_error_widget.dart';
import '../../widgets/app_widgets.dart';

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
            if(state.internetConnection){
              return Scaffold(
                appBar: AppWidgets.appBarForFirstPages(title: LocaleKeys.organizations),
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
