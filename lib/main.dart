import 'package:flutter/material.dart';
import 'home_page.dart';
import 'book_list_page.dart';
import 'profile_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // Kontras Coklat Tua & Krem
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3E2723),
          primary: const Color(0xFF3E2723),
          surface: const Color(0xFFFFF8E1),
        ),
        scaffoldBackgroundColor: const Color(0xFFFFF8E1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF3E2723),
          foregroundColor: Colors.white,
          elevation: 4,
          centerTitle: true,
        ),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = const [HomePage(), BookListPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (i) => setState(() => _selectedIndex = i),
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFF3E2723).withOpacity(0.1),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.auto_stories), label: 'Beranda'),
          NavigationDestination(icon: Icon(Icons.menu_book), label: 'Koleksi'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}