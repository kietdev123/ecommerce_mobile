import 'package:ecommerce_mobile/ui/authentication/login_screen.dart';
import 'package:ecommerce_mobile/ui/test_screen.dart';
import 'package:flutter/material.dart';

import 'routes/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginScreen.id,
      onGenerateRoute: RouteGenerator().generateRoute,
    );
  }
}
