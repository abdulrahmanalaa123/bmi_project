import 'package:first_project/components.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'mainPage.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({required this.bmi, super.key});
  final Bmi bmi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Your Result',
              style: Constants.iconTextStyle.copyWith(fontSize: 50),
            ),
          ),
          Expanded(
            child: Cards(
                childObj: ResultsContent(
                  bmi: bmi,
                ),
                color: Constants.contColor,
                fun: () {}),
          ),
          const BottomBar(text: 'Re-Calculate', pop: true, page: SizedBox()),
        ],
      ),
    );
  }
}

class ResultsContent extends StatelessWidget {
  const ResultsContent({required this.bmi, super.key});
  final Bmi bmi;
  @override
  Widget build(BuildContext context) {
    bmi.init();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 100,
        ),
        Expanded(
          child: Text(
            bmi.getTitle(),
            style: Constants.iconTextStyle
                .copyWith(color: Colors.greenAccent, fontSize: 25),
          ),
        ),
        Expanded(
          child: Text(bmi.getBmi(),
              style: Constants.numbersTextStyle.copyWith(fontSize: 80)),
        ),
        const SizedBox(height: 100),
        Expanded(
          child: Text(
            bmi.getAdvice(),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
