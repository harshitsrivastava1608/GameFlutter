import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe_flutter/main.dart';

class AlertMessage extends StatefulWidget {
  @override
  _AlertMessageState createState() => _AlertMessageState();
}

class _AlertMessageState extends State<AlertMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFieldAlertDialog(),
    );
  }
}

class TextFieldAlertDialog extends StatefulWidget {
  @override
  _TextFieldAlertDialogState createState() => _TextFieldAlertDialogState();
}

class _TextFieldAlertDialogState extends State<TextFieldAlertDialog> {
  TextEditingController _textFieldController1 = TextEditingController();
  TextEditingController _textFieldController2 = TextEditingController();
  String player1 = "", player2 = "";
  initial1() {
    setState(() {
      player1 = _textFieldController1.text.toString();
    });
  }

  initial2() {
    setState(() {
      player2 = _textFieldController2.text.toString();
    });
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return Scaffold(
            body: SizedBox(
              height: 500,
              width: 500,
              child: AlertDialog(
                title: Text('On Your Marks!'),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(player1 + "*" + player2),
                    TextField(
                      controller: _textFieldController1,
                      decoration: InputDecoration(
                        hintText: "Name Player1",
                      ),
                      onChanged: (value) => player1 = value,
                      onSubmitted: (value) => player1 = value,
                      onEditingComplete: () {
                        setState(() {
                          initial1();
                          player1 = _textFieldController1.text.toString();
                        });
                      },
                    ),
                    TextField(
                      controller: _textFieldController2,
                      decoration: InputDecoration(hintText: "Name Player2"),
                      onChanged: (value) => player2 = value,
                      onSubmitted: (value) => player2 = value,
                      onEditingComplete: () {
                        setState(() {
                          initial2();
                          player2 = _textFieldController2.text.toString();
                        });
                      },
                    ),
                  ],
                ),
                actions: <Widget>[
                  new ElevatedButton(
                    child: new Text('Start Game'),
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(300, 50))),
                    onPressed: () {
                      setState(() {
                        initial1();
                        initial2();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MyGame(player1, player2)));
                      });
                    },
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              alignment: Alignment.topCenter,
              child: Text(
                "TIC-TAC-TOE",
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber),
              )),
          Container(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.yellow),
                  fixedSize: MaterialStateProperty.all(Size(300, 100))),
              child: Text(
                'Getting Started',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () => _displayDialog(context),
            ),
          ),
        ],
      ),
    );
  }
}