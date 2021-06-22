import 'package:flutter/material.dart';

class Grid extends StatefulWidget {
  @override
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Container(
          height: 800,
          width: 900,
          child: GridView.count(
            scrollDirection: Axis.vertical,
            crossAxisCount: 3,
            children: [
              Card(
                color: Colors.teal,
              ),
              Card(
                color: Colors.cyan,
              ),
              Card(
                color: Colors.yellowAccent,
              ),
              Card(
                color: Colors.deepOrange,
              ),
              Card(
                color: Colors.red,
              ),
              Card(
                color: Colors.yellow,
              ),
              Card(
                color: Colors.purpleAccent,
              ),
              Card(
                color: Colors.indigo,
              ),
              Card(
                color: Colors.black,
              ),
              Card(
                color: Colors.pinkAccent,
              ),
              Card(
                color: Colors.teal,
              ),
              Card(
                color: Colors.cyan,
              ),
              Card(
                color: Colors.yellowAccent,
              ),
              Card(
                color: Colors.deepOrange,
              ),
              Card(
                color: Colors.yellowAccent,
              ),
              Card(
                color: Colors.deepOrange,
              ),
              Card(
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
