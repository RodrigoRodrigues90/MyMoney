import 'package:flutter/material.dart';
import 'package:mymoney/src/home/page/login_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const LoginPage(title: 'MyMoney'),
    );
  }
}
