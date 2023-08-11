import 'package:flutter/cupertino.dart';
import 'package:oauth_demo_app/screens/home_screen.dart';
import 'package:oauth_demo_app/screens/sign_in_screen.dart';
import 'package:oauth_demo_app/screens/splash_screen.dart';

//
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
};
