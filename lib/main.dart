import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double width = 100;
  double heght = 100;
  String text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          alignment: Alignment.center,
          width: width,
          height: heght,
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(18)),
          child: Text(text),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            width = Random().nextInt(300).toDouble();
            heght = Random().nextInt(300).toDouble();
            text = 'Айдана';
          });
        },
        child: const Icon(Icons.replay_outlined),
      ),
    );
  }
}
