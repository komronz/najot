


import 'package:flutter/material.dart';

import '../../../../data/bloc/crowdFounding_cubit/kraud_fanding_cubit.dart';
import 'crowdfunding_mini_card_widget.dart';

class TabProjects extends StatelessWidget {
  TabProjects({
    required this.tabController,
    required this.state,
  });

  TabController tabController;
  CrowdfundingState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: List.generate(
        state.category.length,
            (index) => GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          physics: ClampingScrollPhysics(),
          childAspectRatio: 160 / 267,
          padding: EdgeInsets.all(0),
          reverse: false,
          crossAxisSpacing: 8,
          mainAxisSpacing: 6,
          children: List.generate(
            state.tabProjects.length,
                (index) => CrowdfundingMiniCardWidget(
              changeLike: () async {
                await CrowdfundingCubit.to.changeLike(
                  state.tabProjects[index].id!,
                );
              },
              cubit: CrowdfundingCubit.to,
              visible: true,
              cardModel: state.tabProjects[index],
            ),
          ),
        ),
      )[tabController.index],
    );
  }
}