import 'package:flutter/material.dart';
import 'package:flutter_sqlite/item.dart';
import '../db_helper.dart';
import 'entry_form.dart';

class Items extends StatefulWidget {
  final List<Item> itemData;

  const Items(this.itemData, {Key? key});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  void delete(Item item) {
    var db = DBHelper();
    db.deleteItem(item);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.itemData.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.lightBlue,
                child: Icon(Icons.group),
              ),
              title: Text(
                widget.itemData[index].name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.itemData[index].price.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(widget.itemData[index].stok.toString()),
                ],
              ),
              trailing: GestureDetector(
                child: const Icon(Icons.delete),
                onTap: () {
                  delete(widget.itemData[index]);
                },
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => EntryForm(
                      widget.itemData[index],
                      false,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}