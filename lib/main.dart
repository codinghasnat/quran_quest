import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'blank_function.dart';
import 'home_screen.dart'; // Import HomeScreen
import 'second_screen.dart'; // Import the second screen
import 'third_screen.dart'; // Import the third screen
import 'fourth_screen.dart'; // Import the fourth screen
import 'fifth_screen.dart'; // Import the fifth screen
import 'package:dartarabic/dartarabic.dart';

void main() {
  runApp(MyApp()); // Call the MyApp widget
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quran App',
      home: MainScreen(), // Use MainScreen for navigation
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  double verticalDragStart = 0;
  double horizontalDragStart = 0;

  void _onVerticalDragStart(DragStartDetails details) {
    verticalDragStart = details.globalPosition.dy;
  }

  void _onHorizontalDragStart(DragStartDetails details) {
    horizontalDragStart = details.globalPosition.dx;
  }

  void _onSwipeDown() {
    // Navigate to the FourthScreen on swipe down
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FourthScreen()),
    );
  }

  void _onSwipeUp() {
    // Navigate to the SecondScreen on swipe up
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondScreen()),
    );
  }

  void _onSwipeLeft() {
    // Navigate to the ThirdScreen on swipe left
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ThirdScreen()),
    );
  }

  void _onSwipeRight() {
    // Navigate to the FifthScreen on swipe right
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FifthScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quran App"), // The AppBar will be present on all screens
      ),
      body: GestureDetector(
        onVerticalDragEnd: (details) {
          double verticalDragEnd = details.velocity.pixelsPerSecond.dy;
          if (verticalDragEnd - verticalDragStart > 2000) {
            // Swipe Down
            _onSwipeDown();
          } else if (verticalDragEnd - verticalDragStart < -2000) {
            // Swipe Up
            _onSwipeUp();
          }
        },
        onHorizontalDragEnd: (details) {
          double horizontalDragEnd = details.velocity.pixelsPerSecond.dx;
          if (horizontalDragEnd - horizontalDragStart > 2000) {
            // Swipe Right
            _onSwipeRight();
          } else if (horizontalDragEnd - horizontalDragStart < -2000) {
            // Swipe Left
            _onSwipeLeft();
          }
        },
        child: HomeScreen(), // Set HomeScreen as the default
      ),
    );
  }
}
