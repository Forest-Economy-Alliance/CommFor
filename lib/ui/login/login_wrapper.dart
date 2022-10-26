import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:ifri/ui/home/home_page.dart';
import 'package:ifri/ui/login/login_page.dart';
import 'package:provider/provider.dart';

class LoginWrapper extends StatefulWidget {
  const LoginWrapper({Key? key}) : super(key: key);

  @override
  State<LoginWrapper> createState() => _LoginWrapperState();
}

class _LoginWrapperState extends State<LoginWrapper> {
  late FirebaseAuthService authService;
  @override
  void initState() {
    super.initState();
    authService = context.read<FirebaseAuthService>();
    // send the user to homepage if user is logged in
    // temporaryly this should be placed as
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Future<void>.delayed(
        const Duration(milliseconds: 500),
        () {
          if (mounted) {
            setState(() {
              if (authService.user != null) {
                Navigator.pushReplacementNamed(context, '/');
              }
            });
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authService.authStream,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return const HomePage();
        }
        return const LoginPage();
      },
    );
  }
}
