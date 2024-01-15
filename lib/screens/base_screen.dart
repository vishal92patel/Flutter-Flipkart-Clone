import 'package:flutter/material.dart';
import 'package:test_app/screens/accounts_screen.dart';
import 'package:test_app/screens/cart_screen.dart';
import 'package:test_app/screens/categories_screen.dart';
import 'package:test_app/screens/home_screen.dart';
import 'package:test_app/screens/notifications_screen.dart';

import 'main_tab.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final List<Widget> screenList = [
    HomeScreen(),
    const CategoriesScreen(),
    const NotificationsScreen(),
    const AccountsScreen(),
    const CartScreen(),
  ];
  int selectedTabIndex = 0;

  void onChangeTab(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[selectedTabIndex],
      bottomNavigationBar:
          MainTab(onChangeTab: onChangeTab, currentIndex: selectedTabIndex),
    );
  }
}
