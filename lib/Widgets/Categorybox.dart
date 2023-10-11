import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.all(Radius.circular(25))),
      width: 200,
      height: 250,
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // Add your functionality here
        },
        child: Center(
          child: Text(
            'Hi',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
