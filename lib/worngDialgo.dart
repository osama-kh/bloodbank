import 'package:flutter/material.dart';

class worngDialgo extends StatelessWidget {
  const worngDialgo({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        height: 200,
        child: Column(
          children: [
            Flexible(
              child: Container(
                width: 100,
                child: Image.asset('assets/images/wheel-logo.png'),
              ),
            ),
            Center(
              child: Text(
                text,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Close"))
          ],
        ),
      ),
    );
  }
}
