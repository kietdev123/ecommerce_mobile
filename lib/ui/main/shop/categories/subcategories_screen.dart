import 'package:ecommerce_mobile/bloc/product_type/product_type_state.dart';
import 'package:ecommerce_mobile/ui/main/shop/categories/widgets/categories_list.dart';
import 'package:ecommerce_mobile/ui/main/shop/categories/widgets/sub_categpries_list.dart';
import 'package:ecommerce_mobile/ui/widgets/app_back_button.dart';
import 'package:ecommerce_mobile/ui/widgets/submit_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../bloc/product_type/product_type_bloc.dart';
import '../../../../res/resources.dart';

class SubCategoriesScreen extends StatefulWidget {
  const SubCategoriesScreen({super.key});

  @override
  State<SubCategoriesScreen> createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
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
          return Scaffold(
              appBar: AppBar(
                leading: AppBackButton(),
                actions: [
                  Icon(Icons.search),
                ],
                title: Text(
                  'Categories',
                  style: resource.style.appbarTitleStyle,
                ),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: SubmitButton(
                          type: SubmitButtonType.form,
                          content: 'VIEW ALL ITEMS',
                          event: () {}),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text(
                        'Choose category',
                        style: resource.style.subHeadingTextSmallStyle,
                      ),
                    ),
                    SizedBox(height: 16),
                    SubCategoriesList(
                        titles: state.data!.subCategorys!.toList())
                  ],
                ),
              ));
        }
        return Scaffold();
      },
    );
  }
}
