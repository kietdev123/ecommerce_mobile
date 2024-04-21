import 'package:ecommerce_mobile/bloc/authentication/authentication_event.dart';
import 'package:ecommerce_mobile/bloc/authentication/authentication_state.dart';
import 'package:ecommerce_mobile/ui/auth/login_screen.dart';
import 'package:ecommerce_mobile/ui/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../bloc/authentication/authentication_bloc.dart';
import '../../res/resources.dart';
import '../widgets/app_back_button.dart';
import '../widgets/custom_card.dart';
import '../widgets/padding_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String id = "forgot_password_screen";
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();

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
                  const AppBackButton(),
                  const SizedBox(height: 12),
                  Text('Forgot password',
                      style: resource.style.headingTextStyle),
                  const SizedBox(height: 80),

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
                            var emailAddress = _emailTextController.text.trim();
                            EasyLoading.show();

                            _authenticationBloc.add(
                              ForgotPasswordEvent(
                                emailAddress,
                              ),
                            );
                          }
                        },
                        child: Text(
                          'SEND',
                          style: TextStyle(
                              color: resource.color.colorInPrimaryBackground),
                        ),
                      );
                    },
                    listener: (context, state) async {
                      if (state is AuthenticationLoading) {
                      } else if (state is ForgotPasswordSuccess) {
                        EasyLoading.dismiss();
                        EasyLoading.showSuccess(
                            'Check your email to change password',
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
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
