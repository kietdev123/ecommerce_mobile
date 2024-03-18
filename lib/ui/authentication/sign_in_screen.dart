import 'package:ecommerce_mobile/bloc/authentication/authentication_bloc.dart';
import 'package:ecommerce_mobile/bloc/authentication/authentication_event.dart';
import 'package:ecommerce_mobile/bloc/authentication/authentication_state.dart';
import 'package:ecommerce_mobile/res/resources.dart';
import 'package:ecommerce_mobile/ui/setting/setting_screen.dart';
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

import '../../res/app_locale.dart';

class SignInScreen extends StatefulWidget {
  static const String id = "sign_in_screen";
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  bool isLoading = false;
  bool isObscure = true;

  late AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final resource = Resources(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: PaddingScreen(
          child: Column(children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Add TextFormFields and ElevatedButton here.
                  // IconButton(
                  //     padding: const EdgeInsets.all(0),
                  //     onPressed: () {},
                  //     icon: ),
                  const SizedBox(height: 24),
                  const Icon(Icons.arrow_back_ios),
                  const SizedBox(height: 12),
                  Text(
                    AppLocale.signUp.getString(context),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const SizedBox(height: 36),

                  CustomCard(
                    child: TextFormField(
                      controller: _emailTextController,
                      // The validator receives the text that the user has entered.
                      maxLength: 30,
                      decoration: const InputDecoration(
                        hintText: "Email",
                      ),
                      validator: validateEmail,
                    ),
                  ),

                  const SizedBox(height: 12),

                  CustomCard(
                    child: TextFormField(
                      controller: _passwordTextController,
                      // The validator receives the text that the user has entered.
                      maxLength: 30,
                      decoration: InputDecoration(
                        hintText: AppLocale.password.getString(context),
                        suffixIcon: isObscure
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                },
                                icon: const Icon(Ionicons.eye_off))
                            : IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                },
                                icon: const Icon(Ionicons.eye),
                              ),
                      ),
                      obscureText: isObscure,
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Already have an account?'),
                      Icon(
                        Icons.arrow_right_alt_outlined,
                        color: Colors.red,
                      )
                    ],
                  ),

                  const SizedBox(height: 24),

                  BlocConsumer<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) {
                      return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 46),
                            maximumSize: const Size(double.infinity, 46),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          onPressed: () async {
                            if (state is AuthenticationSignInSuccess) return;
                            if (state is AuthenticationLoading) return;
                            if (_formKey.currentState!.validate()) {
                              var emailAddress =
                                  _emailTextController.text.trim();
                              var password =
                                  _passwordTextController.text.trim();
                              EasyLoading.show();

                              _authenticationBloc.add(
                                AuthenticationSignInWithEmailPassWordEvent(
                                  emailAddress,
                                  password,
                                ),
                              );
                            }
                          },
                          child: Text(AppLocale.signUp
                              .getString(context)
                              .toUpperCase()));
                    },
                    listener: (context, state) async {
                      if (state is AuthenticationLoading) {
                      } else if (state is AuthenticationSignInSuccess) {
                        EasyLoading.dismiss();
                        EasyLoading.showSuccess('Login successful');
                        Future.delayed(const Duration(seconds: 2), () {
                          Navigator.of(context, rootNavigator: true).pushNamed(
                            SettingScreen.id,
                          );
                        });
                      } else if (state is AuthenticationPageError) {
                        EasyLoading.dismiss();

                        EasyLoading.showError(state.error.toString());
                      }
                    },
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
