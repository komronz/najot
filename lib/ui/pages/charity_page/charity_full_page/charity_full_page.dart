import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/charity_page_cubit/charity_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/charity_page/charity_full_page/charity_full_page2.dart';
import 'package:najot/ui/pages/charity_page/widgets/detail_body_part2.dart';
import 'package:najot/ui/pages/main_page/widgets/button_card_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/comment_to_author_dialog.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/kraudfanding_authot_widget.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/payment_history_dialog.dart';
import 'package:najot/ui/pages/kraudfanding_page_main/project_details/widgets/support_project_dialog.dart';
import 'package:najot/ui/widgets/app_bar_with_title.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../../data/bloc/home_cubit/home_cubit.dart';
import '../../../../data/bloc/project_data_cubit/project_data_cubit.dart';
import '../../../../data/model/project_model.dart';
import '../../kraudfanding_page_main/project_details/widgets/comments_widget.dart';
import '../../kraudfanding_page_main/project_details/widgets/more_widget.dart';
import '../../kraudfanding_page_main/project_details/widgets/news_widget.dart';
import '../../kraudfanding_page_main/project_details/widgets/question_asked_widget.dart';



class CharityFullPage extends StatefulWidget {
  CharityFullPage({required this.model});

  static const String routName = 'charityFullPage';
  static int tabChange = 0;
  CharityFullModel model;

  @override
  State<CharityFullPage> createState() => _CharityFullPageState();
}

class _CharityFullPageState extends State<CharityFullPage>
    with TickerProviderStateMixin {
  late TabController _controller;

  CharityCubit cubit = CharityCubit();
  late bool like;
  ProjectDataCubit cubitData = ProjectDataCubit();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    like=widget.model.cardModel.isFavourite!;
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
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        backgroundColor: AppColorUtils.BACKGROUND,
        appBar: AppBarWithTitle(
          title: LocaleKeys.about_project.tr(),
          onPress: () async{
           await HomeCubit.to.getModel();
            NavigatorService.to.pop();
          },
        ),
        body: BlocBuilder<CharityCubit, CharityState>(
          builder: (context, state) {
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
                                    imageUrl: widget.model.cardModel.coverUrl!,
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
                            text: widget.model.cardModel.title!,
                            fontSize: 20.sp,
                            color: AppColorUtils.DARK2,
                            fontWeight: FontWeight.w500,
                            maxLines: 2,
                          ).paddingSymmetric(horizontal: 20.w),
                          KraudfandingAuthorWidget(
                            model: widget.model.cardModel,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return CommentToAuthorDialog(
                                    cubit: cubitData,
                                    projectModel: widget.model.cardModel,
                                  );
                                },
                              );
                            },
                          ).paddingOnly(top: 15.w),
                          SizedBox(height: 12.w),
                          DetailBodyPart2(cardModel: widget.model.cardModel)
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
                              indicatorPadding:
                                  EdgeInsets.only(right: 10, left: 10),
                              labelPadding:
                                  EdgeInsets.only(right: 10, left: 10),
                            ).paddingOnly(left: 15.w, top: 8.w),
                            BlocBuilder<ProjectDataCubit, ProjectDataState>(
                              bloc: cubitData..load(widget.model.cardModel.id!),
                              builder: (contextData, stateData) {
                                return Container(
                                  child: [
                                    MoreWidget(
                                      cardModel: widget.model.cardModel,
                                    ),
                                    NewsWidget(
                                      cubit: cubitData,
                                    ).paddingAll(20.w),
                                    QuestionsAnswerWidget(
                                      cubit: cubitData,
                                    ).paddingAll(20.w),
                                    CommentsWidget(
                                      cubit: cubitData,
                                      projectModel: widget.model.cardModel,
                                    ).paddingAll(20.w)
                                  ][_controller.index],
                                );
                              },
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ButtonCard(
                                  onPress: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return SupportProjectDialog(
                                          projectModel: widget.model.cardModel,
                                        );
                                      },
                                    );
                                  },
                                  text: LocaleKeys.project_implementation,
                                  height: 48.w,
                                  width: 274.w,
                                  color: AppColorUtils.PERCENT_COLOR,
                                  textSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  textColor: AppColorUtils.WHITE,
                                ),
                                AppWidgets.favouriteButton(
                                  select: true,
                                  height: 48.w,
                                  width: 48.w,
                                  onTap: () async{
                                    await widget.model.cubit.changeLike(widget.model.cardModel.id!);
                                    setState(() {
                                      like=!like;
                                    });
                                    await HomeCubit.to.getModel();
                                  },
                                )
                              ],
                            ).paddingSymmetric(horizontal: 20.w),
                          ],
                        ),
                      ),
                    ),
                  ],
                ));
          },
        ),
      ),
    );
  }
}
