import 'package:flutter/material.dart';
import 'package:prueba_tecnica_jmot/screens/gallery_screen.dart';
import 'package:prueba_tecnica_jmot/screens/upload_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [UploadScreen(), GalleryScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: 'Subir'),
          BottomNavigationBarItem(icon: Icon(Icons.photo_library), label: 'Galería'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}