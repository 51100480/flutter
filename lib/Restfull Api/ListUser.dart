
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ListUserState extends StatefulWidget {
  const ListUserState({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListUserOnline();
  }
}

class ListUserOnline extends State<ListUserState> {

  List<dynamic> users = [];
  @override
  void initState() {
    super.initState();
    fetchUserOnline();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     floatingActionButton: FloatingActionButton(onPressed: fetchUserOnline),
     appBar: AppBar(
       title: const Text('Hello all users', style: TextStyle(fontSize: 30.0)),
       backgroundColor: Colors.blue,
     ) ,
     body: ListView.builder(
       padding: const EdgeInsets.all(8),
       itemCount: users.length,
         itemBuilder: (BuildContext context, int index) {
         print(index);
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(users[index]['picture']['medium']),
                ),
                title:  Text(users[index]['name']['last']),
                subtitle:  Text(users[index]['email']),
              );
         },
     ),
   );
  }

  void fetchUserOnline() async {
    final clientRq = http.Client();
    const url = 'https://randomuser.me/api/?results=50';
    final uri = Uri.parse(url);
    final response = await clientRq.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });
  }
}