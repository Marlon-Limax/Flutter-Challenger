import 'package:flutter/material.dart';
import 'package:flutter_challenger/routes/app_route.dart';
import 'package:flutter_challenger/src/pages/auth/login_page.dart';
import 'package:flutter_challenger/src/pages/home/home_tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greengrocer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),

      routes: {
        AppRoutes.login: (ctx) => const LoginPage(),
        AppRoutes.home: (ctx) => const HomeTab(),
      },
      initialRoute: AppRoutes.login,
    );
  }
}
