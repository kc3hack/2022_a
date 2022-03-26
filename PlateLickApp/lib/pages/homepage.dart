import 'package:flutter/material.dart';
import '../Animation/fadeAnimation.dart';
import 'package:flutter_todo/pages/HomeNavPage.dart';
import 'package:flutter_todo/pages/note_task.dart';

import '../db/notes_database.dart';
import '../model/note.dart';
import 'button_change_them.dart';
import 'card_tasks.dart';

import 'RecipePage.dart';
import 'FavoritePage.dart';
import 'NotificationPage.dart';
import 'AccountPage.dart';

class MyHomePage extends StatefulWidget {
  VoidCallback opendrawer;
  MyHomePage({required this.opendrawer});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  final screens = [
    HomeNavPage(),
    RecipePage(),
    FavoritePage(),
    NotificationPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppBarTheme.of(context).backgroundColor,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: widget.opendrawer,
                  icon: const Icon(
                    Icons.drag_handle_outlined,
                    color: Colors.grey,
                    size: 35,
                  )),
              SizedBox(
                width: we * 0.7,
              ),
              SizedBox(
                width: we * 0.01,
              ),
              ChangeThembutton()
            ],
          )
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue.withOpacity(0.5),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Recipes',
            backgroundColor: Colors.orange.withOpacity(0.5),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
            backgroundColor: Colors.red.withOpacity(0.5),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
            backgroundColor: Colors.green.withOpacity(0.5),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
            backgroundColor: Colors.black.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
