import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oauth_demo_app/service/auth_service.dart';
import 'package:oauth_demo_app/utils/common_widget.dart';

import 'home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static String routeName = "/sign_in_screen";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 250),
            Image.asset(
              'assets/images/img_flutter.png',
              height: 150,
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => signIn(),
              child: const Text('Sign in with Google'),
            ),
          ],
        ),
      ),
    );
  }

  signIn() async {
    // perform login
    await AuthenticationService.login().then((user) {
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Error occurred using Google Sign In. Try again.')));
      } else {
        setSignInStatus(true);
        navigateWithPushNamedAndRemoveUntil(context, HomeScreen.routeName);
      }
    });
  }
}
