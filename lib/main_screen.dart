import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:langpal_app/theme_provider.dart';
import 'package:langpal_app/home_screen.dart';
import 'package:langpal_app/profile_screen.dart';
import 'package:langpal_app/messages_screen.dart'; // A placeholder screen

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    MessagesScreen(), // Placeholder for a 'messages' tab
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        // Using your logo in the title
        title: Image.asset(
          'assets/images/LangPal_Logo1.png',
          height: 40, // Adjust height as needed
        ),
        centerTitle: true,
        actions: [
          // Optional Feature: Dark Mode Toggle
          Switch(
            value: isDarkMode,
            onChanged: (value) {
              themeProvider.toggleTheme(value);
            },
            activeTrackColor: Colors.green,
            activeColor: Colors.white,
          ),
        ],
      ),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
