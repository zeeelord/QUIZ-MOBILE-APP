import 'package:quiz_app/model/questionBank.dart';
import 'package:flutter/material.dart';

/* styleForposter() {
    return TextStyle(fontWeight: FontWeight.w400, color: Colors.green);
  }
*/
class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

//quiz app
class _QuizState extends State<Quiz> {
  int _currentQuestionIndex = 0;
  List questionBank = [
    QuestionBank.name("What is the purpose of the US Constitution?", true),
    QuestionBank.name("What is the purpose of the US Constitution?", true),
    QuestionBank.name("What is the purpose of the US Constitution?", false),
    QuestionBank.name(
      "What is the Bill of Rights, and why was it added to the Constitution?",
      true,
    ),
    QuestionBank.name(
      "What are the three branches of government established by the Constitution, and what are their respective powers and responsibilities?",
      false,
    ),
    QuestionBank.name(
      "What is the significance of the 14th Amendment to the US Constitution?",
      false,
    ),
    QuestionBank.name(
      "What is the process for amending the US Constitution, and how many times has it been amended?",
      false,
    ),
    QuestionBank.name(
      "What are the qualifications for holding the office of President of the United States, as outlined in the Constitution?",
      true,
    ),
    QuestionBank.name(
      "How is the Supreme Court established and what is its role in interpreting the Constitution?",
      true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("True Citizen"), centerTitle: true),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "lib/images/1.1 flag.png",
              width: 250,
              height: 180,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(14.4),
                border: Border.all(
                  color: Colors.blueGrey.shade400,
                  style: BorderStyle.solid,
                ),
              ),
              height: 120.0,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      questionBank[_currentQuestionIndex].questionText,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _previousQuestion(),
                child: Icon(Icons.arrow_back),
              ),
              ElevatedButton(
                onPressed: () => _checkAnswer(true),

                child: Text("True "),
              ),
              ElevatedButton(
                onPressed: () => _checkAnswer(false),
                style: ElevatedButton.styleFrom(
                  //backgroundColor: Colors.white,
                  // foregroundColor: Colors.white,
                  // elevation: 5,
                ),
                child: Text("False"),
              ),
              ElevatedButton(
                onPressed: () => _nextQuestion(),

                child: Icon(Icons.arrow_forward),
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }

  _checkAnswer(bool userChoice) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      debugPrint("yes is correct! ");
      final snackBar = SnackBar(
        backgroundColor: Colors.green,
        content: Text("correct"),
        duration: Duration(milliseconds: 100),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      _nextQuestion();
    } else {
      debugPrint("incorrect!");
      final snackBar = SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text("wrong"),
        duration: Duration(milliseconds: 200),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      _nextQuestion();
    }
  }

  _nextQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _previousQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }
} //====== end of quiz app
