import 'package:flutter/material.dart';
import 'package:flutter_circular_progress_indicator/flutter_circular_progress_indicator.dart';
import 'package:lottie/lottie.dart';

class AiWaitingPage extends StatefulWidget {
  const AiWaitingPage({Key? key}) : super(key: key);

  @override
  _AiWaitingPageState createState() => _AiWaitingPageState();
}

class _AiWaitingPageState extends State<AiWaitingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.95),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 50),
            child: LottieBuilder.network(
              "https://lottie.host/cfe88cf7-5012-4cb8-8645-20a685316583/r7SHWmwKPR.json",
              width: 290,
              height: 265,
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: CircularProgressInd().normalCircular(
                height: 55,
                width: 55,
                isSpining: true,
                secondaryColor: Colors.deepPurple[900],
                secondaryWidth: 10,
                backgroundColor: Colors.amber,
                padding: EdgeInsets.all(10),
                backgroundBorder:
                    Border.all(color: Colors.deepPurple, width: 3),
                valueWidth: 6),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200, left: 50),
            child: Text(
              "Yapay zeka tarafından test ediliyor...",
              style: TextStyle(
                  color: Color(0XFF898989),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
