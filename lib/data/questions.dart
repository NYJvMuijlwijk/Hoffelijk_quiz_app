import 'package:hoffelijk_quiz_app/data/classes/question.dart';

class Questions {
  static List<Question> GetQuestions() {
    return [
      Question(
        question: "I am part of your body. You can hold me in your left hand but not in your right hand. What am I?",
        answer: "Right hand",
        secundaryAnswers: ["Left hand", "Right leg"],
        score: 3,
      ),
      Question(
        question: "If Tom's father is Tony, then Tony is the _____ of Tom's father.",
        answer: "Name",
        secundaryAnswers: ["Father", "Son"],
        score: 2,
      ),
      Question(
        question: "I am a 7 letter word. I become longer when my third letter is removed. Who am I?",
        answer: "Lounger",
        secundaryAnswers: ["Lasting", "Lengthy"],
        score: 2,
      ),
      Question(
        question: "I start with a T, end with a T, and have T in me. Who am I?",
        answer: "Teapot",
        secundaryAnswers: ["Tent", "Twilight"],
        score: 2,
      ),
      Question(
        question: "What falls but never breaks?",
        answer: "Night",
        secundaryAnswers: ["Day", "Noon"],
        score: 2,
      ),
    ];
  }
}
