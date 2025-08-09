import 'package:evently/data/prefs_utils.dart';
import 'package:evently/ui/utils/app_assets.dart';
import 'package:evently/ui/utils/app_routes.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      checkOnboardingStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        Theme.of(context).brightness == Brightness.light
            ? AppAssets.splashLight
            : AppAssets.splashDark,
        fit: BoxFit.fill,
      ),
    );
  }

  Future<void> checkOnboardingStatus() async {
    bool completed = await isOnboardingCompleted();
    if (mounted) {
      if (completed) {
        Navigator.pushReplacement(context, AppRoutes.login);
      } else {
        Navigator.pushReplacement(context, AppRoutes.onboarding);
      }
    }
  }
}
