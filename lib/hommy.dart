import 'package:flutter/material.dart';

class Hommy extends StatelessWidget {
  const Hommy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/quiz');
        },
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).textTheme.bodyLarge?.color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Welcome to the Quiz App'),
            ),
          ),
        ),
      ),
    );
  }
}
