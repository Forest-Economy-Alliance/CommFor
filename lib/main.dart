import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ifri/constants/constants.dart';
import 'package:ifri/constants/section_b.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:ifri/ui/home/home_page.dart';
import 'package:ifri/ui/login/login_wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ifri/ui/section_c/screen12.dart';
import 'package:ifri/ui/section_b/screen6.dart';
import 'package:ifri/ui/section_b/screen7.dart';
import 'package:ifri/ui/section_b/screen8.dart';
import 'package:ifri/ui/section_b/screen9.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

SharedPreferences? _sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // db.settings = const Settings(persistenceEnabled: true);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initialize();
  }

  void initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences?.setString(Constants.USER_ID, "3");
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthService>(create: (_) => FirebaseAuthService()),
      ],
      child: MaterialApp(
        title: 'IFRI',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        initialRoute: '/',
        routes: {
          '/': (BuildContext ctx) {
            return const Screen12();
          },
          '/login': (BuildContext ctx) {
            return const LoginWrapper();
          },
          '/section_b_screen_6': (BuildContext ctx) {
            return const Screen6();
          },
          '/section_b_screen_7': (BuildContext ctx) {
            return const Screen7();
          },
          '/section_b_screen_8': (BuildContext ctx) {
            return const Screen8();
          },
          '/section_b_screen_9': (BuildContext ctx) {
            return const Screen9();
          }
        },
      ),
    );
  }
}
