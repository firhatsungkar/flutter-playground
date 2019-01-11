import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String title = 'Startup Name Generator';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      title: title,
      home: RandomWordState(title: title),
    );
  }
}

class RandomWordState extends StatefulWidget {
  final String title;
  RandomWordState({Key key, this.title}) : super(key: key,);
  @override
  State<StatefulWidget> createState() => _RandomWordStateState();
}

class _RandomWordStateState extends State<RandomWordState> {
  final String title = 'Startup Name Generator';
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();
  final TextStyle _biggerFont = TextStyle(fontSize: 16);

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);

    _onTap() {
      setState(
        () => alreadySaved ? _saved.remove(pair) : _saved.add(pair)
      );
    }

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: _onTap,
    );
  }

  Widget _buildSuggestion() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemBuilder: (context, i) {
        if(i.isOdd) return Divider();
        final index = i ~/ 2;
        if(index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: _pushSaved,
            )
          ],
        ),
        body: _buildSuggestion(),
      );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (WordPair pair) => ListTile(
              title: Text(pair.asPascalCase, style: _biggerFont,)
            )
          );
          final List<Widget> divided = ListTile
          .divideTiles(
            context: context,
            tiles: tiles
          )
          .toList();

          return Scaffold(
            appBar: AppBar(title: Text('Saved Sugestions'),),
            body: ListView(children: divided),
          );
        }
      ),
    );
  }
}