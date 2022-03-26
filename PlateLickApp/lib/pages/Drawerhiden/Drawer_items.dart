import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem({required this.title, required this.icon});
}

class DrawerItems {
  static final recipes =
      DrawerItem(title: "Recipes", icon: Icons.grid_view_outlined);
  static final history =
      DrawerItem(title: "History", icon: FontAwesomeIcons.chartPie);
  static final account =
      DrawerItem(title: "Account", icon: Icons.person_outlined);

  static final List<DrawerItem> all = [recipes, history, account];
}
