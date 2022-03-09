import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/bloc/intro_page_bloc/intro_cubit.dart';
import 'package:najot/ui/pages/intro_page/widgets/intro_page_one_widget.dart';
import 'package:najot/ui/pages/intro_page/widgets/intro_page_three_widget.dart';
import 'package:najot/ui/pages/intro_page/widgets/intro_page_two_widget.dart';
import 'package:najot/ui/pages/intro_page/widgets/intro_view_widgets.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);
  static const String routeName = "/introPage";

  @override
  Widget build(BuildContext buildContext) {
    return BlocProvider(
      create: (context) => IntroCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<IntroCubit, IntroState>(builder: (context, state) {
          if (state is IntroPageNextState) {
            return Stack(
              children: [
                PageView(
                  onPageChanged: (int page) {
                    context.read<IntroCubit>().changePageNext(page);
                  },
                  controller: context.read<IntroCubit>().pageController,
                  children: [
                    IntroPageOneWidget(
                      image: 'assets/images/splash_1.png',
                      content:
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                      title: 'Ehson',
                    ),
                    IntroPageTwoWidget(
                      title: "Kraudfanding",
                      content:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
                      image: "assets/images/splash_2.png",
                    ),
                    IntroPageThreeWidget(
                        image: "assets/images/splash_3.png",
                        title: "Volontyorlik",
                        content:
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry"),
                  ],
                ),
                Positioned(
                  top: 72,
                  left: 148,
                  child: Container(
                    height: 19.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildIndicator(state),
                    ),
                  ),
                ),
                Column(
                  children: [
                    if (state.currentIndex == 0) ...[
                      viewOfOnePage(context),
                    ] else if (state.currentIndex == 1) ...[
                      viewOfTwoPage(context,state),
                    ] else ...[
                      viewOfThreePage(context,state),
                    ]
                  ],
                ),
              ],
            );
          }
          return Center(
            child: Text("null"),
          );
        }),
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      height: isActive ? 20 : 19,
      width: isActive ? 26 : 19,
      margin: const EdgeInsets.only(right: 7),
      decoration: BoxDecoration(
          color: isActive ? Color(0xFF0BBF90) : Colors.white,
          borderRadius: BorderRadius.circular(11)),
    );
  }

  List<Widget> _buildIndicator(IntroPageNextState state) {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (state.currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
