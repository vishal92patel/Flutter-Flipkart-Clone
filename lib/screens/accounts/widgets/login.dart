import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/user/user_bloc.dart';
import 'package:test_app/screens/accounts/bloc/login_bloc.dart';
import 'package:test_app/screens/accounts/modal/login_form_field_modal.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void onSignInPress() {
    context.read<LoginBloc>().add(SignInEvent(
        email: emailController.text.trim(),
        password: passwordController.text.trim()));
  }

  void onChangedEmail(String txt, bool isDirty) {
    context.read<LoginBloc>().add(EmailChangedEvent(
          email: LoginFormFieldModal(
            value: txt.trim(),
            isDirty: isDirty,
          ),
        ));
  }

  void onFocusChangeEmail(bool isFocused) {
    if (!isFocused) {
      context.read<LoginBloc>().add(EmailChangedEvent(
            email: LoginFormFieldModal(
              value: emailController.text.trim(),
              isDirty: true,
            ),
          ));
    }
  }

  void onChangedPassword(String txt, bool isDirty) {
    context.read<LoginBloc>().add(PasswordChangedEvent(
          password: LoginFormFieldModal(
            value: txt.trim(),
            isDirty: isDirty,
          ),
        ));
  }

  void onFocusChangePassword(bool isFocused) {
    if (!isFocused) {
      context.read<LoginBloc>().add(PasswordChangedEvent(
            password: LoginFormFieldModal(
              value: passwordController.text.trim(),
              isDirty: true,
            ),
          ));
    }
  }

  getError(String? error, bool isDirty) {
    if (error?.isNotEmpty == true && error != null && isDirty) {
      return error;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    emailController.text = context.read<LoginBloc>().state.email.value;
    passwordController.text = context.read<LoginBloc>().state.password.value;

    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isSuccess == true && state.user.name.isNotEmpty) {
          context.read<UserBloc>().add(
                SetUserEvent(
                  userId: state.user.userId,
                  emailId: state.user.emailId,
                  name: state.user.name,
                ),
              );
        }
      },
      builder: (context, state) {
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 360.0,
            ),
            child: Card(
              color: theme.colorScheme.background,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Row(
                      children: [
                        Text(
                          "SIGN IN",
                          style: TextStyle(fontSize: 25),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Focus(
                      onFocusChange: (e) => onFocusChangeEmail(e),
                      child: TextField(
                        readOnly: state.isLoading == true,
                        onChanged: (e) => onChangedEmail(
                          e,
                          state.email.isDirty,
                        ),
                        controller: emailController,
                        decoration: InputDecoration(
                          label: const Text("Email"),
                          errorText:
                              getError(state.email.error, state.email.isDirty),
                          prefixIcon: const Icon(Icons.email),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Focus(
                      onFocusChange: (e) => onFocusChangePassword(e),
                      child: TextField(
                        readOnly: state.isLoading == true,
                        onChanged: (e) => onChangedPassword(
                          e,
                          state.password.isDirty,
                        ),
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          label: const Text("Password"),
                          errorText: getError(
                              state.password.error, state.password.isDirty),
                          prefixIcon: const Icon(Icons.password),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (state.isFail == true)
                      Text(
                        state.failResponse,
                        style: TextStyle(
                          color: theme.colorScheme.error,
                          fontSize: 14,
                        ),
                      ),
                    if (state.isFail == true)
                      const SizedBox(
                        height: 10,
                      ),
                    ElevatedButton(
                      onPressed: (state.email.value.isNotEmpty &&
                                  state.email.error!.isEmpty &&
                                  state.password.value.isNotEmpty &&
                                  state.password.error!.isEmpty) ==
                              true
                          ? () => onSignInPress()
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primaryContainer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: state.isLoading != true
                          ? const Text(
                              "SIGN IN",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            )
                          : const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
