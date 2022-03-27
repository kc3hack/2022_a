import 'package:flutter/material.dart';

class IngredientsPage extends StatefulWidget {
  @override
  _IngredientsPageState createState() => _IngredientsPageState();
}

class _IngredientsPageState extends State<IngredientsPage> {
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
      body: Center(
        child: Text('Ingredients'),
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
