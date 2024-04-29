import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/publisher');
              },
              child: Text('Go to Publisher'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/subscriber');
              },
              child: Text('Go to Subscriber'),
            ),
          ],
        ),
      ),
    );
  }
}
