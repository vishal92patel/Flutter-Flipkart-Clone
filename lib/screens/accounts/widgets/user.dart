import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/user/user_bloc.dart';
import 'package:test_app/screens/accounts/bloc/login_bloc.dart';

class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    void onLogout() {
      context.read<UserBloc>().add(const LogoutUserEvent());
    }

    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state.emailId.isEmpty) {
          context.read<LoginBloc>().add(const SignInLogoutEvent());
        }
      },
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome, ${state.name}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Email: ${state.emailId}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: onLogout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primaryContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: state.isLoading != true
                    ? const Text(
                        "LOGOUT",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )
                    : const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(),
                      ),
              )
            ],
          ),
        );
      },
    );
  }
}
