import 'package:flutter/material.dart';

import 'accounts/widgets/login.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Accounts"),
        ),
        body: const Login(),
      ),
    );
  }
}
