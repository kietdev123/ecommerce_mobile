import 'package:ecommerce_mobile/bloc/authentication/authentication_bloc.dart';
import 'package:ecommerce_mobile/bloc/authentication/authentication_event.dart';
import 'package:ecommerce_mobile/bloc/authentication/authentication_state.dart';
import 'package:ecommerce_mobile/bloc/brand/brand_event.dart';
import 'package:ecommerce_mobile/bloc/product/product_state.dart';
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

import '../../../bloc/brand/brand_bloc.dart';
import '../../../bloc/brand/brand_state.dart';
import '../../../bloc/product/product_bloc.dart';
import '../../../bloc/product/product_event.dart';
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
  late BrandBloc _brandBloc;
  late ProductBloc _productBloc;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      EasyLoading.dismiss();
    });

    _authenticationBloc = BlocProvider.of(context);
    _productTypeBloc = BlocProvider.of(context);
    _brandBloc = BlocProvider.of(context);

    _productBloc = BlocProvider.of(context);
    _productBloc.add(GetProductEvent());

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
    final brandContent = BlocConsumer<BrandBloc, BrandState>(
      builder: (context, state) {
        if (state is BrandSuccess) {
          if (state.data != null) {
            return Column(children: [Text(state.data!.names.toString())]);
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
              // BlocConsumer<AuthenticationBloc, AuthenticationState>(
              //   builder: (context, state) {
              //     if (state is AuthenticationSuccess)
              //       return Column(children: [
              //         ...[
              //           Text(state.uid.toString()),
              //           Text(state.name.toString()),
              //           Text(state.emailAddress.toString()),
              //           Text(state.profilePhoto.toString()),
              //         ],
              //         ElevatedButton(
              //             onPressed: () async {
              //               if (!(state is AuthenticationLoading))
              //                 _authenticationBloc.add(SignOutEvent());
              //             },
              //             child: Text('Sign out'))
              //       ]);
              //     return Column();
              //   },
              //   listener: (context, state) async {
              //     if (state is AuthenticationLoading) {
              //       // EasyLoading.show();
              //     } else if (state is AuthenticationSuccess) {
              //       EasyLoading.dismiss();
              //     } else if (state is AuthenticationError) {
              //       EasyLoading.dismiss();

              //       EasyLoading.showError(state.error.toString(),
              //           duration: const Duration(seconds: 2));
              //     }
              //   },
              // ),
              // productTypeContent,
              // brandContent,

              NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  // if (notification is ScrollEndNotification &&
                  //     notification.metrics.extentAfter == 0) {
                  //   // User has reached the end of the list
                  //   // Load more data or trigger pagination in flutter
                  //   _productBloc.add(PaginatingProductEvent());
                  // }
                  return false;
                },
                child: BlocConsumer<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state is ProductSuccess || state is ProductPaginating) {
                      if (state.data != null) {
                        return SizedBox(
                          height: 500,
                          child: ListView.builder(
                            itemCount: state.data!.length +
                                1, // Add 1 for loading indicator
                            itemBuilder: (context, index) {
                              if (index < state.data!.length) {
                                if (state.data![index].imgUrls!.length > 0) {
                                  return CustomCard(
                                    child: Row(
                                      children: [
                                        Image.network(
                                            height: 130,
                                            width: 130,
                                            // height: 0,
                                            // height: 200,
                                            // height: 150,
                                            fit: BoxFit.cover,
                                            state.data![index].imgUrls![0]
                                                .toString()),
                                        SizedBox(
                                          width: 200,
                                          child: Text(
                                              'Item ${state.data![index].productDisplayName}'),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                                return Text('no images');
                              } else {
                                // return const Center(
                                //   child: CircularProgressIndicator(),
                                // );
                                return ElevatedButton(
                                    onPressed: () {
                                      _productBloc
                                          .add(PaginatingProductEvent());
                                    },
                                    child: Text('more'));
                              }
                            },
                          ),
                        );
                      }
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  listener: (context, state) async {},
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
