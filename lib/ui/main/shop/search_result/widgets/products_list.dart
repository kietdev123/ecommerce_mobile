import 'package:ecommerce_mobile/bloc/product/product_bloc.dart';
import 'package:ecommerce_mobile/bloc/product/product_state.dart';
import 'package:ecommerce_mobile/res/resources.dart';
import 'package:ecommerce_mobile/ui/widgets/product_horizontal_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  late ProductBloc _productBloc;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      EasyLoading.dismiss();
    });

    _productBloc = BlocProvider.of(context);

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
            return Column(
              children: [
                for (var i = 0; i < state.data!.length; i++)
                  ProductHorizontalCard(product: state.data![i]),
              ],
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
