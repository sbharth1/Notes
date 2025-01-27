import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Note extends StatefulWidget {
  const Note({super.key});

  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<Note> {
  bool isDarkMode = false;
  final TextEditingController _noteController = TextEditingController();

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
    print(isDarkMode ? "light" : "dark");
  }

  void _showNoteInput() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,  
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(  
            child: SingleChildScrollView( 
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    child: TextField(
                      controller: _noteController,
                      decoration: InputDecoration(
                        hintText: 'Type Notes here...',
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.all(15),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _noteController.clear();
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle save functionality here
                          print('Note Saved: ${_noteController.text}');
                          Navigator.pop(context);
                          _noteController.clear();
                        },
                        child: Text('Save'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,  // Ensures the body resizes when the keyboard appears
      body: Column(
        children: [_searchFeild()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showNoteInput,
        child: SvgPicture.asset(
          'assets/icons/add-circle-svgrepo-com.svg',
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
          hintText: 'Type Notes here...',
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
                ],
              ),
            ),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
        ),
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
