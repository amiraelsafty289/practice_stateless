import 'package:flutter/material.dart';
import 'package:practice_stateful_widget/AddContact.dart';
import 'package:practice_stateful_widget/Task/TaskScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practice',
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('Contacts Screen',),
          centerTitle: true,
        ),
        body: MyScreen(),
      ),
    );

  }
}
