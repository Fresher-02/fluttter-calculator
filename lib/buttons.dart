import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final color;
  final setcolor;
  final String buttontext;
  final buttontap;
  const MyButtons(this.color, this.buttontext, this.setcolor, this.buttontap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.white30,
                    offset: Offset(4.0, 4.0),
                    // spreadRadius: 3,
                    blurRadius: 4),
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(-4.0, -4.0),
                    // spreadRadius: 3,
                    blurRadius: 4)
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              // decoration: BoxDecoration(shape: BoxShape.circle),
              color: color,
              child: Center(
                child: Text(
                  buttontext,
                  style: TextStyle(fontSize: 25, color: setcolor),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
