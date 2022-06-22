import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/charity_page_cubit/charity_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/charity_page/widgets/detail_body_part2.dart';
import 'package:najot/ui/pages/crowd_founding_page_main/project_details/widgets/comment_to_author_dialog.dart';
import 'package:najot/ui/pages/crowd_founding_page_main/project_details/widgets/comments_widget.dart';
import 'package:najot/ui/pages/crowd_founding_page_main/project_details/widgets/kraudfanding_authot_widget.dart';
import 'package:najot/ui/pages/crowd_founding_page_main/project_details/widgets/more_widget.dart';
import 'package:najot/ui/pages/crowd_founding_page_main/project_details/widgets/news_widget.dart';
import 'package:najot/ui/pages/crowd_founding_page_main/project_details/widgets/payment_history_dialog.dart';
import 'package:najot/ui/pages/crowd_founding_page_main/project_details/widgets/question_asked_widget.dart';
import 'package:najot/ui/pages/crowd_founding_page_main/project_details/widgets/support_project_dialog.dart';
import 'package:najot/ui/pages/home_page/widget/button_card_widget.dart';
import 'package:najot/ui/widgets/app_bar_with_title.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class CharityFullPage extends StatefulWidget {
  const CharityFullPage({required this.cardModel, Key? key}) : super(key: key);

  static const String routName = 'charityFullPage';
  static int tabChange = 0;
  final CardModel cardModel;

  @override
  State<CharityFullPage> createState() => _CharityFullPageState();
}

class _CharityFullPageState extends State<CharityFullPage>
    with TickerProviderStateMixin {
  late TabController _controller;

  CharityCubit cubit = CharityCubit();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
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
        backgroundColor: AppColorUtils.background,
        appBar: AppBarWithTitle(
          title: LocaleKeys.about_project.tr(),
          onPress: () {
            NavigatorService.to.pop();
          },
        ),
        body: BlocBuilder<CharityCubit, CharityState>(
          builder: (context, state) {
            return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
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
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: widget.cardModel.image!,
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
                              Positioned(
                                bottom: 120.w,
                                right: 0,
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const PaymentHistoryDialog();
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: 35.w,
                                    width: 60.w,
                                    decoration: const BoxDecoration(
                                      color: AppColorUtils.bluePercent,
                                      borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(12),
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.monetization_on_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          AppWidgets.text(
                            text:
                                "Drenajni kuzatish uchun mo’jallangan moslama",
                            fontSize: 20.sp,
                            color: AppColorUtils.dark2,
                            fontWeight: FontWeight.w500,
                            maxLines: 2,
                          ).paddingSymmetric(horizontal: 20.w),
                          KraudfandingAuthorWidget(
                            model: widget.cardModel,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const CommentToAuthorDialog();
                                },
                              );
                            },
                          ).paddingOnly(top: 15.w),
                          SizedBox(height: 12.w),
                          DetailBodyPart2(cardModel: widget.cardModel)
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
                              labelColor: AppColorUtils.greenApp,
                              unselectedLabelColor: AppColorUtils.dark6,
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
                              indicatorColor: AppColorUtils.greenApp,
                              indicatorSize: TabBarIndicatorSize.tab,
                              padding: const EdgeInsets.only(right: 10),
                              indicatorPadding:
                                  const EdgeInsets.only(right: 10, left: 10),
                              labelPadding:
                                  const EdgeInsets.only(right: 10, left: 10),
                            ).paddingOnly(left: 15.w, top: 8.w),
                            Container(
                              child: [
                                MoreWidget(
                                  cardModel: widget.cardModel,
                                ),
                                NewsWidget(
                                  cardModel: widget.cardModel,
                                ).paddingAll(20.w),
                                QuestionsAskedWidget(
                                  cardModel: widget.cardModel,
                                ).paddingAll(20.w),
                                CommentsWidget(
                                  cardModel: widget.cardModel,
                                ).paddingAll(20.w)
                              ][_controller.index],
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
                                        return const SupportProjectDialog();
                                      },
                                    );
                                  },
                                  text: LocaleKeys.project_implementation,
                                  height: 48.w,
                                  width: 274.w,
                                  color: AppColorUtils.percentColor,
                                  textSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  textColor: AppColorUtils.white,
                                ),
                                AppWidgets.favouriteButton(
                                  select: widget.cardModel.isFavorite!,
                                  height: 48.w,
                                  width: 48.w,
                                  onTap: () {},
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
