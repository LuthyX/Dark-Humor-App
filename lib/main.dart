import 'package:flutter/material.dart';

void main () {
  runApp(MyApp());
}

 class MyApp extends StatefulWidget{
  @override
  State <StatefulWidget> createState(){
    return MyAppState();
  }
 }

class MyAppState extends State<MyApp> {
  var jokes = [
    {'question':'“Siri, why am I still single?!”' , 'answer':'*Siri activates front camera.*'},
    {'question':'What does my dad have in common with Nemo?' , 'answer':'They both can’t be found.'},
    {'question':'You’re not completely useless.' , 'answer':'You can always serve as a bad example.'},
    {'question':'Why don’t cannibals eat clowns?' , 'answer':'Because they taste funny.'},
    {'question':'The guy who stole my diary just died.' , 'answer':'My thoughts are with his family.'},
    {'question':'Don’t challenge Death to a pillow fight.' , 'answer':'Unless you’re prepared for the reaper cushions.'},
  ];


      var jokeIndex = 0;

      changeJokeIndex(String direction){
        if (direction== 'next'){
          if(jokeIndex !=jokes.length-1) {
            setState(() {
              jokeIndex++;
            });
          }else {
              setState((){
                jokeIndex =jokeIndex = 0;
              });
           }
        }

        else if (direction== 'prev'){
          if (jokeIndex !=0) {
            setState(() {
              jokeIndex--;
            });
          } else {
            setState((){
              jokeIndex=jokes.length-1;
            });
          }
        }
      }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
      Scaffold(
        appBar: AppBar(
          title: Text('Dark Humour Jokes'),
          backgroundColor: Colors.grey[900],
          centerTitle: true,
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Container(
                margin: EdgeInsets.all(25),
                child: Text(
                  jokes[jokeIndex]['question'] as String,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 5, 15, 45),
                child: Text(
                  jokes[jokeIndex]['answer'] as String,
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB (15, 0, 15, 0),
                    child: FloatingActionButton(
                      onPressed: (){changeJokeIndex('prev');},
                      child: Icon(
                        Icons.arrow_left_rounded,
                        size: 50,
                      ),
                      backgroundColor: Colors.grey[800],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB (15, 0, 15, 0),
                    child: FloatingActionButton(
                      onPressed: (){changeJokeIndex('next');},
                      child: Icon(
                        Icons.arrow_right_rounded,
                        size: 50,
                      ),
                      backgroundColor: Colors.grey[800],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
