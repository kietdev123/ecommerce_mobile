import 'package:ecommerce_mobile/ui/main/shop/categories/categories_screen.dart';
import 'package:ecommerce_mobile/ui/main/shop/categories/subcategories_screen.dart';
import 'package:ecommerce_mobile/ui/widgets/app_back_button.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../widgets/custom_app_bar.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SubCategoriesScreen(),
    );
  }
}
