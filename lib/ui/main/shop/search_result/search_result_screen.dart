import 'package:ecommerce_mobile/bloc/product_type/product_type_state.dart';
import 'package:ecommerce_mobile/ui/main/shop/categories/widgets/categories_list.dart';
import 'package:ecommerce_mobile/ui/main/shop/search_result/widgets/products_list.dart';
import 'package:ecommerce_mobile/ui/main/shop/search_result/widgets/search_result_app_bar.dart';
import 'package:ecommerce_mobile/ui/widgets/app_back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../bloc/product_type/product_type_bloc.dart';
import '../../../../res/resources.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  late ProductTypeBloc _productTypeBloc;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      EasyLoading.dismiss();
    });

    _productTypeBloc = BlocProvider.of(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final resource = Resources(context);
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverPersistentHeader(
              pinned: true,
              delegate: SearchResultAppBarDelegate(),
            ),
          ];
        },
        body: Padding(
          padding: EdgeInsets.fromLTRB(
              resource.dimension.bigMargin, 0, resource.dimension.bigMargin, 0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(children: [
                SizedBox(height: 32),
                ProductsList(),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
