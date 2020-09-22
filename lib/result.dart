import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore >= 8) {
      resultText = "You know him!! :)";
    } else if (resultScore >= 5) {
      resultText = "You don't know him!";
    } else {
      resultText = "You don't know him AT ALL!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 50, 15, 15),
        child: Column(
          children: <Widget>[
            Text(
              resultPhrase,
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            FlatButton(
              child: Text(
                'Restart Quiz!',
              ),
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: resetHandler,
            ),
          ],
        ),
      ),
    );
  }
}
