import 'package:flutter/material.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:ifri/ui/home/home_forms.dart';
import 'package:ifri/ui/login/login_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ifri/constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FirebaseAuthService authService;
  SharedPreferences? _sharedPreferences;
  @override
  void initState() {
    super.initState();
    authService = context.read<FirebaseAuthService>();
    initialize();
  }

  void initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    final uid = user?.uid;
    print("UID : " + uid!);
    _sharedPreferences?.setString(Constants.USER_ID, uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () => _signOut(context),
                    child: Image.asset(
                      'assets/icons/ic_logout.png',
                      fit: BoxFit.cover,
                      width: 25,
                      height: 25,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/images/White Logo.png',
                      scale: 1.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 150,
              ),
              Container(
                width: 250,
                height: 75,
                decoration: BoxDecoration(
                  color: const Color(0xFF12160F),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: InkWell(
                  onTap: () => navigateToCapture(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/icons/ic_capture.png',
                        fit: BoxFit.cover,
                        width: 35,
                        height: 35,
                      ),
                      const Text(
                        'Capture',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: 250,
                height: 75,
                decoration: BoxDecoration(
                  color: const Color(0xFF505921),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: InkWell(
                  onTap: () => navigateToVisualize(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/icons/ic_visualize.png',
                        fit: BoxFit.cover,
                        width: 35,
                        height: 35,
                      ),
                      const Text(
                        'Visualize',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: 250,
                height: 75,
                decoration: BoxDecoration(
                  color: const Color(0xFF7D893B),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: InkWell(
                  onTap: () => navigateToDiscuss(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/icons/ic_discuss.png',
                        fit: BoxFit.fill,
                        width: 35,
                        height: 35,
                      ),
                      const Text(
                        'Discuss',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
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

  navigateToVisualize(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const HomeForms();
        },
      ),
    );
  }

  navigateToCapture(BuildContext context) {}

  navigateToDiscuss(BuildContext context) {}

  Future<void> _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const LoginPage();
        },
      ),
    );
  }
}
