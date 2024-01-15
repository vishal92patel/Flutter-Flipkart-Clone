import 'package:flutter/material.dart';

class MainTab extends StatelessWidget {
  const MainTab(
      {super.key, required this.onChangeTab, required this.currentIndex});

  final Function(int) onChangeTab;
  final int currentIndex;

  void onTap(index, context) {
    onChangeTab(index);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BottomNavigationBar(
      onTap: (index) => onTap(index, context),
      items: [
        BottomNavigationBarItem(
          backgroundColor: theme.colorScheme.onPrimaryContainer,
          icon: const Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          backgroundColor: theme.colorScheme.onPrimaryContainer,
          icon: const Icon(Icons.category),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          backgroundColor: theme.colorScheme.onPrimaryContainer,
          icon: const Icon(Icons.notifications),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          backgroundColor: theme.colorScheme.onPrimaryContainer,
          icon: const Icon(Icons.account_box),
          label: 'Accounts',
        ),
        BottomNavigationBarItem(
          backgroundColor: theme.colorScheme.onPrimaryContainer,
          icon: const Icon(Icons.shopping_basket),
          label: 'Cart',
        ),
      ],
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: theme.colorScheme.onPrimaryContainer,
      selectedItemColor: theme.colorScheme.primaryContainer,
      unselectedItemColor: theme.colorScheme.secondary,
      selectedFontSize: 11,
      unselectedFontSize: 11,
    );
  }
}
