import 'package:flutter/material.dart';
import 'package:q_ease/screens/auth/login_screen.dart';
import 'package:q_ease/screens/home/home_screen.dart';
import 'package:q_ease/screens/notifications/notifications_screen.dart';
import 'package:q_ease/screens/onboarding/onboarding_screen.dart';
import 'package:q_ease/screens/privacy-policy/privacy_policy_screen.dart';
import 'package:q_ease/screens/queue/queue_screen.dart';
import 'package:q_ease/screens/terms/terms_of_use_screen.dart';

class AppRoutes {
  static const String privacyPolicy = '/privacyPolicy';
  static const String termsOfUse = '/termsOfUse';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgotPassword';
  static const String home = '/home';
  static const String queue = '/queue';
  static const String queueDetails = '/queueDetails';
  static const String notifications = '/notifications';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case privacyPolicy:
        return MaterialPageRoute(builder: (_) => PrivacyPolicyScreen());
      case termsOfUse:
        return MaterialPageRoute(builder: (_) => TermsOfUseScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case  notifications:
        return MaterialPageRoute(builder: (_) => NotificationsScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case queue:
        return MaterialPageRoute(builder: (_) => QueueListingPage());

      default:
        return null; // Return null if route doesn't exist
    }
  }
}
