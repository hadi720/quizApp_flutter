import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _quesitonBank = [
    Question(
      q: 'The programs that run on a computer are referred to as hardware?',
      a: false,
    ),
    Question(
      q: 'Humans can perform computations as fast as modern computers can?',
      a: false,
    ),
    Question(
      q: 'The ARPANET was a predecessor to the Internet?',
      a: true,
    ),
    Question(
      q: 'A computer can directly understand a high-level language?',
      a: false,
    ),
    Question(
      q: 'The Framework Class Library is only used for Visual C++?',
      a: false,
    ),
    Question(
      q: 'Objects have attributes and perform actions?',
      a: true,
    ),
    Question(
      q: 'The cd command changes directories?',
      a: true,
    ),
    Question(
      q: '.cpp, .h and .exe files store C++ statements?',
      a: false,
    ),
    Question(
      q: 'Java was originally intended for use in intelligent consumer-electronic devices?',
      a: true,
    ),
    Question(
      q: 'C was initially used as the development language of the UNIX operating system?',
      a: true,
    ),
  ];
  void nextQuestion() {
    if (_questionNumber < _quesitonBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _quesitonBank[_questionNumber].questionText;
  }

  bool isFinished() {
    if (_questionNumber >= _quesitonBank.length - 1) {
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  bool getCorrectAnswer() {
    return _quesitonBank[_questionNumber].questionsAnswer;
  }

  void reset() {
    _questionNumber = 0;
  }
}
