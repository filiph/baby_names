import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baby Names',
      home: const MyHomePage(title: 'Baby Name Votes'),
    );
  }
}

final snapshot = [
  {"name": "Filip", "votes": 15},
  {"name": "Abraham", "votes": 14},
  {"name": "Richard", "votes": 11},
  {"name": "Ike", "votes": 10},
  {"name": "Justin", "votes": 1},
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemCount: snapshot.length,
        padding: const EdgeInsets.only(top: 10.0),
        itemBuilder: (context, index) =>
            _buildListItem(context, snapshot[index]),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, Map<String, dynamic> document) {
    return ListTile(
      key: ValueKey(document['name']),
      title: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Text(document['name']),
            ),
            Text(document['votes'].toString()),
          ],
        ),
      ),
      onTap: () => print("Tapped on $document"),
    );
  }
}
