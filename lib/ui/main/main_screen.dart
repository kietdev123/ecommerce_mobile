import 'package:ecommerce_mobile/bloc/product_type/product_type_bloc.dart';
import 'package:ecommerce_mobile/bloc/product_type/product_type_event.dart';
import 'package:ecommerce_mobile/ui/main/favorite/favorite_screen.dart';
import 'package:ecommerce_mobile/ui/main/home/home_screen.dart';
import 'package:ecommerce_mobile/ui/main/my_bag/my_bag_screen.dart';
import 'package:ecommerce_mobile/ui/main/profile/profile_screen.dart';
import 'package:ecommerce_mobile/ui/main/shop/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import '../../bloc/brand/brand_bloc.dart';
import '../../bloc/brand/brand_event.dart';
import '../../res/resources.dart';

class MainScreen extends StatefulWidget {
  static const String id = "main_screen";
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  late ProductTypeBloc _productTypeBloc;
  late BrandBloc _brandBloc;

  @override
  void initState() {
    _productTypeBloc = BlocProvider.of(context);
    _productTypeBloc.add(GetProductTypeEvent());

    _brandBloc = BlocProvider.of(context);
    _brandBloc.add(GetDataEvent());

    super.initState();
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ShopScreen(),
    MyBagScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final resource = Resources(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              border:
                  Border(top: BorderSide(color: Colors.white, width: 12.0))),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Ionicons.cart),
                label: 'Shop',
              ),
              BottomNavigationBarItem(
                icon: Icon(Ionicons.bag),
                label: 'Bag',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Ionicons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
