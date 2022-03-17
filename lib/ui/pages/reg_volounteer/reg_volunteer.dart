import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:najot/data/config/const/decoration_const.dart';
import 'package:najot/data/extensions/context_extension.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/styles/app_colors.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/widgets/app_radio_button.dart';
import 'package:najot/ui/widgets/app_text_field.dart';
import 'package:najot/ui/widgets/app_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class RegVolunteer extends StatelessWidget {
  const RegVolunteer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = PageController();
    return Scaffold(
      backgroundColor: AppColorUtils.BACKGROUND,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        titleSpacing: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              child: SvgPicture.asset(
                AppImageUtils.MENU,
                height: 35.w,
                width: 35.w,
              ),
              onTap: () {
                HomePage.globalKey.currentState!.openDrawer();
              },
            ),
            AppWidgets.textLocale(
              text: "Volontyor bo'lish",
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
            SvgPicture.asset(
              AppImageUtils.NOTIFICATION,
              height: 35.w,
              width: 35.w,
            )
          ],
        ).paddingSymmetric(horizontal: 20),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: context.width,
                  height: 280.w,
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                ),
                Align(
                  alignment: Alignment.center,
                  child: AppWidgets.imageAsset(
                    path: AppImageUtils.IMG_VOLUNTEER,
                    height: 204.w,
                    width: 160.w,
                  ).paddingOnly(top: 40.w),
                )
              ],
            ).paddingOnly(top: 18),
            AppWidgets.text(
              text:
                  "Iltimos volontyor bo’lish uchun quyidagi formani to’ldiring.",
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColorUtils.DARK2,
              maxLines: 2,
              textAlign: TextAlign.center,
            ).paddingOnly(
              top: 18,
              left: 22,
              right: 22,
            ),
            AppWidgets.starTextWidget(
              text: "amaldagi barcha ma’lumotlaringiz o’zgaradi",
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              isCenter: true,
            ).paddingOnly(top: 6),
            Container(
              decoration: DecorationConst.DEC_WITH_SHADOW,
              child: Column(
                children: [
                  Container(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 2,
                      effect: WormEffect(
                        dotColor: AppColorUtils.INDICATOR,
                        activeDotColor: AppColorUtils.GREEN_APP,
                      ),
                    ),
                  ).paddingOnly(top: 18),
                  Container(
                    height: 600.w,
                    child: PageView(
                      controller: controller,
                      children: [
                        Page1(),
                        Container(
                          height: 300,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          hintText: "Abdumalik",
          onChanged: (v) {},
          title: "Ism (pasportda qanday bo'lsa)",
        ).paddingOnly(top: 18),
        AppTextField(
          hintText: "Sapokulov",
          onChanged: (v) {},
          title: "Familiya (pasportda qanday bo'lsa)",
        ).paddingOnly(top: 24),
        AppTextField(
          hintText: "Manzilni kiriting",
          onChanged: (v) {},
          title: "Manzil",
        ).paddingOnly(top: 24),
        AppRadioButton(
          onChanged: (v) {
            print(v);
          },
        ).paddingOnly(top: 20, left: 20),
        AppDatePicker(),
        ElevatedButton(
            onPressed: () async {
              await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2010),
                lastDate: DateTime(2022),
              );
            },
            child: Text("sd;gjdnfbdfn"))
      ],
    );
  }
}

class AppDatePicker extends StatefulWidget {
  const AppDatePicker({Key? key}) : super(key: key);

  @override
  _AppDatePickerState createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 50.w,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColorUtils.BORDER_COLOR,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_today_sharp,
              color: AppColorUtils.KRAUDFANDING,
              size: 22,
            ).paddingOnly(left: 20),
            AppWidgets.text(
              text: "Tanlang",
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: AppColorUtils.KRAUDFANDING,
            ).paddingOnly(left: 15),
          ],
        ),
      ).paddingSymmetric(
        horizontal: 20,
        vertical: 24,
      ),
      onTap: () async {
        showDialog(
            context: context,
            builder: (context) => AppDatePickerWidget(
                  selectFunction: () {},
                ));
        // await _selectDate(context);
        // print('open date picker');
        // var date = await showDatePicker(
        //   context: context,
        //   initialDate: DateTime.now(),
        //   firstDate: DateTime(1996),
        //   lastDate: DateTime(2022),
        // );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000, 1, 1),
      lastDate: DateTime(2022),
    );
  }
}

class AppDatePickerWidget extends StatelessWidget {
  AppDatePickerWidget({
    required this.selectFunction,
    Key? key,
  }) : super(key: key);
  final Function selectFunction;
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: EdgeInsets.all(20.0),
          padding: EdgeInsets.all(15.0),
          // height: 180.0,
          decoration: ShapeDecoration(
            color: AppColors.WHITE,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 24.sp,
                  ),
                  AppWidgets.text(
                    text: "Sanani tanlang",
                    fontSize: 20.sp,
                    color: AppColorUtils.DARK2,
                    fontWeight: FontWeight.w600,
                  ).paddingOnly(left: 8)
                ],
              ).paddingOnly(
                top: 20,
                bottom: 18,
              ),
              Container(
                height: 280.h,
                child: SfDateRangePicker(
                  onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
                    dateTime =
                        dateRangePickerSelectionChangedArgs.value as DateTime;
                  },
                  selectionMode: DateRangePickerSelectionMode.single,
                  allowViewNavigation: true,
                  toggleDaySelection: true,
                  showNavigationArrow: true,
                  navigationMode: DateRangePickerNavigationMode.snap,
                  view: DateRangePickerView.month,
                  monthViewSettings: DateRangePickerMonthViewSettings(
                    weekNumberStyle: DateRangePickerWeekNumberStyle(
                      textStyle: TextStyle(color: AppColorUtils.RED),
                      backgroundColor: AppColors.RED,
                    ),
                    viewHeaderStyle: DateRangePickerViewHeaderStyle(
                      textStyle: GoogleFonts.lato(
                        color: AppColorUtils.DARK_6,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    firstDayOfWeek: 1,
                  ),
                  headerStyle: DateRangePickerHeaderStyle(
                    textStyle: GoogleFonts.lato(
                      color: AppColors.BLACK,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  monthCellStyle: DateRangePickerMonthCellStyle(
                    textStyle: TextStyle(color: Colors.black),
                    todayTextStyle: TextStyle(color: Colors.black),
                  ),
                  selectionColor: AppColorUtils.PERCENT_COLOR,
                  yearCellStyle: DateRangePickerYearCellStyle(
                      todayTextStyle: TextStyle(color: Colors.black)),
                  todayHighlightColor: AppColorUtils.PERCENT_COLOR,
                  startRangeSelectionColor: AppColorUtils.PERCENT_COLOR,
                  selectionShape: DateRangePickerSelectionShape.circle,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: AppWidgets.appButton(
                      color: AppColorUtils.LIGHT_GRAY,
                      textColor: AppColorUtils.BLACK,
                      onTap: () {
                        NavigatorService.to.pop();
                      },
                      title: "Chiqish",
                    ).paddingOnly(top: 20.h),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: AppWidgets.appButton(
                      onTap: () {
                        selectFunction(dateTime);
                        NavigatorService.to.pop();
                      },
                      title: "Saqlash",
                    ).paddingOnly(top: 20.h),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
