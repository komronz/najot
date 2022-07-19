import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:najot/data/bloc/organization_cubit/organization_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/main_page/widgets/button_card_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/comments_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/more_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/news_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/payment_history_dialog.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/question_asked_widget.dart';
import 'package:najot/ui/widgets/app_bar_with_title.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:super_rich_text/super_rich_text.dart';
import '../../../../data/bloc/project_data_cubit/project_data_cubit.dart';
import '../../../../data/services/main_service.dart';
import '../../../widgets/app_error_widget.dart';
import '../../charity_page/widgets/detail_body_part1.dart';
import '../../kraudfanding_page_main/project_details/widgets/comment_to_author_dialog.dart';
import '../../kraudfanding_page_main/project_details/widgets/kraudfanding_authot_widget.dart';
import 'organization_help_widget.dart';

class OrganizationItemModel {
  ProjectModel cardModel;
  int id;

  OrganizationItemModel({
    required this.cardModel,
    required this.id
  });
}

class OrganizationItemWidget extends StatefulWidget {
  OrganizationItemWidget({required this.helpModel});

  static const String routName = '/organizationItemDetailPage2';
  static int tabChange = 0;
  OrganizationItemModel helpModel;


  @override
  State<OrganizationItemWidget> createState() =>
      _OrganizationItemWidgetState();
}

class _OrganizationItemWidgetState
    extends State<OrganizationItemWidget> with TickerProviderStateMixin {
  late TabController _controller;
  late bool like;
  ProjectDataCubit cubitData = ProjectDataCubit();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    like = widget.helpModel.cardModel.isFavourite!;
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
      body: BlocBuilder<OrganizationCubit, OrganizationState>(
        bloc: OrganizationCubit.to,
        builder: (context, state) {
          if(state.internetConnection){
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
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
                                  imageUrl: widget.helpModel.cardModel.coverUrl!,
                                  fit: BoxFit.cover,
                                  width: MediaQuery.of(context).size.width,
                                  placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
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
                                      return PaymentHistoryDialog();
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
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        AppWidgets.text(
                          text: widget.helpModel.cardModel.title??"",
                          fontSize: 20.sp,
                          color: AppColorUtils.DARK2,
                          fontWeight: FontWeight.w500,
                          maxLines: 2,
                        ).paddingSymmetric(horizontal: 20.w),
                        KraudfandingAuthorWidget(
                          model: widget.helpModel.cardModel,
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return CommentToAuthorDialog(
                                  cubit: cubitData,
                                  projectModel: widget.helpModel.cardModel,
                                );
                              },
                            );
                          },
                        ).paddingOnly(top: 15.w),
                        SizedBox(height: 12.w),
                        DetailBodyPart1(cardModel: widget.helpModel.cardModel,),
                        SizedBox(height: 12.w),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.w,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(11.0)),
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
                            bloc: cubitData..load(widget.helpModel.cardModel.id!),
                            builder: (contextData, stateData) {
                              return Container(
                                child: [
                                  MoreWidget(
                                    cardModel: widget.helpModel.cardModel,
                                  ),
                                  NewsWidget(
                                    cubit: cubitData,
                                  ).paddingAll(20.w),
                                  QuestionsAnswerWidget(
                                    cubit: cubitData,
                                  ).paddingAll(20.w),
                                  CommentsWidget(
                                    cubit: cubitData,
                                    projectModel: widget.helpModel.cardModel,
                                  ).paddingAll(20.w)
                                ][_controller.index],
                              );
                            },
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          state.saveHelp
                              ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              state.tobeVolunteer
                                  ? SizedBox()
                                  : AppWidgets.text(
                                  text:
                                  LocaleKeys.tobe_volunteer.tr(),
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
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  ButtonCard(
                                    onPress: () {
                                      if (state.tobeVolunteer == true) {
                                        NavigatorService.to.pushNamed(
                                          OrganizationHelpWidget
                                              .routeName,
                                          arguments:
                                          OrganizationHelpModel(
                                            cardModel: widget
                                                .helpModel.cardModel,
                                            cubit: OrganizationCubit.to,
                                          ),
                                        );
                                      } else {
                                        Fluttertoast.showToast(
                                          msg: LocaleKeys.be_volunteer.tr(),
                                        );
                                      }
                                    },
                                    text: LocaleKeys.help,
                                    height: 48.w,
                                    width: 274.w,
                                    color: state.tobeVolunteer
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
                                    onTap: () async{
                                      var connection = await MainService().checkInternetConnection();
                                      if(connection){
                                        await OrganizationCubit.to.changeLike(widget.helpModel.cardModel.id!);
                                        setState(() {
                                          like=!like;
                                        });
                                        await OrganizationCubit.to.findProject(widget.helpModel.id);
                                      }else{
                                        AppWidgets.showText(text: "Internet bilan aloqa yo'q!");
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
                                onPress: () {},
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
              ),
            );
          }
          return AppErrorWidget(
              onTap: () async{
                AppWidgets.isLoading(true);
                await OrganizationCubit.to.load();
                AppWidgets.isLoading(false);
              });

        },
      ),
    );
  }
}
