import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:najot/data/bloc/app_page_cubit/app_page_cubit.dart';
import 'package:najot/data/services/root_service.dart';
import 'package:najot/ui/pages/home_page/home_page.dart';
import 'package:najot/ui/pages/language_page/language_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5)).then((value) {
      moveToNextPage();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  moveToNextPage() {
    var token = RootService.hiveService.getToken();
    if (token == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage(
              appPageType: AppPageType.MAIN,
            );
          },
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LanguagePage();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          "assets/splash_screen/loader.json",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
