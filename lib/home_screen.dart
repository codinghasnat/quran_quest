import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'blank_function.dart';
import 'second_screen.dart'; // Import the second screen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, String> result = blankedWords(3, quran.getVerse(2, 5));

    return Padding(
      padding: EdgeInsets.all(50.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(
              "\nVerse 1: \n" + quran.getVerse(2, 5),
              style: TextStyle(fontSize: 30, fontFamily: 'Scheherazade_New'),
              textDirection: TextDirection.rtl,
            ),
            SelectableText(
              "\nOriginal Verse: \n" + result['original']!,
              style: TextStyle(fontSize: 30, fontFamily: 'Scheherazade_New'),
              textDirection: TextDirection.rtl,
            ),
            SelectableText(
              "\nBlanked Words: \n" + result['blanked']!,
              style: TextStyle(fontSize: 30, fontFamily: 'Scheherazade_New'),
              textDirection: TextDirection.rtl,
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the second screen when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                );
              },
              child: Text("Go to Second Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
