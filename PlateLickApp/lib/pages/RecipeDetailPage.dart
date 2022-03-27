import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RecipeDetailPage extends StatefulWidget {
  final String title;
  final String url;
  final List ingredients;

  const RecipeDetailPage({
    Key? key,
    required this.title,
    required this.url,
    required this.ingredients,
  }) : super(key: key);

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  @override
  Widget build(BuildContext context) {
    double phoneWidth = MediaQuery.of(context).size.width;
    return CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        // pinned: true,
        floating: false,
        expandedHeight: 120.0,
        flexibleSpace: FlexibleSpaceBar(
            title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).primaryColor,
          ),
        )),
        leading: BackButton(
          color: Theme.of(context).primaryColor,
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            padding: const EdgeInsets.all(3.0),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 35,
            alignment: Alignment.centerLeft,
            color: Colors.yellow,
            child: Text(
              '${widget.ingredients[index]['actual-name']}:    ${widget.ingredients[index]['quantity-amount']}',
              style: TextStyle(
                fontSize: 15,
                color: Theme.of(context).primaryColor,
              ),
            ),
          );
        },
        childCount: widget.ingredients.length,
      ))
    ]);
  }
}
