import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../data/bloc/my_crowdfunding_support_cubit/my_crowdfunding_support_cubit.dart';
import '../../../data/utils/app_image_utils.dart';
import '/data/bloc/charity_page_cubit/charity_cubit.dart';
import '/data/bloc/project_data_cubit/project_data_cubit.dart';
import '/data/extensions/widget_padding_extension.dart';
import '/data/localization/locale_keys.g.dart';
import '/data/model/project_model.dart';
import '/data/services/navigator_service.dart';
import '/data/utils/app_color_utils.dart';
import '/ui/pages/charity_page/widgets/detail_body_part1.dart';
import '/ui/pages/crowdfunding_page_main/project_details/widgets/comments_widget.dart';
import '/ui/pages/crowdfunding_page_main/project_details/widgets/more_widget.dart';
import '/ui/pages/crowdfunding_page_main/project_details/widgets/question_asked_widget.dart';
import '/ui/widgets/app_bar_with_title.dart';
import '/ui/widgets/app_widgets.dart';
import '../../widgets/app_error_widget.dart';
import 'my_charity_project_full_widget/my_charity_edit_project_dialog.dart';
import 'my_charity_project_full_widget/my_delete_project_dialog.dart';
import 'my_crowdfunding_project/my_crowdfunding_news_widget.dart';
import 'debugged_widgets/widget_for_tester_page_volontchecker.dart';




/// page is created to fix bugs

class CharityFullModel {
  ProjectModel cardModel;

  CharityCubit cubit;

  CharityFullModel({
    required this.cardModel,
    required this.cubit,
  });
}

class TesterPagesInProjectsAnnouncements extends StatefulWidget {
  static const String routName = 'charityFullPage2';
  static int tabChange = 0;
  ProjectModel helpModel;
  int screen_number;

  TesterPagesInProjectsAnnouncements({Key? key, required this.screen_number, required this.helpModel}) : super(key: key);

  @override
  State<TesterPagesInProjectsAnnouncements> createState() => _CharityFullPageState();
}

class _CharityFullPageState extends State<TesterPagesInProjectsAnnouncements>
    with TickerProviderStateMixin {
  late TabController _controller;
  ProjectDataCubit cubitData = ProjectDataCubit();
  late bool like;
  late bool isContribution;
  MyCrowdfundingSupportCubit cubitMyCrowFunding = MyCrowdfundingSupportCubit();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    like = widget.helpModel.isFavourite!;
    isContribution = widget.helpModel.isContribution!;
    _controller = TabController(length: 4, vsync: this);
    _controller.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    if (_controller.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorUtils.BACKGROUND,
      appBar: AppBarWithTitle(
        title: LocaleKeys.about_project.tr(),
        onPress: () {
          NavigatorService.to.pop();
        },
      ),
      body: BlocBuilder<CharityCubit, CharityState>(
        bloc: CharityCubit.to,
        builder: (context, state) {
          if (state.internetConnection) {
            var project = widget.helpModel;
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.w),
                        bottomRight: Radius.circular(12.w),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 300.w,
                              margin: EdgeInsets.symmetric(
                                horizontal: 20.w,
                                vertical: 18.w,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.w),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: widget.helpModel.coverUrl!,
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                  placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                            Align(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    child:
                                    SvgPicture.asset(AppImageUtils.TRASH_RED),
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return MyDeleteProjectDialog(
                                            cubit: cubitMyCrowFunding,
                                            projectModel: widget.helpModel,
                                          );
                                        },
                                      );
                                    },
                                  ).paddingOnly(right: 12.w),
                                  InkWell(
                                    child:
                                    SvgPicture.asset(AppImageUtils.EDIT_GREEN),
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return MyEditProjectDialog(
                                            cubit: cubitMyCrowFunding,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ).paddingOnly(top: 35.w, right: 35.w),
                          ],
                        ),
                        AppWidgets.text(
                          text: widget.helpModel.title ?? "",
                          fontSize: 20.sp,
                          color: AppColorUtils.DARK2,
                          fontWeight: FontWeight.w500,
                          maxLines: 2,
                        ).paddingSymmetric(horizontal: 20.w),
                        SizedBox(height: 12.w),
                        DetailBodyPart1(cardModel: widget.helpModel)
                      ],
                    ),
                  ),
                  WidgetForTesterPageVolontChecker(
                    projectModel: widget.helpModel,
                    hasVolont: true,
                    isCharityTap: widget.screen_number == 3,
                  ),
                  SizedBox(
                    height: 24.w,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0.r)),
                    child: DefaultTabController(
                      initialIndex: 0,
                      length: 4,
                      child: Column(
                        children: [
                          TabBar(
                            controller: _controller,
                            enableFeedback: true,
                            labelColor: AppColorUtils.GREEN_APP,
                            unselectedLabelColor: AppColorUtils.DARK_6,
                            unselectedLabelStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            labelStyle: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            tabs: [
                              Text(
                                LocaleKeys.more.tr(),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                LocaleKeys.news.tr(),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                LocaleKeys.questions_asked.tr(),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                LocaleKeys.comments.tr(),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                            isScrollable: true,
                            indicatorWeight: 2,
                            indicatorColor: AppColorUtils.GREEN_APP,
                            indicatorSize: TabBarIndicatorSize.tab,
                            padding: EdgeInsets.only(right: 10.w),
                            indicatorPadding:
                            EdgeInsets.only(right: 10.w, left: 10.w),
                            labelPadding: EdgeInsets.only(right: 10.w, left: 10.w),
                          ).paddingOnly(left: 15.w, top: 8.w),
                          BlocBuilder<ProjectDataCubit, ProjectDataState>(
                            bloc: cubitData..load(project.id!),
                            builder: (contextData, stateData) {
                              return Container(
                                child: [
                                  MoreWidget(
                                    cardModel: project,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                                    child: MyCrowdfundingNewsWidget(
                                      cardModel: widget.helpModel,
                                      cubit: cubitMyCrowFunding,
                                    ),
                                  ),
                                  QuestionsAnswerWidget(
                                    cubit: cubitData,
                                  ).paddingAll(20.w),
                                  CommentsWidget(
                                    cubit: cubitData,
                                    projectModel: project,
                                  ).paddingAll(20.w)
                                ][_controller.index],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return AppErrorWidget(
              onTap: () async {
                AppWidgets.isLoading(true);
                await CharityCubit.to.load();
                AppWidgets.isLoading(false);
              },
            );
          }
        },
      ),
    );
  }
}
