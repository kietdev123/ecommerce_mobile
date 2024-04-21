import 'dart:math';

import 'package:ecommerce_mobile/bloc/authentication/authentication_bloc.dart';
import 'package:ecommerce_mobile/bloc/authentication/authentication_event.dart';
import 'package:ecommerce_mobile/bloc/authentication/authentication_state.dart';
import 'package:ecommerce_mobile/bloc/brand/brand_event.dart';
import 'package:ecommerce_mobile/bloc/product/product_state.dart';
import 'package:ecommerce_mobile/bloc/product_type/product_type_bloc.dart';
import 'package:ecommerce_mobile/bloc/product_type/product_type_state.dart';
import 'package:ecommerce_mobile/main.dart';
import 'package:ecommerce_mobile/res/resources.dart';
import 'package:ecommerce_mobile/ui/main/home/widgets/home_title.dart';
import 'package:ecommerce_mobile/ui/main/home/widgets/new_product_list.dart';
import 'package:ecommerce_mobile/ui/main/setting/setting_screen.dart';
import 'package:ecommerce_mobile/ui/utils/utils.dart';
import 'package:ecommerce_mobile/ui/widgets/custom_card.dart';
import 'package:ecommerce_mobile/ui/widgets/padding_screen.dart';
import 'package:ecommerce_mobile/ui/widgets/proudct_vertical_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
import 'widgets/sliver_app_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "home_screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      EasyLoading.dismiss();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final resource = Resources(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(),
            ),
          ];
        },
        body: Padding(
          padding: EdgeInsets.fromLTRB(
              resource.dimension.bigMargin, 0, resource.dimension.bigMargin, 0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(children: [
                const SizedBox(height: 48),
                HomeTitle(
                    title: 'Sale',
                    subTitle: "Super summer sale!",
                    eventViewAll: () {}),
                const SizedBox(height: 24),
                const NewProductList(),
                HomeTitle(
                    title: 'New',
                    subTitle: "You've never seen it before!",
                    eventViewAll: () {}),
                const SizedBox(height: 24),
                const NewProductList(),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
