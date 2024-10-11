import 'package:flutter/material.dart';

class FifthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fifth Screen"),
      ),
      body: GestureDetector(
        onVerticalDragEnd: (details) {
          if (details.velocity.pixelsPerSecond.dx < 2000) {
            // Swipe Down - navigate back to HomeScreen
            Navigator.pop(context);
          }
        },
        child: Container(
          // Use Container to cover the entire screen
          color: Colors.transparent, // Make sure the container is transparent
          child: Center(
            child: Text(
              "This is the Fifth screen!",
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
