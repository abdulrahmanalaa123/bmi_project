import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'components.dart';
import 'resultsPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender _gender = Gender.male;
  int weight = 80;
  int age = 20;
  int height = 125;

  void _weightAdd() {
    setState(() {
      weight++;
    });
  }
/* how can i pass a reference of a variable to chnage its state and make the state an input?*/
/* to reduce the code i need to type for each variable as a set state since its the same*/

  void _weightMin() {
    setState(() {
      weight--;
    });
  }

  void _ageAdd() {
    setState(() {
      age++;
    });
  }

  void _ageMin() {
    setState(() {
      age--;
    });
  }

  void _slider(double val) {
    setState(() {
      height = val.round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: Cards(
                fun: () {
                  setState(() {
                    _gender = Gender.male;
                  });
                },
                color: _gender == Gender.male
                    ? Constants.contColor
                    : Constants.inactiveContColor,
                childObj: IconItem(
                  icon: FontAwesomeIcons.mars,
                  text: 'MALE',
                  mainColor: _gender == Gender.male
                      ? Constants.iconActiveColor
                      : Constants.iconInactiveColor,
                ),
              )),
              Expanded(
                child: Cards(
                  fun: () {
                    setState(() {
                      _gender = Gender.female;
                    });
                  },
                  color: _gender == Gender.female
                      ? Constants.contColor
                      : Constants.inactiveContColor,
                  childObj: IconItem(
                    icon: FontAwesomeIcons.venus,
                    text: 'FEMALE',
                    mainColor: _gender == Gender.female
                        ? Constants.iconActiveColor
                        : Constants.iconInactiveColor,
                  ),
                ),
              )
            ],
          )),
          Expanded(
            child: Cards(
              fun: () {},
              color: Constants.contColor,
              childObj: SliderCardObj(height: height.toDouble(), fun: _slider),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    child: Cards(
                  fun: () {},
                  color: Constants.contColor,
                  childObj: CountObjects(
                    varType: 'Weight',
                    varValue: weight,
                    add: () {
                      _weightAdd();
                    },
                    minus: () {
                      _weightMin();
                    },
                  ),
                )),
                Expanded(
                    child: Cards(
                  fun: () {},
                  color: Constants.contColor,
                  childObj: CountObjects(
                    varType: 'Age',
                    varValue: age,
                    add: () {
                      _ageAdd();
                    },
                    minus: () {
                      _ageMin();
                    },
                  ),
                )),
              ],
            ),
          ),
          BottomBar(
            text: 'Calculate',
            pop: false,
            page: SecondPage(
                bmi: Bmi(
              height: height.toDouble(),
              weight: weight.toDouble(),
            )),
          )
        ],
      ),
    );
  }
}
