import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import '../../../../data/bloc/my_charity_support_list_cubit/my_charity_support_list_cubit.dart';
import '../../../../data/bloc/my_charity_support_list_cubit/my_charity_support_list_state.dart';
import '../../../../data/config/const/decoration_const.dart';
import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/model/charity_model.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_widgets.dart';
import '../my_charity_project_full_widget/my_charity_comments_widget.dart';
import '../my_charity_project_full_widget/my_charity_more_widget.dart';
import '../my_charity_project_full_widget/my_charity_news_widget.dart';
import '../my_charity_project_full_widget/my_charity_question_asked_widget.dart';
import 'my_charity_item_author_widget.dart';
import 'my_charity_item_price_widget.dart';

class AboutMyCharityItemProjectWidget extends StatefulWidget {
  const AboutMyCharityItemProjectWidget({required this.model});

  final CharityModel model;

  @override
  _AboutMyCharityItemProjectWidgetState createState() =>
      _AboutMyCharityItemProjectWidgetState();
}

class _AboutMyCharityItemProjectWidgetState
    extends State<AboutMyCharityItemProjectWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;
  MyCharitySupportListCubit cubit = MyCharitySupportListCubit();

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

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }
  bool selected=true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<MyCharitySupportListCubit, MyCharitySupportListState>(
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
                              imageUrl: widget.model.imgUrl!,
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
                              InkWell(
                                child:
                                    SvgPicture.asset(AppImageUtils.TRASH_RED),
                                // onTap: () {
                                //   showDialog(
                                //     context: context,
                                //     builder: (context) {
                                //       return MyCharityDeleteProjectDialog();
                                //     },
                                //   );
                                // },
                              ).paddingOnly(right: 12.w),
                              InkWell(
                                child:
                                    SvgPicture.asset(AppImageUtils.EDIT_GREEN),
                                // onTap: () {
                                //   showDialog(
                                //     context: context,
                                //     builder: (context) {
                                //       return MyCharityEditProjectDialog();
                                //     },
                                //   );
                                // },
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
                    MyCharityItemPriceWidget(model: widget.model).paddingOnly(
                      top: 18.w,
                      bottom: 12.w,
                    ),
                    widget.model.volunteerName == null
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
                                  ).paddingOnly(right: 5,),
                                  AppWidgets.textLocale(
                                    text: LocaleKeys.expected,
                                    fontSize: 14.sp,
                                    color: Color(0xFFE8B811),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ],
                              ).paddingOnly(bottom: 12.w,),
                            ],
                          )
                        : MyCharityItemAuthorWidget(
                            onTap: () {},
                            model: widget.model,
                          ).paddingOnly(bottom: 18.w,),
                  ],
                ).paddingSymmetric(horizontal: 20.w,),
              ),
              SizedBox(
                height: 24.w,
              ),
              state.widgetChange==false
              ?Container(
                padding: EdgeInsets.symmetric(vertical: 20.w,),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(11.0)),
                child: DefaultTabController(
                  initialIndex: 0,
                  length: 4,
                  child: Column(
                    children: [
                      TabBar(
                        onTap: (v){
                          if(v==2){
                            selected=false;
                          }else{
                            selected=true;
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
                        indicatorPadding: EdgeInsets.only(right: 10, left: 10,),
                        labelPadding: EdgeInsets.only(right: 10, left: 10,),
                      ).paddingOnly(left: 15.w, top: 8.w,),
                      Container(
                        child: [
                          MyCharityMoreWidget(
                            cardModel: widget.model,
                          ),
                          MyCharityNewsWidget(
                            cardModel: widget.model,
                          ).paddingAll(20.w),
                          MyCharityQuestionsAskedWidget(
                            cardModel: widget.model, cubit: cubit,
                          ).paddingAll(20.w),
                          MyCharityCommentsWidget(
                            cardModel: widget.model,
                          ).paddingAll(20.w)
                        ][_tabController.index],
                      ),
                      SizedBox(
                        height: 10.w,
                      ),
                      // Row(
                      //   mainAxisAlignment:
                      //   MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     // ButtonCard(
                      //     //   onPress: () {
                      //     //     showDialog(
                      //     //       context: context,
                      //     //       builder: (context) {
                      //     //         return SupportProjectDialog();
                      //     //       },
                      //     //     );
                      //     //   },
                      //     //   text: LocaleKeys.project_implementation,
                      //     //   height: 48.w,
                      //     //   width: 274.w,
                      //     //   color: AppColorUtils.PERCENT_COLOR,
                      //     //   textSize: 16.sp,
                      //     //   fontWeight: FontWeight.w600,
                      //     //   textColor: AppColorUtils.WHITE,
                      //     // ),
                      //     // AppWidgets.favouriteButton(
                      //     //   select: widget.model.isFavorite!,
                      //     //   height: 48.w,
                      //     //   width: 48.w,
                      //     //   onTap: () {},
                      //     // )
                      //   ],
                      // ).paddingSymmetric(horizontal: 20.w),
                    ],
                  ),
                ),
              )
              :Container(
                color: AppColorUtils.WHITE,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      child: Container(
                        width: 31.w,
                        height: 34.w,
                        decoration: BoxDecoration(
                          color: AppColorUtils.BACK_BUTTON,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: AppColorUtils.IC_GREEN2,
                          size: 20.w,
                        ),
                      ),
                      onTap: (){
                        cubit.widgetChange(false);
                      },
                    ).paddingOnly(
                      left: 20.w,
                      top: 18.w,
                      bottom: 18.w,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      padding: EdgeInsets.only(
                        top: 12.w,
                        left: 12.w,
                        right: 12.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColorUtils.GREEN_ACCENT4,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          true
                              ? Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 50.w,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            widget.model.imgUrl!,
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        child: AppWidgets.text(
                                          text:
                                          "Insoniyat aynan qanday foyda beradi",
                                          color: AppColorUtils
                                              .TEXT_GREEN2,
                                          fontWeight:
                                          FontWeight.w600,
                                          fontSize: 14.sp,
                                          maxLines: 2,
                                        ).paddingOnly(top: 5.w),
                                        width: 240.w,
                                      ),
                                      AppWidgets.textLocale(
                                        text: "Eshonov Fakhriyor",
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColorUtils.DARK_6,
                                      ).paddingOnly(top: 3.w),
                                    ],
                                  ).paddingOnly(left: 10),
                                ],
                              ),
                              AppWidgets.text(
                                text: widget
                                    .model.infoModel![0].text!,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                color: AppColorUtils.TEXT_GREY2,
                                maxLines: 100,
                                height: 1.5,
                              ).paddingSymmetric(vertical: 15.w),
                              Divider(
                                thickness: 1,
                                color: AppColorUtils.BLACK_12,
                              ),
                              AppWidgets.text(
                                text: "Sizning javobingiz",
                                color: AppColorUtils.TEXT_GREEN2,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ).paddingOnly(top: 20.w),
                              AppWidgets.text(
                                text: widget
                                    .model.infoModel![0].text!,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                color: AppColorUtils.TEXT_GREY2,
                                maxLines: 100,
                                height: 1.5,
                              ).paddingSymmetric(vertical: 15.w),
                            ],
                          )
                              : Container(
                            child: Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 30.w,
                                  ),
                                  SvgPicture.asset(AppImageUtils
                                      .EMPTY_QUESTIONS),
                                  SizedBox(
                                    width: 200.sp,
                                    child: AppWidgets.textLocale(
                                      textAlign: TextAlign.center,
                                      text: LocaleKeys
                                          .questions_empty,
                                      color: AppColorUtils.DARK_4,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      maxLines: 2,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          );
        },
      ),
    );
  }
}
