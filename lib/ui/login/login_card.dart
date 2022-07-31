import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:ifri/ui/login/registration_page.dart';
import 'package:provider/provider.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({Key? key}) : super(key: key);

  @override
  _LoginCardState createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
        child: Container(
          padding: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                    color: Color(0xFFD1D0BD),
                    fontFamily: 'HelveticaNeue',
                  ),
                  cursorColor: const Color(0xFFD1D0BD),
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Color(0xFFD1D0BD)),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  style: const TextStyle(
                    color: Color(0xFFD1D0BD),
                    fontFamily: 'HelveticaNeue',
                  ),
                  cursorColor: const Color(0xFFD1D0BD),
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Color(0xFFD1D0BD)),
                    border: InputBorder.none,
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () async {
                  final res = await context
                      .read<FirebaseAuthService>()
                      .loginWithEmailAndPassword(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      );
                  if (res == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Error logging in. Please check your credential",
                        ),
                      ),
                    );
                    return;
                  } else {
                    navigateToNextScreen(context);
                  }
                },
                color: const Color(0xFFD1D0BD),
                clipBehavior: Clip.antiAlias,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  "Log in",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF12160F),
                    fontFamily: 'HelveticaNeue',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot your password?",
                  style: TextStyle(
                    color: Color(0xFFD1D0BD),
                    fontFamily: 'HelveticaNeue',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegistrationPage(),
                    ),
                  );
                },
                child: const Text.rich(
                  TextSpan(
                    text: "Don’t have an account?",
                    style: TextStyle(
                      color: Color(0xFFD1D0BD),
                      fontFamily: 'HelveticaNeue',
                    ),
                    children: [
                      TextSpan(
                        text: " Create One",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  navigateToNextScreen(BuildContext context) {
    Navigator.of(context).popAndPushNamed('/home');
  }
}
