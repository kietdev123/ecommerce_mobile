import 'package:ecommerce_mobile/bloc/product_type/product_type_state.dart';
import 'package:ecommerce_mobile/ui/main/shop/categories/widgets/categories_list.dart';
import 'package:ecommerce_mobile/ui/widgets/app_back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../bloc/product_type/product_type_bloc.dart';
import '../../../../res/resources.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
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
    return BlocBuilder<ProductTypeBloc, ProductTypeState>(
      builder: (context, state) {
        if (state is ProductTypeSuccess) {
          return DefaultTabController(
            length: state.data!.genders!.length,
            child: Scaffold(
              appBar: AppBar(
                // leading: AppBackButton(),
                actions: [
                  Icon(Icons.search),
                ],
                bottom: TabBar(
                  indicatorColor: resource.color.colorPrimary,
                  tabs: [
                    for (var i = 0; i < state.data!.genders!.length; i++)
                      Text(
                        state.data!.genders![i].toString(),
                        overflow: TextOverflow.ellipsis,
                      )
                  ],
                ),
                title: Text(
                  'Categories',
                  style: resource.style.appbarTitleStyle,
                ),
                centerTitle: true,
              ),
              body: TabBarView(
                children: [
                  CategoriesList(
                    imgUrls: state.data!.menUrls!.toList(),
                    titles: state.data!.masterCategorys!.toList(),
                  ),
                  CategoriesList(
                    imgUrls: state.data!.womenUrls!.toList(),
                    titles: state.data!.masterCategorys!.toList(),
                  ),
                  CategoriesList(
                    imgUrls: state.data!.boysUrls!.toList(),
                    titles: state.data!.masterCategorys!.toList(),
                  ),
                  CategoriesList(
                    imgUrls: state.data!.girlsUrls!.toList(),
                    titles: state.data!.masterCategorys!.toList(),
                  ),
                  CategoriesList(
                    imgUrls: state.data!.unisexUrls!.toList(),
                    titles: state.data!.masterCategorys!.toList(),
                  ),
                ],
              ),
            ),
          );
        }
        return Scaffold();
      },
    );
  }
}
