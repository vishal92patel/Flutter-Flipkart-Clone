import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  void onSignInPress() {}

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                      textDirection: TextDirection.rtl,
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const TextField(
                  decoration: InputDecoration(
                    label: Text("Email"),
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    label: Text("Password"),
                    prefixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: onSignInPress,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primaryContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "SIGN IN",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
