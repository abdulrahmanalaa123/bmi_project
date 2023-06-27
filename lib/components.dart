import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Cards extends StatelessWidget {
  const Cards(
      {required this.childObj,
      required this.color,
      required this.fun,
      super.key});
  final Widget childObj;
  final Color color;
  final void Function() fun;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fun,
      child: Container(
        margin: Constants.basicMargin,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        child: childObj,
      ),
    );
  }
}

class SliderCardObj extends StatelessWidget {
  const SliderCardObj({required this.height, required this.fun, super.key});

  final double height;
  final SliderFun fun;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Height',
          style: Constants.iconTextStyle
              .copyWith(color: Constants.iconInactiveColor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              height.toString(),
              style: Constants.numbersTextStyle,
            ),
            Text(
              'cm',
              style: Constants.iconTextStyle
                  .copyWith(color: Constants.iconInactiveColor),
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.white,
            inactiveTrackColor: Constants.iconInactiveColor,
            overlappingShapeStrokeColor: Constants.appRedColor,
            secondaryActiveTrackColor: Constants.appRedColor,
            thumbShape: const RoundSliderThumbShape(
              enabledThumbRadius: 15,
              elevation: 10,
            ),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 30),
            overlayColor: Constants.appRedColor.withOpacity(0.16),
          ),
          child: Slider(
            value: height,
            onChanged: fun,
            max: 240,
            min: 120,
            thumbColor: Constants.appRedColor,
          ),
        ),
      ],
    );
  }
}

class CountObjects extends StatelessWidget {
  const CountObjects({
    required this.varType,
    required this.varValue,
    required this.add,
    required this.minus,
    super.key,
  });
  final String varType;
  final int varValue;
  final void Function() add;
  final void Function() minus;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          varType,
          style: Constants.iconTextStyle
              .copyWith(color: Constants.iconInactiveColor),
        ),
        Text(
          varValue.toString(),
          style: Constants.numbersTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyButton(
              icon: FontAwesomeIcons.minus,
              fun: minus,
            ),
            const SizedBox(
              width: 10,
            ),
            MyButton(
              icon: FontAwesomeIcons.plus,
              fun: add,
            )
          ],
        )
      ],
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({required this.icon, required this.fun, super.key});
  final IconData icon;
  final void Function() fun;
  @override
  Widget build(BuildContext context) {
    /*used for demonstration purposes although it will be deprecated soon*/
    /*Shouldve used buttonStyling object for customization of current
    button widgets which contains same customization properties*/
    return RawMaterialButton(
      onPressed: fun,
      constraints: const BoxConstraints.tightFor(height: 57, width: 57),
      fillColor: Constants.mainColor,
      elevation: 10,
      shape: const CircleBorder(),
      padding: const EdgeInsets.all(10),
      child: Icon(icon),
    );
  }
}

class IconItem extends StatelessWidget {
  const IconItem(
      {required this.icon,
      required this.text,
      required this.mainColor,
      super.key});
  final IconData icon;
  final String text;
  final Color mainColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: Constants.iconSizes,
          color: mainColor,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          text,
          style: Constants.iconTextStyle.copyWith(color: mainColor),
        )
      ],
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    required this.pop,
    required this.page,
    required this.text,
    super.key,
  });

  final bool pop;
  final Widget page;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pop
            ? Navigator.pop(context)
            : Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: Constants.appRedColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        height: Constants.bottomContHeight,
        child: Text(
          text,
          style: Constants.numbersTextStyle.copyWith(fontSize: 40),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
