import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot/data/bloc/saved_page_cubit/saved_page_cubit.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/pages/saved_page/widgets/kraufanding_list_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

import '../../../data/localization/locale_keys.g.dart';
import '../../../data/services/navigator_service.dart';
import '../../../data/utils/app_image_utils.dart';
import '../notification_page/notification_page.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SavedPageCubit()..loadHistory(),
      child: BlocBuilder<SavedPageCubit, SavedPageState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            titleSpacing: 0,
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
                  text: LocaleKeys.saved,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w600,
                ),
                InkWell(
                  onTap: () {
                    NavigatorService.to.pushNamed(
                      NotificationPage.routeName,
                    );
                  },
                  child: SvgPicture.asset(
                    AppImageUtils.NOTIFICATION,
                    height: 35.w,
                    width: 35.w,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ).paddingAll(20),
          ),
          body: _buildBody(context, state),
        ),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    SavedPageState state,
  ) {
    if (state.isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state.hasError) {
      return Center(
        child: AppWidgets.imageSvg(path: AppImageUtils.IMG_WAIT),
      );
    }
    return Container(
      child: ListView(
        children: [
          KraufandingSavedListWidget(list: state.kraufandingSavedList)
        ],
      ),
    ).paddingAll(15);
  }
}
