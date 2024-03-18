import 'package:ecommerce_mobile/bloc/authentication/authentication_bloc.dart';
import 'package:ecommerce_mobile/ui/authentication/sign_in_screen.dart';
import 'package:ecommerce_mobile/ui/setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter/counter_bloc.dart';
import '../ui/test_screen.dart';

class RouteGenerator {
  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case TestScreen.id:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => CounterBloc(),
            child: const TestScreen(),
          ),
        );

      case SignInScreen.id:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AuthenticationBloc(),
            child: const SignInScreen(),
          ),
        );

      case SettingScreen.id:
        return MaterialPageRoute(
          builder: (_) => SettingScreen(),
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
