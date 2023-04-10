import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:najot/data/bloc/volunteer_bloc/volunteer_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/services/main_service.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/crowdfunding_page_main/project_details/widgets/comment_to_author_dialog.dart';
import 'package:najot/ui/pages/crowdfunding_page_main/project_details/widgets/comments_widget.dart';
import 'package:najot/ui/pages/crowdfunding_page_main/project_details/widgets/crowdfunding_author_widget.dart';
import 'package:najot/ui/pages/crowdfunding_page_main/project_details/widgets/more_widget.dart';
import 'package:najot/ui/pages/crowdfunding_page_main/project_details/widgets/news_widget.dart';
import 'package:najot/ui/pages/crowdfunding_page_main/project_details/widgets/question_asked_widget.dart';
import 'package:najot/ui/pages/crowdfunding_page_main/project_details/widgets/support_project_dialog.dart';
import 'package:najot/ui/pages/main_page/widgets/button_card_widget.dart';
import 'package:najot/ui/pages/my_profil_page/my_profile_page.dart';
import 'package:najot/ui/pages/volunteer_page/volunteer_detail_page/widgets/volunteer_help_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:super_rich_text/super_rich_text.dart';
import '../../../../../data/bloc/home_cubit/home_cubit.dart';
import '../../../../../data/bloc/project_data_cubit/project_data_cubit.dart';

class AboutProjectVolunteerWidget extends StatefulWidget {
  AboutProjectVolunteerWidget({
    required this.cardModel,
    required this.cubit,
  });

  final ProjectModel cardModel;
  final VolunteerCubit cubit;

  @override
  _AboutProjectVolunteerWidgetState createState() =>
      _AboutProjectVolunteerWidgetState();
}

class _AboutProjectVolunteerWidgetState
    extends State<AboutProjectVolunteerWidget> with TickerProviderStateMixin {
  late TabController _tabController;
  late bool like;
  static late bool isContribution;
  ProjectDataCubit cubitData = ProjectDataCubit();

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    like = widget.cardModel.isFavourite!;
    isContribution = widget.cardModel.isContribution!;
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var modifiedAt = DateTime.parse(widget.cardModel.modifiedAt!);
    var createdAt = DateTime.parse(widget.cardModel.createdAt!);
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(11),
              bottomRight: Radius.circular(11),
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
                        Radius.circular(12),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: widget.cardModel.coverUrl!,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 120.w,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return SupportProjectDialog(
                              projectModel: widget.cardModel,
                            );
                            // return PaymentHistoryDialog(projectModel: widget.cardModel,);
                          },
                        );
                      },
                      child: Container(
                        height: 35.w,
                        width: 60.w,
                        decoration: BoxDecoration(
                          color: AppColorUtils.BLUE_PERCENT,
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(12),
                          ),
                        ),
                        child: Icon(
                          Icons.monetization_on_outlined,
                          color: AppColorUtils.WHITE,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              AppWidgets.text(
                text: widget.cardModel.title!,
                fontSize: 20.sp,
                color: AppColorUtils.DARK2,
                fontWeight: FontWeight.w500,
                maxLines: 2,
              ).paddingSymmetric(horizontal: 20.w),
              CrowdfundingAuthorWidget(
                model: widget.cardModel,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CommentToAuthorDialog(
                        cubit: cubitData,
                        projectModel: widget.cardModel,
                      );
                    },
                  );
                },
              ).paddingOnly(top: 15.w),
              SizedBox(height: 12.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppWidgets.starTextWidget(
                          text: LocaleKeys.done_date,
                        ),
                        SizedBox(
                          height: 3.w,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(AppImageUtils.DATE),
                            AppWidgets.text(
                              text: DateFormat("dd.MM.yyyy").format(modifiedAt),
                              color: AppColorUtils.BLUE_PERCENT,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ).paddingOnly(left: 6.w),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AppWidgets.textLocale(
                          text: LocaleKeys.announcement_day,
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                          color: AppColorUtils.DARK_6,
                        ),
                        AppWidgets.text(
                          text: DateFormat("dd.MM.yyyy").format(createdAt),
                          color: Color(0xFF043F3B),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ).paddingOnly(top: 3.w),
                      ],
                    ),
                  )
                ],
              ).paddingSymmetric(horizontal: 20.w),
              AppWidgets.starTextWidget(
                text: LocaleKeys.help_type.tr(),
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
                color: AppColorUtils.DARK_6,
              ).paddingOnly(
                top: 13.w,
                left: 20.w,
                bottom: 3.w,
              ),
              AppWidgets.text(
                      text: widget.cardModel.title ?? "",
                      maxLines: 2,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: AppColorUtils.GREEN_TEXT)
                  .paddingSymmetric(horizontal: 20.w),
              AppWidgets.textLocale(
                text: LocaleKeys.address,
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
                color: AppColorUtils.DARK_6,
              ).paddingOnly(
                left: 20.w,
                top: 12.w,
                bottom: 3.w,
              ),
              AppWidgets.text(
                text: widget.cardModel.address ?? "",
                fontSize: 14.w,
                fontWeight: FontWeight.w500,
                color: AppColorUtils.TEXT_BLUE2,
                maxLines: 2,
              ).paddingSymmetric(horizontal: 20.w)
            ],
          ).paddingOnly(bottom: 15.w),
        ),
        SizedBox(
          height: 24.w,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20.w),
          decoration: BoxDecoration(
            color: AppColorUtils.WHITE,
            borderRadius: BorderRadius.circular(11.0),
          ),
          child: DefaultTabController(
            initialIndex: 0,
            length: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBar(
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
                  padding: EdgeInsets.only(right: 10),
                  indicatorPadding: EdgeInsets.only(
                    right: 10,
                    left: 10,
                  ),
                  labelPadding: EdgeInsets.only(
                    right: 10,
                    left: 10,
                  ),
                ).paddingOnly(
                  left: 15.w,
                  top: 8.w,
                ),
                BlocBuilder<ProjectDataCubit, ProjectDataState>(
                  bloc: cubitData..load(widget.cardModel.id!),
                  builder: (contextData, stateData) {
                    return Container(
                      child: [
                        MoreWidget(
                          cardModel: widget.cardModel,
                        ),
                        NewsWidget(
                          cubit: cubitData,
                        ).paddingAll(20.w),
                        QuestionsAnswerWidget(
                          cubit: cubitData,
                        ).paddingAll(20.w),
                        CommentsWidget(
                          cubit: cubitData,
                          projectModel: widget.cardModel,
                        ).paddingAll(20.w)
                      ][_tabController.index],
                    );
                  },
                ),
                SizedBox(
                  height: 10.w,
                ),
                !isContribution
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.cubit.state.tobeVolunteer
                              ? SizedBox()
                              : AppWidgets.text(
                                  text: LocaleKeys.tobe_volunteer.tr(),
                                  color: AppColorUtils.DARK_6,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.w,
                                  richText: true,
                                  othersMarkers: [
                                      MarkerText(
                                        marker: "&",
                                        style: TextStyle(
                                          color: AppColorUtils.RED,
                                        ),
                                      ),
                                      MarkerText(
                                        marker: "//",
                                        style: TextStyle(
                                          color: AppColorUtils.BLACK,
                                        ),
                                      )
                                    ]).paddingSymmetric(
                                  horizontal: 20.w,
                                  vertical: 10.w,
                                ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ButtonCard(
                                onPress: () {
                                  if (widget.cubit.state.tobeVolunteer) {
                                    VolunteerCubit.to.isContribution(
                                      widget.cardModel.id!,
                                    );
                                    NavigatorService.to.pushNamed(
                                      VolunteerHelpWidget.routeName,
                                      arguments: VolunteerHelpModel(
                                        cardModel: widget.cardModel,
                                        cubit: widget.cubit,
                                      ),
                                    );
                                    setState(() {
                                      isContribution = true;
                                    });
                                  } else {
                                    Fluttertoast.showToast(
                                      msg: LocaleKeys.be_volunteer.tr(),
                                    );
                                  }
                                },
                                text: LocaleKeys.help.tr(),
                                height: 48.w,
                                width: 274.w,
                                color: widget.cubit.state.tobeVolunteer
                                    ? AppColorUtils.PERCENT_COLOR
                                    : AppColorUtils.DISABLE_BC,
                                textSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                textColor: AppColorUtils.WHITE,
                              ),
                              AppWidgets.favouriteButton(
                                select: like,
                                height: 48.w,
                                width: 48.w,
                                onTap: () async {
                                  var connection = await MainService()
                                      .checkInternetConnection();
                                  if (connection) {
                                    await widget.cubit
                                        .changeLike(widget.cardModel.id!);
                                    setState(() {
                                      like = !like;
                                    });
                                    await HomeCubit.to.getModel();
                                  } else {
                                    AppWidgets.showText(
                                      text: LocaleKeys.disConnection.tr(),
                                    );
                                  }
                                },
                              )
                            ],
                          ).paddingSymmetric(horizontal: 20.w),
                        ],
                      )
                    : Column(
                        children: [
                          ButtonCard(
                            onPress: () {
                              NavigatorService.to.pushReplacementNamed(
                                  MyProfilePage.routeName);
                            },
                            text: LocaleKeys.go_to_personal_profile,
                            height: 48.w,
                            width: 1.sw,
                            color: AppColorUtils.BLUE_BUTTON,
                            textSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            textColor: AppColorUtils.WHITE,
                          ).paddingSymmetric(horizontal: 20.w),
                          AppWidgets.starTextWidget(
                            text: LocaleKeys.you_accepted_ad,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColorUtils.DARK_6,
                          ).paddingOnly(
                            left: 20.w,
                            top: 10.w,
                          )
                        ],
                      )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
