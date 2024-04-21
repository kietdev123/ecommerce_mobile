import 'package:ecommerce_mobile/bloc/authentication/authentication_state.dart';
import 'package:ecommerce_mobile/res/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../bloc/authentication/authentication_bloc.dart';
import '../../../bloc/authentication/authentication_event.dart';
import '../../widgets/padding_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = "profile_screen";
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: PaddingScreen(
            child: Column(children: [
              const SizedBox(height: 48),
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
            ]),
          ),
        ),
      ),
    );
  }
}
