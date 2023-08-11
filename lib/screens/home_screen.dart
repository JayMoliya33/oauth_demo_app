import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oauth_demo_app/screens/sign_in_screen.dart';
import 'package:oauth_demo_app/service/auth_service.dart';
import 'package:oauth_demo_app/utils/common_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String routeName = "/home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleSignInAccount? currentUser;

  @override
  void initState() {
    super.initState();

    AuthenticationService.isSignedIn().then((value) {
      if (value == true) {
        _getCurrentUser();
      }
    });
  }

  Future<void> _getCurrentUser() async {
    final GoogleSignInAccount? googleUser =
        await AuthenticationService.googleUser();
    setState(() {
      currentUser = googleUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const SizedBox(),
        backgroundColor: Colors.blue,
        title: const Text('Home Page', style: TextStyle(color: Colors.white)),
      ),
      body: currentUser != null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Name',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.purple,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    currentUser!.displayName!,
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Email',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.purple,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    currentUser!.email,
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 30),

                  // Sign out button
                  ElevatedButton(
                    onPressed: () => signOut(),
                    child: const Text('Sign out'),
                  ),
                ],
              ),
            )
          : const Center(
              child: Text(
                'Please Sign In',
                style: TextStyle(fontSize: 15),
              ),
            ),
    );
  }

  signOut() {
    try {
      AuthenticationService.signOut();
      setSignInStatus(false);
      navigateWithPushNamedAndRemoveUntil(context, SignInScreen.routeName);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error signing out. Try again.')));
    }
  }
}
