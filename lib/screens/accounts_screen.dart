import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/user/user_bloc.dart';

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
        body: BlocBuilder<UserBloc, UserState>(builder: (
          context,
          state,
        ) {
          print("${state} vvpp");
          return state.userId.isNotEmpty ? Text(state.name) : const Login();
          // return state.userId.isNotEmpty ? Text(state.name) : Text(state.name);
        }),
      ),
    );
  }
}
