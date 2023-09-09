import 'package:flutter/material.dart';
import 'package:mymoney/src/modules/history/history_page.dart';
import 'package:mymoney/src/modules/home/pages/home_page.dart';
import 'package:mymoney/src/modules/initial/page/initial_page.dart';
import 'package:mymoney/src/modules/login/page/login_page.dart';
import 'package:mymoney/src/modules/personalRegister/pages/personalRegister_page.dart';
import 'package:mymoney/src/modules/registers/pages/register_page.dart';
import 'package:mymoney/src/router/app_router.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Money',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const InitialPage(),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      routes: {
        AppRouter.login: (context) => const LoginPage(),
        AppRouter.register: (context) => const RegisterPage(),
        AppRouter.personalRegister: (context) => const PersonalRegisterPage(),
        AppRouter.home: (context) => const HomePage(),
        AppRouter.history: (context) => const HistoryPage(),
      },
    );
  }
}
