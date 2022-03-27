import 'package:flutter/material.dart';

class Task {
  String tasknumber;
  String title;
  Color progresscolor;
  double value;

  Task(
      {required this.tasknumber,
      required this.title,
      required this.progresscolor,
      required this.value});
}

List<Task> tasklist = [
  Task(
      tasknumber: "40 tasks",
      title: "Meats",
      progresscolor: const Color(0xFFAC05FF),
      value: 0.5),
  Task(
      tasknumber: "16 tasks",
      title: "Vegitables",
      progresscolor: Colors.blue,
      value: 0.1),
  Task(
      tasknumber: "10 tasks",
      title: "Fruits",
      progresscolor: Colors.green,
      value: 0.1),
  Task(
      tasknumber: "2 tasks",
      title: "Drinks",
      progresscolor: Colors.red,
      value: 0.1),
  Task(
      tasknumber: "30 tasks",
      title: "Sauces",
      progresscolor: Colors.orange,
      value: 0.8),
];
