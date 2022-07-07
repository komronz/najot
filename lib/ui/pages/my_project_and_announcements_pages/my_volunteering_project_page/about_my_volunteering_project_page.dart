import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/ui/pages/my_project_and_announcements_pages/my_crowdfunding_project/my_crowdfunding_about_widget.dart';
import 'package:najot/ui/pages/my_project_and_announcements_pages/my_crowdfunding_project/my_crowdfunding_news_widget.dart';
import 'package:najot/ui/pages/my_project_and_announcements_pages/my_volunteering_project_page/my_volunteering_author_widget.dart';
import 'package:najot/ui/pages/my_project_and_announcements_pages/my_volunteering_project_page/my_volunteering_info_widget.dart';
import '../../../../data/bloc/my_crowdfunding_support_cubit/my_crowdfunding_support_cubit.dart';
import '../../../../data/bloc/my_crowdfunding_support_cubit/my_crowdfunding_support_state.dart';
import '../../../../data/config/const/decoration_const.dart';
import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/services/navigator_service.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_bar_with_title.dart';
import '../../../widgets/app_widgets.dart';
import '../../kraudfanding_page_main/project_details/widgets/more_widget.dart';
import '../my_charity_project_full_widget/my_charity_delete_project_dialog.dart';
import '../my_charity_project_full_widget/my_charity_edit_project_dialog.dart';
import '../my_crowdfunding_project/my_crowdfunding_comments_widget.dart';
import '../my_crowdfunding_project/my_crowdfunding_question_asked_widget.dart';

class AboutMyVolunteeringItemProjectWidget extends StatefulWidget {
  static const String routeName = '/aboutMyVolunteeringItemProjectWidget';

  const AboutMyVolunteeringItemProjectWidget({required this.model});

  final ProjectModel model;

  @override
  _AboutMyVolunteeringItemProjectWidgetState createState() =>
      _AboutMyVolunteeringItemProjectWidgetState();
}

class _AboutMyVolunteeringItemProjectWidgetState
    extends State<AboutMyVolunteeringItemProjectWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;
  MyCrowdfundingSupportCubit cubit = MyCrowdfundingSupportCubit();

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  bool selected = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit..load(widget.model.id!),
      child:
          BlocBuilder<MyCrowdfundingSupportCubit, MyCrowdfundingSupportState>(
        builder: (context, state) => Scaffold(
          appBar: AppBarWithTitle(
            title: LocaleKeys.about_the_ad.tr(),
            onPress: () {
              NavigatorService.to.pop();
            },
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: context.width,
                  decoration: DecorationConst.DEC_WITH_SHADOW,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: context.width,
                            height: 308.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(11),
                              child: CachedNetworkImage(
                                imageUrl: widget.model.coverUrl!,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ).paddingSymmetric(vertical: 20.w),
                          ),
                          Align(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // AppWidgets.appButton(
                                //   color: AppColorUtils.BLUE,
                                //   fontSize: 12,
                                //   fontWeight: FontWeight.w600,
                                //   width: 128.w,
                                //   height: 36.w,
                                //   textColor: AppColorUtils.WHITE,
                                //   title: LocaleKeys.used,
                                //   borderRadius: 12,
                                //   onTap: () {
                                //     NavigatorService.to.pushReplacementNamed(
                                //         MyVolunteeringSupportListPage.routeName,
                                //         arguments: state.cardList);
                                //   },
                                //   icon: SvgPicture.asset(AppImageUtils.USERS),
                                // ).paddingOnly(right: 17.w),
                                InkWell(
                                  child:
                                      SvgPicture.asset(AppImageUtils.TRASH_RED),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return MyDeleteProjectDialog(
                                          cubit: cubit,
                                          projectModel: widget.model,
                                        );
                                      },
                                    );
                                  },
                                ).paddingOnly(right: 12.w),
                                InkWell(
                                  child: SvgPicture.asset(
                                      AppImageUtils.EDIT_GREEN),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return MyEditProjectDialog(cubit: cubit,);
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ).paddingOnly(top: 35.h, right: 15.w),
                        ],
                      ),
                      AppWidgets.text(
                        text: widget.model.title!,
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                        color: AppColorUtils.DARK2,
                        maxLines: 10,
                      ),
                      MyVolunteeringInfoWidget(model: widget.model).paddingOnly(
                        top: 18.w,
                        bottom: 12.w,
                      ),
                      widget.model.owner == null
                          ? Column(
                              children: [
                                AppWidgets.starTextWidget(
                                  text: LocaleKeys.volunteer.tr(),
                                  fontSize: 12.sp,
                                ).paddingOnly(
                                  bottom: 3.h,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 14.w,
                                      height: 14.w,
                                      child: CircularProgressIndicator(
                                        color: Color(0xFFE8B811),
                                        backgroundColor: AppColorUtils.WHITE,
                                        strokeWidth: 2,
                                      ),
                                    ).paddingOnly(
                                      right: 5,
                                    ),
                                    AppWidgets.textLocale(
                                      text: LocaleKeys.expected,
                                      fontSize: 14.sp,
                                      color: Color(0xFFE8B811),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ).paddingOnly(
                                  bottom: 12.w,
                                ),
                              ],
                            )
                          : MyVolunteeringAuthorWidget(
                              onTap: () {},
                              model: widget.model,
                            ).paddingOnly(
                              bottom: 18.w,
                            ),
                    ],
                  ).paddingSymmetric(
                    horizontal: 20.w,
                  ),
                ),
                SizedBox(
                  height: 24.w,
                ),
                state.widgetChange == false
                    ? Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.w,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(11.0)),
                        child: DefaultTabController(
                          initialIndex: 0,
                          length: 4,
                          child: Column(
                            children: [
                              TabBar(
                                onTap: (v) {
                                  if (v == 2) {
                                    selected = false;
                                  } else {
                                    selected = true;
                                  }
                                },
                                controller: _tabController,
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
                                  Row(
                                    children: [
                                      Text(
                                        LocaleKeys.questions_asked.tr(),
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      Visibility(
                                        visible: selected,
                                        child: Container(
                                          width: 7.w,
                                          height: 7.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Colors.red),
                                        ).paddingOnly(left: 3.w, top: 2.w),
                                      )
                                    ],
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
                                padding: EdgeInsets.only(right: 10),
                                indicatorPadding:
                                    EdgeInsets.only(right: 10, left: 10),
                                labelPadding:
                                    EdgeInsets.only(right: 10, left: 10),
                              ).paddingOnly(left: 15.w, top: 8.w),
                              Container(
                                child: [
                                  MoreWidget(
                                    cardModel: widget.model,
                                  ),
                                  MyCrowdfundingNewsWidget(
                                    cubit: cubit,
                                    cardModel: widget.model,
                                  ),
                                  MyCrowdfundingQuestionsAskedWidget(
                                    cardModel: widget.model,
                                    cubit: cubit,
                                  ),
                                  MyCrowdfundingCommentsWidget(
                                    projectModel: widget.model,
                                    cubit: cubit,
                                  )
                                ][_tabController.index],
                              ).paddingOnly(
                                top: 20.w,
                                right: 20.w,
                                left: 20.w,
                              ),
                              SizedBox(
                                height: 10.w,
                              ),
                            ],
                          ),
                        ),
                      )
                    : AnswersWidget(cubit: cubit, model: widget.model),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
