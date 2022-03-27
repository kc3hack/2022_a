import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_todo/pages/homepage.dart';
import 'RecipeDetailPage.dart';

class RecipePage extends StatefulWidget {
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  List _items = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/dishes_3600.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        titleTextStyle: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 20,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              showSearch(context: context, delegate: MySearchDelegate());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            // Display the data loaded from sample.json
            _items.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            title: Text(_items[index]["title"]),
                            subtitle: Text(_items[index]["url"]),
                            textColor: Theme.of(context).primaryColor,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RecipeDetailPage(
                                      title: _items[index]["title"],
                                      url: _items[index]["url"],
                                      ingredients: _items[index]
                                          ["ingredients"]),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override // Empty search field
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
        )
      ];

  @override
  Widget buildResults(BuildContext context) => Center(
          child: Text(
        query,
        style: const TextStyle(fontSize: 64, color: Colors.blue),
      ));

  @override
  Widget buildSuggestions(BuildContext context) {
    List suggestions = [
      'Apple',
      'Banana',
      'Cherry',
      'Date',
      'Elderberry',
      'Fig',
      'Grape',
      'Honeydew',
      'Ipe',
      'Jackfruit',
      'Kiwi',
      'Lemon',
      'Mango',
      'Nectarine',
      'Orange',
      'Papaya',
      'Quince',
      'Raspberry',
      'Strawberry',
      'Tomato',
      'Ugli fruit',
      'Watermelon',
    ];

    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }
}
