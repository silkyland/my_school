import 'package:flutter/material.dart';
import 'package:my_school/screens/guestbook_screen.dart';
import 'package:my_school/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Menu> _menus = const [
    Menu(
      title: 'Home',
      icon: Icons.home,
      screen: HomeScreen(),
    ),
    Menu(
      title: 'Profile',
      icon: Icons.person,
      screen: HomeScreen(),
    ),
    Menu(
      title: 'Guestbook',
      icon: Icons.message,
      screen: GuestBookScreen(),
    ),
    Menu(
      title: 'About',
      icon: Icons.info,
      screen: GuestBookScreen(),
    ),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_menus[_currentIndex].title),
      ),
      drawer: _myDrawer(context),
      body: _menus[_currentIndex].screen,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: _menus.map((menu) {
          return BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(menu.icon),
            label: menu.title,
          );
        }).toList(),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  _myDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ..._menus.map((menu) {
            return ListTile(
              title: Text(menu.title),
              leading: Icon(menu.icon),
              onTap: () {
                Navigator.pop(context);
              },
            );
          }),
        ],
      ),
    );
  }
}

class Menu {
  final String title;
  final IconData icon;
  final Widget screen;

  const Menu({
    required this.title,
    required this.icon,
    required this.screen,
  });
}
