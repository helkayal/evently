import 'package:evently/data/prefs_utils.dart';
import 'package:evently/ui/utils/app_assets.dart';
import 'package:evently/ui/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
      backgroundColor: primaryColor,
      body: IntroductionScreen(
        key: introKey,
        allowImplicitScrolling: false,
        infiniteAutoScroll: false,
        globalHeader: SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Image.asset(
                AppAssets.appHorizontalLogo,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        bodyPadding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.15,
        ),
        pages: pageViewModelsList(),
        onDone: () => onOnvoardingDone(),
        showSkipButton: false,
        skipOrBackFlex: 0,
        nextFlex: 0,
        showBackButton: true,
        back: Icon(
          Icons.arrow_circle_left_outlined,
          color: primaryColor,
          size: 40,
        ),
        next: Icon(
          Icons.arrow_circle_right_outlined,
          color: primaryColor,
          size: 40,
        ),
        done: Icon(
          Icons.arrow_circle_right_outlined,
          color: primaryColor,
          size: 40,
        ),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        dotsDecorator: DotsDecorator(
          size: Size(8.0, 8.0),
          color: Theme.of(context).colorScheme.secondary,
          activeSize: Size(24.0, 8.0),
          activeColor: primaryColor,
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        controlsPadding: const EdgeInsets.all(10.0),
      ),
    );
  }

  List<PageViewModel> pageViewModelsList() {
    PageDecoration pageDecoration = PageDecoration(
      titleTextStyle: Theme.of(context).textTheme.titleMedium!,
      imagePadding: EdgeInsets.only(top: 50),
    );
    return [
      PageViewModel(
        title: "Find Events That Inspire You",
        bodyWidget: Text(
          "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
          style: Theme.of(context).textTheme.labelSmall,
          textAlign: TextAlign.left,
        ),
        image: Image.asset(
          Theme.of(context).brightness == Brightness.light
              ? AppAssets.onboardingLight1
              : AppAssets.onboardingDark1,
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: "Effortless Event Planning",
        bodyWidget: Text(
          "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
          style: Theme.of(context).textTheme.labelSmall,
          textAlign: TextAlign.left,
        ),
        image: Image.asset(
          Theme.of(context).brightness == Brightness.light
              ? AppAssets.onboardingLight2
              : AppAssets.onboardingDark2,
        ),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: "Connect with Friends & Share Moments",
        bodyWidget: Text(
          "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
          style: Theme.of(context).textTheme.labelSmall,
          textAlign: TextAlign.left,
        ),
        image: Image.asset(
          Theme.of(context).brightness == Brightness.light
              ? AppAssets.onboardingLight3
              : AppAssets.onboardingDark3,
        ),
        decoration: pageDecoration,
      ),
    ];
  }

  void onOnvoardingDone() async {
    await saveOnboradingStatus();
    if (mounted) Navigator.pushReplacement(context, AppRoutes.login);
  }
}
