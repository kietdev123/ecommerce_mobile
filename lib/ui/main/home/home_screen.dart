import 'package:ecommerce_mobile/bloc/authentication/authentication_bloc.dart';
import 'package:ecommerce_mobile/bloc/authentication/authentication_event.dart';
import 'package:ecommerce_mobile/bloc/authentication/authentication_state.dart';
import 'package:ecommerce_mobile/bloc/product_type/product_type_bloc.dart';
import 'package:ecommerce_mobile/bloc/product_type/product_type_state.dart';
import 'package:ecommerce_mobile/main.dart';
import 'package:ecommerce_mobile/res/resources.dart';
import 'package:ecommerce_mobile/ui/main/setting/setting_screen.dart';
import 'package:ecommerce_mobile/ui/utils/utils.dart';
import 'package:ecommerce_mobile/ui/widgets/custom_card.dart';
import 'package:ecommerce_mobile/ui/widgets/padding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:ionicons/ionicons.dart';

import '../../../res/app_locale.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "home_screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  bool isLoading = false;
  bool isObscure = true;
  late AuthenticationBloc _authenticationBloc;
  late ProductTypeBloc _productTypeBloc;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      EasyLoading.dismiss();
    });

    _authenticationBloc = BlocProvider.of(context);
    _productTypeBloc = BlocProvider.of(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final resource = Resources(context);
    final productTypeContent = BlocConsumer<ProductTypeBloc, ProductTypeState>(
      builder: (context, state) {
        if (state is ProductTypeSuccess) {
          if (state.data != null) {
            return Column(children: [Text(state.data!.genders.toString())]);
          }
        }
        return Column();
      },
      listener: (context, state) async {},
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: PaddingScreen(
            child: Column(children: [
              Text('Home screen'),
              BlocConsumer<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  if (state is AuthenticationSuccess)
                    return Column(children: [
                      ...[
                        Text(state.uid.toString()),
                        Text(state.name.toString()),
                        Text(state.emailAddress.toString()),
                        Text(state.profilePhoto.toString()),
                      ],
                      ElevatedButton(
                          onPressed: () async {
                            if (!(state is AuthenticationLoading))
                              _authenticationBloc.add(SignOutEvent());
                          },
                          child: Text('Sign out'))
                    ]);
                  return Column();
                },
                listener: (context, state) async {
                  if (state is AuthenticationLoading) {
                    // EasyLoading.show();
                  } else if (state is AuthenticationSuccess) {
                    EasyLoading.dismiss();
                  } else if (state is AuthenticationError) {
                    EasyLoading.dismiss();

                    EasyLoading.showError(state.error.toString(),
                        duration: const Duration(seconds: 2));
                  }
                },
              ),
              productTypeContent,
            ]),
          ),
        ),
      ),
    );
  }
}
