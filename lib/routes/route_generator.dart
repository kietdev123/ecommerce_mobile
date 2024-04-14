import 'package:ecommerce_mobile/bloc/authentication/authentication_bloc.dart';
import 'package:ecommerce_mobile/ui/authentication/login_screen.dart';
import 'package:ecommerce_mobile/ui/authentication/sign_up_screen.dart';
import 'package:ecommerce_mobile/ui/home/home_screen.dart';
import 'package:ecommerce_mobile/ui/setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter/counter_bloc.dart';
import '../ui/test_screen.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      // case TestScreen.id:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (_) => CounterBloc(),
      //       child: const TestScreen(),
      //     ),
      //   );

      case LoginScreen.id:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      case SettingScreen.id:
        return MaterialPageRoute(
          builder: (_) => SettingScreen(),
        );

      case HomeScreen.id:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case SignUpScreen.id:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error while loading new page'),
        ),
      );
    });
  }
}
