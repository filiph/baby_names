import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

final snapshot = [
  {"name": "Filip", "votes": 15},
  {"name": "Abraham", "votes": 14},
  {"name": "Richard", "votes": 11},
  {"name": "Ike", "votes": 10},
  {"name": "Justin", "votes": 1},
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baby Names',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Baby Name Votes')),
      body: ListView.builder(
        itemCount: snapshot.length,
        padding: const EdgeInsets.only(top: 20.0),
        itemBuilder: (context, index) =>
            _buildListItem(context, Record.fromMap(snapshot[index])),
      ),
    );
  }

  Widget _buildListItem(BuildContext context, Record record) {
    return ListTile(
      title: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Text(record.name),
            ),
            Text(record.votes.toString()),
          ],
        ),
      ),
      onTap: () => print("Tapped on $record"),
    );
  }
}

class Record {
  final String name;
  final int votes;

  Record.fromMap(Map<String, dynamic> map)
      : assert(map.containsKey('name')),
        assert(map.containsKey('votes')),
        name = map['name'],
        votes = map['votes'];

  Record.fromSnapshot(DocumentSnapshot snapshot) : this.fromMap(snapshot.data);

  @override
  String toString() => "Record<$name:$votes>";
}
