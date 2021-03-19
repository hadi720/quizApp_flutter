import 'package:flutter/material.dart';
import 'Quizbrain.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(quizapp());
}

class quizapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: quizBody(),
    );
  }
}

class quizBody extends StatefulWidget {
  @override
  _quizBodyState createState() => _quizBodyState();
}

class _quizBodyState extends State<quizBody> {
  List<Icon> scoreKepper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();
    if (userPickedAnswer == correctAnswer) {
      final player = AudioCache();
      player.play('1.wav');
      scoreKepper.add(Icon(
        Icons.check_box,
        color: Colors.greenAccent,
        size: 30,
      ));
    } else {
      final player = AudioCache();
      player.play('2.mp3');
      scoreKepper.add(Icon(
        Icons.indeterminate_check_box,
        color: Colors.redAccent,
        size: 30,
      ));
    }
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.error,
          title: "Finish",
          desc: 'You\'ve reached the end of the quiz.',
          buttons: [
            DialogButton(
              child: Text(
                "Restart",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        quizBrain.reset();
        scoreKepper = [];
      }

      quizBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  height: 450,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      Image(
                        height: 300,
                        image: AssetImage("assets/1.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 20),
                        child: Text(
                          quizBrain.getQuestionText(),
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'MERRi',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  height: 50,
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: scoreKepper,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                    ),
                    onPressed: () {
                      checkAnswer(true);
                    },
                    child: Text(
                      "True",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "MERRI",
                          fontSize: 20),
                    ),
                    color: Colors.greenAccent,
                    height: 50,
                    minWidth: 300,
                  ),
                ),
                FlatButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                  ),
                  child: Text(
                    "False",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "MERRI",
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    checkAnswer(false);
                  },
                  color: Colors.redAccent[200],
                  height: 50,
                  minWidth: 300,
                )
              ],
            ),
          ),
        ));
  }
}
// Alert(
// context: context,
// type: AlertType.error,
// title: "Finished",
// desc: "you\'ve reached the end of the quiz",
// buttons: [
// DialogButton(
// child: Text(
// "Restart",
// style:
// TextStyle(color: Colors.white, fontSize: 20),
// ),
// onPressed: () => Navigator.pop(context),
// width: 120,
// )
// ],
// ).show();
