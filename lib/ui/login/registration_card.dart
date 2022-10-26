import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:provider/provider.dart';

class RegistrationCard extends StatefulWidget {
  const RegistrationCard({Key? key}) : super(key: key);

  @override
  _RegistrationCardState createState() => _RegistrationCardState();
}

class _RegistrationCardState extends State<RegistrationCard> {
  late FirebaseAuthService authService;

  @override
  void initState() {
    super.initState();
    authService = context.read<FirebaseAuthService>();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController orgNameController = TextEditingController();
  TextEditingController contNameController = TextEditingController();

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
                  controller: usernameController,
                  keyboardType: TextInputType.name,
                  style: const TextStyle(
                    color: Color(0xFFD1D0BD),
                    fontFamily: 'HelveticaNeue',
                  ),
                  cursorColor: const Color(0xFFD1D0BD),
                  decoration: const InputDecoration(
                    labelText: 'Username*',
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
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                    color: Color(0xFFD1D0BD),
                    fontFamily: 'HelveticaNeue',
                  ),
                  cursorColor: const Color(0xFFD1D0BD),
                  decoration: const InputDecoration(
                    labelText: 'Email*',
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
                    labelText: 'Password*',
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
                  controller: orgNameController,
                  keyboardType: TextInputType.name,
                  style: const TextStyle(
                    color: Color(0xFFD1D0BD),
                    fontFamily: 'HelveticaNeue',
                  ),
                  cursorColor: const Color(0xFFD1D0BD),
                  decoration: const InputDecoration(
                    labelText: 'Name of organisation',
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
                  controller: contNameController,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                    color: Color(0xFFD1D0BD),
                    fontFamily: 'HelveticaNeue',
                  ),
                  cursorColor: const Color(0xFFD1D0BD),
                  decoration: const InputDecoration(
                    labelText: 'Country',
                    labelStyle: TextStyle(color: Color(0xFFD1D0BD)),
                    border: InputBorder.none,
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () async {
                  final res = await authService.registerWithEmailAndPassword(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                    org: orgNameController.text.trim(),
                    username: usernameController.text.trim(),
                    country: contNameController.text.trim(),
                  );
                  // handle errors better as we need to check for weak password etc.
                  if (res == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Error Registering.",
                        ),
                      ),
                    );
                  }
                  Navigator.pop(context);
                },
                color: const Color(0xFFD1D0BD),
                clipBehavior: Clip.antiAlias,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  "Register",
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
                  "By registering you agree to the user agreement",
                  style: TextStyle(
                    color: Color(0xFFD1D0BD),
                    fontFamily: 'HelveticaNeue',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text.rich(
                  TextSpan(
                    text: "Already have an account?",
                    style: TextStyle(
                      color: Color(0xFFD1D0BD),
                      fontFamily: 'HelveticaNeue',
                    ),
                    children: [
                      TextSpan(
                        text: " Log In",
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
}
