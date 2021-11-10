import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextDialog extends StatefulWidget {
  final String content;

  const TextDialog({required this.content});

  @override
  _TextDialogState createState() => _TextDialogState();
}

class _TextDialogState extends State<TextDialog> {
  late ScrollController scrollController;
  bool atBottom = false;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    super.initState();
  }

  scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      setState(() {
        atBottom = true;
      });
    } else {
      setState(() {
        atBottom = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(left: 25, right: 25),
      title: Center(child: Text("Information")),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      content: Container(
        height: 200,
        width: 300,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(this.widget.content),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            atBottom ?
            Container(
              width: MediaQuery.of(context).size.width * 0.20,
              child: ElevatedButton(
                child: new Text(
                  'Okay',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ) :
            Container(
              width: MediaQuery.of(context).size.width * 0.20,
              child: ElevatedButton(
                child: new Text(
                  'Okay',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.grey)),
                onPressed: () => null,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 70.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.20,
                child: ElevatedButton(
                  child: new Text(
                    'Close',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
          ],
        )
      ],
    );
  }
}
