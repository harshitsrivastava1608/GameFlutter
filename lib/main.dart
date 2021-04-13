import 'package:flutter/material.dart';
import 'package:tictactoe_flutter/components.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AlertMessage(),//MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyGame extends StatelessWidget {
  String p="",q="";
  MyGame(String p,String q){
    this.p=p;this.q=q;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:p+q,debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(p,q),//MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // MyHomePage({Key key, this.title}) : super(key: key);
  // final String title;
  String p1="",p2="";
  MyHomePage(String p1,String p2){
    this.p1=p1;this.p2=p2;
  }
  @override
  _MyHomePageState createState() => _MyHomePageState(p1,p2);
}
class _MyHomePageState extends State<MyHomePage> {
  String player1="",player2="";
  _MyHomePageState(String p1,String p2){
    player1=p1;
    player2=p2;
  }
  int _turn=0;String text="";List<String> _list=["","","","","","","","","",""];String result="Winner";
  showResult(){
    if(result.compareTo("Winner")==0){
      return false;
    }
    else
      return true;
  }
  isPressed(int n){
    ++_turn;
    if(_turn%2==0) {
      text = "X";
      _list[n]="X";
    }
    else {
      text = "O";
      _list[n]="O";
    }
    if(_turn>4)
      result=checkWinner();
  }
  checkWinner(){

    if((_list[1]==_list[2])&&(_list[2]==_list[3])&&(_list[1].isNotEmpty)) {
      if(_list[1]=='O')
        return player1;
      if(_list[1]=='X')
        return player2;
    }
    if((_list[1]==_list[4])&&(_list[4]==_list[7])&&(_list[1].isNotEmpty)) {
      if(_list[1]=='O')
        return player1;
      if(_list[1]=='X')
        return player2;
    }
    if((_list[2]==_list[5])&&(_list[5]==_list[8])&&(_list[2].isNotEmpty)) {
      if(_list[2]=='O')
        return player1;
      if(_list[2]=='X')
        return player2;
    }
    if((_list[4]==_list[5])&&(_list[5]==_list[6])&&(_list[4].isNotEmpty)) {
      if(_list[4]=='O')
        return player1;
      if(_list[4]=="X")
        return player2;
    }
    if((_list[7]==_list[8])&&(_list[8]==_list[9])&&(_list[7].isNotEmpty)) {
      if(_list[7]=='O')
        return player1;
      if(_list[7]=='X')
        return player2;
    }
    if((_list[3]==_list[6])&&(_list[6]==_list[9])&&(_list[3].isNotEmpty)) {
      if(_list[3]=='O')
        return player1;
      if(_list[3]=="X")
        return player2;
    }
    if((_list[3]==_list[5])&&(_list[5]==_list[7])&&(_list[1].isNotEmpty)) {
      if(_list[3]=='O')
        return player1;
      if(_list[3]=='X')
        return player2;
    }
    if((_list[1]==_list[5])&&(_list[5]==_list[9])&&(_list[1].isNotEmpty)) {
      if(_list[1]=='O')
        return player1;
      if(_list[1]=='X')
        return player2;
    }
    else
      return "Winner";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(title: Text(p1+p2),),
        body: Center(
          child: Column(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          ElevatedButton(onPressed: (){
                            setState(() {
                              isPressed(1);
                            });
                          },
                            child: Text(_list[1].toString(),style: TextStyle(fontSize: 20,color: Colors.black),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.yellowAccent),fixedSize: MaterialStateProperty.all(Size(100, 100))),),
                          ElevatedButton(onPressed:  (){
                            setState(() {
                              isPressed(2);
                            });
                          }, child: Text(_list[2].toString(),style: TextStyle(fontSize: 20,color: Colors.black),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.greenAccent),fixedSize: MaterialStateProperty.all(Size(100, 100))),),
                          ElevatedButton(onPressed: (){
                            setState(() {
                              isPressed(3);
                            });
                          }, child: Text(_list[3].toString(),style: TextStyle(fontSize: 20,color: Colors.black),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueAccent),fixedSize: MaterialStateProperty.all(Size(100, 100))),),

                        ],
                      ),
                      Row(
                        children: <Widget>[

                          ElevatedButton(onPressed: (){
                            setState(() {
                              isPressed(4);
                            });
                          }, child: Text(_list[4].toString(),style: TextStyle(fontSize: 20,color: Colors.black),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.greenAccent),fixedSize: MaterialStateProperty.all(Size(100, 100))),),
                          ElevatedButton(onPressed:(){
                            setState(() {
                              isPressed(5);
                            });
                          }, child: Text(_list[5].toString(),style: TextStyle(fontSize: 20,color: Colors.black),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueAccent),fixedSize: MaterialStateProperty.all(Size(100, 100))),),
                          ElevatedButton(onPressed: (){
                            setState(() {
                              isPressed(6);
                            });
                          }, child: Text(_list[6].toString(),style: TextStyle(fontSize: 20,color: Colors.black),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.yellowAccent),fixedSize: MaterialStateProperty.all(Size(100, 100))),),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          ElevatedButton(onPressed: (){
                            setState(() {
                              isPressed(7);
                            });
                          }, child: Text(_list[7].toString(),style: TextStyle(fontSize: 20,color: Colors.black),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueAccent),fixedSize: MaterialStateProperty.all(Size(100, 100))),),
                          ElevatedButton(onPressed: (){
                            setState(() {
                              isPressed(8);
                            });
                          }, child: Text(_list[8].toString(),style: TextStyle(fontSize: 20,color: Colors.black),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.yellowAccent),fixedSize: MaterialStateProperty.all(Size(100, 100))),),
                          ElevatedButton(onPressed: (){
                            setState(() {
                              isPressed(9);
                            });
                          }, child: Text(_list[9].toString(),style: TextStyle(fontSize: 20,color: Colors.black),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.greenAccent),fixedSize: MaterialStateProperty.all(Size(100, 100))),),
                        ],
                      )

                    ],
                  ),
                ),
              ),

              Text(result),
              Visibility(
                visible: showResult(),
                child: AlertDialog(

                  title: Text("The winner is :"+result),
                  actions: [
                    ElevatedButton(onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>AlertMessage()));
                    }, child: Text("Play Again"))
                  ],
                ),
              )
              //Text(p1+p2)
            ],
          ),
        )
    );
  }
}
