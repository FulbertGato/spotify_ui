import 'package:flutter/material.dart';
import 'package:spotify_ui/ui/screens/home_screen.dart';

import 'libray_screen.dart';
import 'profile_screen.dart';
import 'search_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
                    AssetImage('assets/icons/home.png'),
                  ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
                    AssetImage('assets/icons/search.png'),
                  ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
                    AssetImage('assets/icons/library.png'),
                  ),
            label: "Library",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ]),

      body: Stack(
          children: [
            renderView(
            0,
            const HomeScreen(),
          ),
          renderView(
            1,
            const SearchScreen(),
          ),
          renderView(
            2,
            const LibraryScreen(),
          ),
          renderView(
            3,
            const ProfilScreen(),
          ),
          
          ]
      ),
    );
  }
   Widget renderView(int tabIndex, Widget view) {
    return IgnorePointer(
      ignoring: _currentIndex != tabIndex,
      child: Opacity(
        opacity: _currentIndex == tabIndex ? 1 : 0,
        child: view,
      ),
    );
  }
}
