import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/pages/widgets/big_card.dart';

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({
    Key? key,
    required this.favorites,
    required this.current,
    required this.onLikePressed,
    required this.onNextPressed,
  }) : super(key: key);

  final List<WordPair> favorites;
  final WordPair current;
  final void Function() onLikePressed;
  final void Function() onNextPressed;

  @override
  Widget build(BuildContext context) {
    IconData icon;
    if (favorites.contains(current)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: current),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: onLikePressed,
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: onNextPressed,
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
