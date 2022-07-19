import 'package:flutter/material.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:ifri/ui/home/home_page.dart';
import 'package:ifri/ui/login/login_wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // db.settings = const Settings(persistenceEnabled: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        initialRoute: '/login',
        routes: {
          '/': (BuildContext ctx) {
            return const HomePage();
          },
          '/login': (BuildContext ctx) {
            return const LoginWrapper();
          }
        },
      ),
    );
  }
}
