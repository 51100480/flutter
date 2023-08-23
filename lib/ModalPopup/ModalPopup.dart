

import 'package:flutter/material.dart';

class ModalPopup extends StatelessWidget {
  const ModalPopup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
            children: [
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
              labelText: 'Your task'
            ) ,
          ),
              SizedBox(height: 40,),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: (){

                },
                    child: const Text('Add task', style: TextStyle(fontSize: 20),),

                ),
              )
        ]),
      ),
    );
  }
}

