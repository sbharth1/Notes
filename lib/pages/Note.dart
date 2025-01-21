import 'package:flutter/material.dart';

class Note extends StatelessWidget {
  const Note({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
        actions: [
          GestureDetector(
              onTap: () {
                print("light");
              },
              child: Container(
                margin: EdgeInsets.all(15),
                width: 35,
                alignment: Alignment.center,
                child: const Text('Dark'),
              ))
        ],
      ),
      body: Center(
        child: Text("notes data"),
      ),
    );
  }
}
