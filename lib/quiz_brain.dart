import 'question.dart';

//constructor  to shuffle questions at the beginning
class QuizBrain {
  QuizBrain() {
    _questionBank.shuffle();
  }

  int _questionNumber = 0;                      //variable to track current question number
  List<Question> _questionBank = [             //List of questions of Questions class
    Question('China has the highest population on earth.', true),
    Question('Aeroplanes were invented before the trains.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('Only male peacocks have shiny feathers.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];
//returns the length of question bank ie number of questions
  int getLengthOfQuestions() {
    return _questionBank.length;
  }
//returns the question string
  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }
//returns the correct answer
  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }
//increment iterator to next question
  void nextQuestion() {
    _questionNumber++;
  }
//check if the questions are exhausted
  bool questionsExhausted() {
    if (_questionNumber < _questionBank.length - 1) {
      return false;
    } else {
      return true;
    }
  }
//reset the question bank by shuffling the questions and resetting the iterator
  void resetQuestions() {
    _questionNumber = 0;
    _questionBank.shuffle();
  }
}
