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
      backgroundColor: Colors.white,
      body: Column(
        children: [_searchFeild()],
      ),

      floatingActionButton: FloatingActionButton(onPressed: () {
        print("clicked");
      },
      child: SvgPicture.asset('assets/icons/add-circle-svgrepo-com.svg',
      height: 100,
     width: 100,
     ),
     shape: CircleBorder(),
     elevation: 0,
      ),

    );
  }

  Container _searchFeild() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xff1F1617).withOpacity(0.11),
          blurRadius: 40,
        )
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Type Notes',
            hintStyle: (TextStyle(
              color: Color(0xffDDDADA),
              fontSize: 14,
            )),
            contentPadding: EdgeInsets.all(15),
            suffixIcon: SizedBox(
                width: 100,
                child: IntrinsicHeight(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                      VerticalDivider(
                        color: Colors.black,
                        thickness: 0.1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(13),
                        child: SvgPicture.asset(
                            'assets/icons/three-dots-vertical-svgrepo-com.svg'),
                      )
                    ]))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none)),
      ),
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
