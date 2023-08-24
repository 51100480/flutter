import 'package:demoflutter/Model.dart';
import 'package:flutter/material.dart';
import 'Cell /Cell.dart';
import 'ModalPopup/ModalPopup.dart';
import 'Restfull Api/ListUser.dart';

void main() {
  runApp( const MaterialApp(
    home: ListUserState(),
  ));
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final List<DataModel> items = [
    DataModel(id: '1', name: 'Thể thao 1'),
    DataModel(id: '2', name: 'Thể thao 2'),
    DataModel(id: '3', name: 'Thể thao 2'),
    DataModel(id: '4', name: 'Thể thao 3'),
    DataModel(id: '5', name: 'Thể thao 4'),
  ];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDoList', style: TextStyle(fontSize: 30)),
        backgroundColor: Colors.amberAccent,
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: items.map((item) => const CellWidget()).toList(),
          ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: const Icon(
          Icons.add,
          size: 40,
        ),
        onPressed: () {
          // print('on press');
          showModalBottomSheet(context: context,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
            isScrollControlled: true,
              builder: (BuildContext context) {
                return ModalPopup();
              },
          );
        },
      ),
    );
  }
}

