import 'package:flutter/material.dart';
import 'package:q_ease/routes.dart';
import 'package:q_ease/screens/auth/login_screen.dart';
import 'package:q_ease/screens/home/home_screen.dart';
import 'package:q_ease/screens/onboarding/onboarding_screen.dart';
import 'package:q_ease/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});
  
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget _initialScreen = CircularProgressIndicator();

  @override
  void initState() {
    super.initState();
    _checkInitialScreen();
  }
  // This widget is the root of your application.
  Future<void> _checkInitialScreen() async {
    final prefs = await SharedPreferences.getInstance();
    final hasViewedOnboarding = prefs.getBool('hasViewedOnboarding') ?? false;
    final userToken = prefs.getString('userToken');
    final userId = prefs.getInt('userId');

    print('hasViewedOnboarding: $hasViewedOnboarding | userToken: $userToken | userId: $userId');

    setState(() {
      if (!hasViewedOnboarding) {
        _initialScreen = OnboardingScreen();
      } else if (userToken == null || userToken.isEmpty) {
        _initialScreen = LoginScreen();
      } else {

        _initialScreen = HomeScreen();
      
        }
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QEase',
      theme: AppTheme.theme,
      home: _initialScreen,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
