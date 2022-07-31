import 'package:flutter/material.dart';
import 'package:ifri/services/auth_service/firebase_auth_impl.dart';
import 'package:provider/provider.dart';
import 'package:ifri/ui/section_b/screen1.dart';
import 'package:ifri/ui/section_c/screen12.dart';
import 'package:ifri/ui/section_d/screen29.dart';

class HomeForms extends StatefulWidget {
  const HomeForms({Key? key}) : super(key: key);

  @override
  _HomeFormsState createState() => _HomeFormsState();
}

class _HomeFormsState extends State<HomeForms> {
  late FirebaseAuthService authService;
  @override
  void initState() {
    super.initState();
    authService = context.read<FirebaseAuthService>();
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
                  color: const Color(0xFF505921),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: InkWell(
                  onTap: () => navigateToSectionB(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        'Section B',
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
                  onTap: () => navigateToSectionC(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        'Section C',
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
                  onTap: () => navigateToSectionD(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        'Section D',
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

  navigateToSectionB(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const Screen1();
        },
      ),
    );
  }

  navigateToSectionC(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const Screen12();
        },
      ),
    );
  }

  navigateToSectionD(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return const Screen29();
        },
      ),
    );
  }
}
