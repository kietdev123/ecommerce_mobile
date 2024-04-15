import 'package:ecommerce_mobile/bloc/authentication/authentication_bloc.dart';
import 'package:ecommerce_mobile/bloc/authentication/authentication_event.dart';
import 'package:ecommerce_mobile/bloc/authentication/authentication_state.dart';
import 'package:ecommerce_mobile/res/resources.dart';
import 'package:ecommerce_mobile/ui/auth/login_screen.dart';
import 'package:ecommerce_mobile/ui/setting/setting_screen.dart';
import 'package:ecommerce_mobile/ui/utils/utils.dart';
import 'package:ecommerce_mobile/ui/widgets/custom_card.dart';
import 'package:ecommerce_mobile/ui/widgets/padding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:ionicons/ionicons.dart';

import '../../res/app_locale.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = "sign_up_screen";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _nameTextController = TextEditingController();

  bool isLoading = false;
  bool isObscurePassword = true;

  late AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      EasyLoading.dismiss();
    });
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

                  const SizedBox(height: 50),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                    child: const Icon(Icons.arrow_back_ios),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Sign Up",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const SizedBox(height: 80),

                  CustomCard(
                    child: TextFormField(
                      controller: _nameTextController,
                      // The validator receives the text that the user has entered.
                      cursorColor: resource.color.colorPrimaryText,
                      maxLength: 30,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        // border: InputBorder.none,
                        labelStyle:
                            TextStyle(color: resource.color.colorPrimaryText),
                        focusColor: resource.color.colorPrimaryText,
                        labelText: "Name",
                      ),
                      validator: (value) {
                        if (value == '') return 'Required';
                        return null;
                      },
                    ),
                  ),

                  const SizedBox(height: 12),

                  CustomCard(
                    child: TextFormField(
                      controller: _emailTextController,
                      // The validator receives the text that the user has entered.
                      cursorColor: resource.color.colorPrimaryText,
                      maxLength: 30,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        // border: InputBorder.none,
                        labelStyle:
                            TextStyle(color: resource.color.colorPrimaryText),
                        focusColor: resource.color.colorPrimaryText,
                        labelText: "Email",
                      ),
                      validator: (value) {
                        return validateEmail(value, context);
                      },
                    ),
                  ),

                  const SizedBox(height: 12),

                  CustomCard(
                    child: TextFormField(
                      controller: _passwordTextController,
                      // The validator receives the text that the user has entered.
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      maxLength: 30,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle:
                            TextStyle(color: resource.color.colorPrimaryText),
                        suffixIcon: isObscurePassword
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObscurePassword = !isObscurePassword;
                                  });
                                },
                                icon: const Icon(Ionicons.eye_off))
                            : IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObscurePassword = !isObscurePassword;
                                  });
                                },
                                icon: const Icon(Ionicons.eye),
                              ),
                      ),
                      validator: (value) {
                        if (value == '') return 'Required';
                        return null;
                      },
                      obscureText: isObscurePassword,
                    ),
                  ),

                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(AppLocale.alreadyHaveAnAccount.getString(context)),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).pushNamed(
                            LoginScreen.id,
                          );
                        },
                        child: Icon(
                          Icons.arrow_right_alt_outlined,
                          color: resource.color.colorPrimary,
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 24),

                  BlocConsumer<AuthenticationBloc, AuthenticationState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: resource.color.colorPrimary,
                          minimumSize: const Size(double.infinity, 46),
                          maximumSize: const Size(double.infinity, 46),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        onPressed: () async {
                          if (state is AuthenticationLoading) return;
                          if (_formKey.currentState!.validate()) {
                            var name = _nameTextController.text.trim();
                            var emailAddress = _emailTextController.text.trim();
                            var password = _passwordTextController.text.trim();
                            EasyLoading.show();

                            _authenticationBloc.add(
                              SignUpEvent(
                                name,
                                emailAddress,
                                password,
                              ),
                            );
                          }
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                              color: resource.color.colorInPrimaryBackground),
                        ),
                      );
                    },
                    listener: (context, state) async {
                      if (state is AuthenticationLoading) {
                      } else if (state is SignUpSuccess) {
                        EasyLoading.dismiss();
                        EasyLoading.showSuccess('Sign up successful',
                            duration: const Duration(seconds: 2));
                        Navigator.of(context, rootNavigator: true).pushNamed(
                          LoginScreen.id,
                        );
                      } else if (state is AuthenticationError) {
                        EasyLoading.dismiss();

                        EasyLoading.showError(state.error.toString(),
                            duration: const Duration(seconds: 2));
                      }
                    },
                  ),

                  const SizedBox(height: 50),
                  Center(
                    child: Text(
                      'Or sign up with a social account',
                    ),
                  ),
                  const SizedBox(height: 12),
                  Center(
                      child: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/google_icon.png',
                      width: 36,
                    ),
                  )),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
