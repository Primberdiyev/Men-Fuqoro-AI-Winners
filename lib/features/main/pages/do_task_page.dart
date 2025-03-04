import 'package:flutter/material.dart';
import 'package:men_fuqoro_ai/features/main/models/question_model.dart';
import 'package:men_fuqoro_ai/features/main/widgets/questions.dart';

class DoTaskPage extends StatefulWidget {
  const DoTaskPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DoTaskPageState createState() => _DoTaskPageState();
}

class _DoTaskPageState extends State<DoTaskPage> {
  int currentQuestionIndex = 0;
  int score = 0;
  String? selectedAnswer;
  List<Question> selectedQuestions = [];

  @override
  void initState() {
    super.initState();
    _selectRandomQuestions();
  }

  void _selectRandomQuestions() {
    questions.shuffle();
    selectedQuestions = questions.take(5).toList();
  }

  void checkAnswer(String userAnswer) {
    if (userAnswer == selectedQuestions[currentQuestionIndex].correctAnswer) {
      setState(() {
        score++;
      });
      showResultDialog(true);
    } else {
      showResultDialog(false);
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex < selectedQuestions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswer = null;
      });
    } else {
      showFinalResult();
    }
  }

  void showResultDialog(bool isCorrect) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(isCorrect ? "To'g'ri!" : "Noto'g'ri!"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              isCorrect
                  ? Icon(Icons.check_circle, color: Colors.green, size: 60)
                  : Icon(Icons.cancel, color: Colors.red, size: 60),
              SizedBox(height: 10),
              Text(isCorrect
                  ? "Ajoyib, siz to'g'ri javob berdingiz!"
                  : "Afsuski, javob noto'g'ri. To'g'ri javob: ${selectedQuestions[currentQuestionIndex].correctAnswer}"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                nextQuestion();
              },
              child: Text("Keyingi Savol"),
            ),
          ],
        );
      },
    );
  }

  void showFinalResult() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Test Yakunlandi"),
          content:
              Text("Sizning natijangiz: $score/${selectedQuestions.length}"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  currentQuestionIndex = 0;
                  score = 0;
                  _selectRandomQuestions();
                });
              },
              child: Text("Qayta Boshlash"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mehnat Kodeksi Testi"),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Savol ${currentQuestionIndex + 1}/${selectedQuestions.length}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              selectedQuestions[currentQuestionIndex].questionText,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ...selectedQuestions[currentQuestionIndex].options.map((option) {
              return ElevatedButton(
                onPressed: () => checkAnswer(option),
                child: Text(option),
              );
            }),
            SizedBox(height: 20),
            Text(
              "Jami to'plangan ball: $score",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
