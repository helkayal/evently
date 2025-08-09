import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveOnboradingStatus() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('onboarding_completed', true);
}

Future<bool> isOnboardingCompleted() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('onboarding_completed') ?? false;
}

Future<void> clearOnboardingStatus() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('onboarding_completed');
}
