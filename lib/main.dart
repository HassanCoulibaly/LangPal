import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:langpal_app/main_screen.dart';
import 'package:langpal_app/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const LangPalApp(),
    ),
  );
}

class LangPalApp extends StatelessWidget {
  const LangPalApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Theme to match the "Duolingo" concept
    const primaryColor = Colors.green;

    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'LangPal',
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          theme: ThemeData(
            primarySwatch: primaryColor,
            brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.green,
              elevation: 1,
              iconTheme: IconThemeData(color: Colors.black87),
              titleTextStyle: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: primaryColor,
              unselectedItemColor: Colors.grey,
            ),
          ),
          darkTheme: ThemeData(
            primarySwatch: primaryColor,
            brightness: Brightness.dark,
            scaffoldBackgroundColor: const Color(0xFF121212),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedItemColor: primaryColor,
              unselectedItemColor: Colors.grey,
            ),
          ),
          home: const MainScreen(),
        );
      },
    );
  }
}
