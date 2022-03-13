import 'package:flutter/material.dart';
import 'storybrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Storybrain storybrain = Storybrain();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {

  void finished(){
    bool corectanswer=storybrain.isfinished();
    setState(() {

      if(corectanswer==true){

        Alert(
          context: context,
          title: 'Finished',
          desc: 'you\ve reached end of quiz',
        ).show();
        storybrain.reset();
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(
                    storybrain.getquestion(),
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Visibility(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.blue,
                      ),
                      child: Text(
                        storybrain.getoptiona(),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {

                        setState(() {
                          storybrain.nextquestion();
                          finished();
                        });
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Visibility(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.red,
                    ),
                    child: Text(
                     storybrain.getoptionb(),
                      style: TextStyle(
                        // color: Colors.white,
                        backgroundColor: Colors.red,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {

                      setState(() {
                        storybrain.nextquestion();
                        finished();
                      });
                    },
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
