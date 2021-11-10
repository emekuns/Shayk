import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:text_editor/all_widgets/text_dialog.dart';

class HomePage extends StatefulWidget {
  final String title;
  HomePage({required this.title});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: openTextDialog,
              child: Text('Open Text', style: TextStyle(color: Colors.white),),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }

  openTextDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) => TextDialog(
            content:
            'This timeslot has been taken. Please choose another one' * 10,
            ),
    );
  }
}