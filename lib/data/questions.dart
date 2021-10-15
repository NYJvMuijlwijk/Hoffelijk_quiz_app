import 'package:hoffelijk_quiz_app/data/classes/question.dart';

class Questions {

  static List<Question> GetQuestions(){
    return [
      Question(
        question: "0",
        answer: "0",
        secundaryAnswers: ["1", "2"],
        score: 0,
      ),
      Question(
        question: "1",
        answer: "1",
        secundaryAnswers: ["2", "3"],
        score: 1,
      ),
      Question(
        question: "2",
        answer: "2",
        secundaryAnswers: ["4", "3"],
        score: 2,
      ),
      Question(
        question: "3",
        answer: "3",
        secundaryAnswers: ["2", "4"],
        score: 3,
      ),
      Question(
        question: "4",
        answer: "4",
        secundaryAnswers: ["2", "3"],
        score: 4,
      ),
      Question(
        question: "5",
        answer: "5",
        secundaryAnswers: ["2", "3"],
        score: 5,
      ),
    ];

  }
  
}