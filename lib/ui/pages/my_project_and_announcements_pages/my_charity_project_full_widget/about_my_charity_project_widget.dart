import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/bloc/my_crowdfunding_support_cubit/my_crowdfunding_support_state.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/crowdfunding_page_main/project_details/widgets/more_widget.dart';
import '../../../../data/bloc/my_crowdfunding_support_cubit/my_crowdfunding_support_cubit.dart';
import '../../../../data/config/const/decoration_const.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../widgets/app_widgets.dart';
import '../my_crowdfunding_project/my_crowdfunding_about_widget.dart';
import '../my_crowdfunding_project/my_crowdfunding_comments_widget.dart';
import '../my_crowdfunding_project/my_crowdfunding_news_widget.dart';
import '../my_crowdfunding_project/my_crowdfunding_question_asked_widget.dart';
import 'my_charity_applied_user_widget.dart';
import 'my_charity_edit_project_dialog.dart';
import 'my_charity_price_widget.dart';
import 'my_delete_project_dialog.dart';

class AboutMyCharityProjectWidget extends StatefulWidget {
  const AboutMyCharityProjectWidget({required this.model});

  final ProjectModel model;

  @override
  _AboutMyCharityProjectWidgetState createState() =>
      _AboutMyCharityProjectWidgetState();
}

class _AboutMyCharityProjectWidgetState
    extends State<AboutMyCharityProjectWidget> with TickerProviderStateMixin {
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
        builder: (context, state) {
          return Column(
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
                              imageUrl: widget.model.cover!,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ).paddingSymmetric(
                            horizontal: 20,
                            vertical: 20,
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
                                        cubit: cubit,
                                        projectModel: widget.model,
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
                                        cubit: cubit,
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ).paddingOnly(top: 35.h, right: 35.w),
                      ],
                    ),
                    AppWidgets.text(
                      text: widget.model.title!,
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: AppColorUtils.DARK2,
                      maxLines: 10,
                    ).paddingSymmetric(horizontal: 20),
                    MyCharityPriceWidget(model: widget.model)
                        .paddingOnly(top: 18.w),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyCharityAppliedUserWidget(model: widget.model),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppWidgets.starTextWidget(
                              text: LocaleKeys.must_collected_date,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_outlined,
                                  color: AppColorUtils.BLUE_PERCENT,
                                  size: 14.sp,
                                ),
                                AppWidgets.text(
                                  text: DateFormat("dd.MM.yyyy").format(
                                    DateTime.parse(widget.model.deadline!),
                                  ),
                                  color: AppColorUtils.BLUE_PERCENT,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ).paddingOnly(left: 6.w),
                              ],
                            ).paddingOnly(top: 10.w)
                          ],
                        ).paddingOnly(left: 30.w)
                      ],
                    ).paddingSymmetric(
                      horizontal: 20.w,
                      vertical: 18.w,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24.w,
              ),
              state.widgetChange == false
                  ? Container(
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
                                          color: AppColorUtils.RED,
                                        ),
                                      ).paddingOnly(
                                        left: 3.w,
                                        top: 2.w,
                                      ),
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
                            Container(
                              child: [
                                MoreWidget(
                                  cardModel: widget.model,
                                ),
                                MyCrowdfundingNewsWidget(
                                  cubit: cubit,
                                  cardModel: widget.model,
                                ).paddingAll(20.w),
                                MyCrowdfundingQuestionsAskedWidget(
                                  cardModel: widget.model,
                                  cubit: cubit,
                                ).paddingAll(20.w),
                                MyCrowdfundingCommentsWidget(
                                  projectModel: widget.model,
                                  cubit: cubit,
                                ).paddingAll(20.w)
                              ][_tabController.index],
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
          );
        },
      ),
    );
  }
}
