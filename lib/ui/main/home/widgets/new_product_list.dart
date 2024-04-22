import 'package:ecommerce_mobile/bloc/product/product_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../bloc/product/product_bloc.dart';
import '../../../../bloc/product/product_state.dart';
import '../../../../res/resources.dart';
import '../../../widgets/product_vertical_card.dart';

class NewProductList extends StatefulWidget {
  const NewProductList({super.key});

  @override
  State<NewProductList> createState() => _NewProductListState();
}

class _NewProductListState extends State<NewProductList> {
  late ProductBloc _productBloc;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      EasyLoading.dismiss();
    });

    _productBloc = BlocProvider.of(context);
    _productBloc.add(GetProductEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final resource = Resources(context);
    final size = MediaQuery.of(context).size;

    return BlocConsumer<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess || state is ProductPaginating) {
          if (state.data != null) {
            return SizedBox(
              height: 250,
              // width: size.width,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount:
                    state.data!.length + 1, // Add 1 for loading indicator
                itemBuilder: (context, index) {
                  if (index < state.data!.length) {
                    if (state.data![index].imgUrls!.length > 0) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: ProductVerticalCard(product: state.data![index]),
                      );
                    }
                    return Text('no images');
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
    );
  }
}
