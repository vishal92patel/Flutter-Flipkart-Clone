import 'package:flutter/material.dart';
import 'package:test_app/screens/base_screen.dart';

final lightColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: const Color.fromARGB(255, 15, 24, 66),
  surface: const Color.fromARGB(255, 255, 255, 255),
);
final darkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 49, 80, 180),
  surface: const Color.fromARGB(255, 0, 0, 0),
);

final lightTheme = ThemeData().copyWith(
  colorScheme: lightColorScheme,
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: lightColorScheme.onPrimaryContainer,
    foregroundColor: lightColorScheme.primaryContainer,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: lightColorScheme.onBackground,
  ),
);

final darkTheme = ThemeData.dark().copyWith(
  colorScheme: darkColorScheme,
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: darkColorScheme.onPrimaryContainer,
    foregroundColor: darkColorScheme.primaryContainer,
  ),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: darkTheme,
      theme: lightTheme,
      home: const BaseScreen(),
      themeMode: ThemeMode.system,
      // themeMode: ThemeMode.dark,
    );
  }
}
