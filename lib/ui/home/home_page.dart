import 'package:flutter/material.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FirebaseAuthService authService;
  @override
  void initState() {
    super.initState();
    authService = context.read<FirebaseAuthService>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Homepage"), actions: [
        IconButton(
          onPressed: () {
            authService.logout();
          },
          icon: const Icon(
            Icons.logout,
          ),
        )
      ]),
      backgroundColor: const Color(0xFF12160F),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/BG Image@2x.png'),
            ),
          ),
        ),
      ),
    );
  }
}
