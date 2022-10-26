import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';

import 'package:ifri/services/discussion_service/discussion_service_impl.dart';

import 'package:ifri/splash.dart';

import 'package:ifri/ui/home/home_page.dart';
import 'package:ifri/ui/login/login_wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ifri/ui/section_b/screen6.dart';
import 'package:ifri/ui/section_b/screen7.dart';
import 'package:ifri/ui/section_b/screen8.dart';
import 'package:ifri/ui/section_b/screen9.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter/services.dart';

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
  static final baseDioOptions = BaseOptions(
    baseUrl: "https://commfor-api-2ihfjenfvq-em.a.run.app/api",
    receiveTimeout: 60000,
    sendTimeout: 15000,
    queryParameters: {
      "key": "d62eed08684123e262e95b5abc95f97c3866b514c75a591b8b9a77bc72ee3b92"
    },
  );
  final dio = Dio(baseDioOptions);
  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(responseBody: true));
    } else {
      dio.interceptors.add(LogInterceptor(responseBody: false));
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthService>(create: (_) => FirebaseAuthService()),
        Provider<Dio>(create: (_) => dio),
        Provider<DiscussionService>(create: (_) => DiscussionService())
      ],
      child: MaterialApp(
        title: 'IFRI',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        initialRoute: '/splash',
        routes: {
          '/': (BuildContext ctx) {
            return const HomePage();
          },
          '/splash': (BuildContext ctx) {
            return const Splash();
          },
          '/login': (BuildContext ctx) {
            return const LoginWrapper();
          },
        },
      ),
    );
  }
}
