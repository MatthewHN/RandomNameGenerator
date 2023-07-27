import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/pages/favorite/favorite_page.dart';
import 'package:namer_app/pages/generator/generator_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _selectedIndex = 0;
  final List<WordPair> _favorites = [];
  WordPair _current = WordPair.random();

  void _getNext() {
    setState(() {
      _current = WordPair.random();
    });
  }

  void _toggleFavorite() {
    setState(() {
      if (_favorites.contains(_current)) {
        _favorites.remove(_current);
      } else {
        _favorites.add(_current);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (_selectedIndex) {
      case 0:
        page = GeneratorPage(
          favorites: _favorites,
          current: _current,
          onLikePressed: _toggleFavorite,
          onNextPressed: _getNext,
        );
        break;
      case 1:
        page = FavoritePage(
          favorites: _favorites,
          current: _current,
        );
        break;
      default:
        throw UnimplementedError('no widget for $_selectedIndex');
    }

    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              extended: false,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite),
                  label: Text('Favorites'),
                ),
              ],
              selectedIndex: _selectedIndex,
              onDestinationSelected: (value) {
                setState(() {
                  _selectedIndex = value;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: page,
            ),
          ),
        ],
      ),
    );
  }
}
