import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/crowdFounding_cubit/kraud_fanding_cubit.dart';
import 'package:najot/data/bloc/product_cubit/product_cubit.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/ui/pages/crowdfunding_page_main/project_details/widgets/about_project_widget.dart';
import 'package:najot/ui/pages/crowdfunding_page_main/project_details/widgets/products_widget.dart';
import 'package:najot/ui/pages/crowdfunding_page_main/project_details/widgets/tabbar_widget.dart';
import 'package:najot/ui/widgets/app_bar_with_title.dart';
import '../../../../data/bloc/home_cubit/home_cubit.dart';
import '../../../../data/services/navigator_service.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../widgets/app_error_widget.dart';
import '../../../widgets/app_widgets.dart';

class CrowdfundingDetailModel {
  CrowdfundingDetailModel({
    required this.cubit,
    required this.cardModel,
  });

  CrowdfundingCubit cubit;
  ProjectModel cardModel;
}

class ProjectDetailsPage extends StatefulWidget {
  ProjectDetailsPage({required this.model});

  static const String routeName = "/projectDetailsPage";
  static int tabChange = 0;
  CrowdfundingDetailModel model;

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    _controller.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_controller.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    ProductCubit productCubit = ProductCubit();
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductCubit>(
          create: (context) => productCubit..load(),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColorUtils.BACKGROUND,
        appBar: AppBarWithTitle(
          title: LocaleKeys.about_project.tr(),
          onPress: () async{
            await HomeCubit.to.getModel();
            NavigatorService.to.pop();
          },
        ),
        body: BlocBuilder<CrowdfundingCubit, CrowdfundingState>(
          bloc: CrowdfundingCubit.to,
          builder: (context, state) {
            if(state.internetConnection){
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 18.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(11),
                          topLeft: Radius.circular(11),
                        ),
                      ),
                      child: TabBarWidget(
                          _controller,
                          LocaleKeys.about_project.tr(),
                          LocaleKeys.products.tr(), (int i) {
                        if (i == 0) {
                          widget.model.cubit.detailTabChange(0);
                        } else {
                          widget.model.cubit.detailTabChange(1);
                        }
                      }),
                    ),
                    Container(
                      child: [
                        AboutProjectWidget(
                          cardModel: widget.model.cardModel,
                          cubit: widget.model.cubit,
                        ),
                        ProductsWidget(
                          cubit: productCubit,
                        )
                      ][_controller.index],
                    )
                  ],
                ),
              );
            }else{
              return AppErrorWidget(
                  onTap: () async{
                    AppWidgets.isLoading(true);
                    await CrowdfundingCubit.to.load();
                    AppWidgets.isLoading(false);

                  });
            }

          },
        ),
      ),
    );
  }
}
