import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ifri/ui/login/registration_card.dart';

/// Temporary Registration Page will be merged to login page with animation overtime
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFF12160F),
      body: SafeArea(
        child: Container(
          height: mediaQuery.size.height,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/BG Image@2x.png'),
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(top: 200),
              child: Column(
                children: const [
                  RegistrationCard(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
