import 'package:flutter/material.dart';
import 'package:flutter_sqlite/pages/items.dart';
import 'package:flutter_sqlite/pages/entry_form.dart';
import '../db_helper.dart';
import '../item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var db = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => EntryForm(
                  Item('', '', 0, 0),
                  true,
                ),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('DB SQLite - Amelia Marshanda/2041720041'),
        ),
        body: FutureBuilder(
          future: db.getItem(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
            }

            var data = snapshot.data;

            return snapshot.hasData
                ? Items(data as List<Item>)
                : const Center(
                    child: Text('Tidak Ada Data'),
                  );
          },
        ));
  }
}