import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Note extends StatefulWidget {
  const Note({super.key});

  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
    print(isDarkMode ? "light" : "dark");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top:40,left: 20,right:20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xff1F1617).withOpacity(0.11),
                  blurRadius: 40,
                )
              ]
            ),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none
                )
              ),
            ),
          )
        ],
      )
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        "Notes",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.green,
      actions: [
        GestureDetector(
          onTap: toggleTheme,
          child: Container(
            margin: EdgeInsets.all(15),
            width: 35,
            alignment: Alignment.center,
            child: SvgPicture.asset(
              isDarkMode
                  ? 'assets/icons/sun-svgrepo-com.svg'
                  : 'assets/icons/moon-svgrepo-com.svg',
              height: 20,
              width: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
