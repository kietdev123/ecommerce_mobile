import 'package:ecommerce_mobile/res/resources.dart';
import 'package:ecommerce_mobile/ui/main/home/widgets/home_title.dart';
import 'package:ecommerce_mobile/ui/main/home/widgets/new_product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
