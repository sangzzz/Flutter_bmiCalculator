import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_text_card.dart';
import 'constants.dart';
import 'bottom_container.dart';
import 'calculator_brain.dart';
import 'bmi_calculation.dart';

class BMICalculator extends StatefulWidget {
  BMICalculator({Key key}) : super(key: key);

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  Gender selectedGender;
  double height = 120;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI Calculator',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: kBottomContainerColor,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableCard(
                  color: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  gestureActionOnTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: IconTextCard(
                    icon: FontAwesomeIcons.mars,
                    text: 'MALE',
                  ),
                ),
                ReusableCard(
                  color: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  gestureActionOnTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: IconTextCard(
                    icon: FontAwesomeIcons.venus,
                    text: 'FEMALE',
                  ),
                ),
              ],
            ),
          ),
          ReusableCard(
            color: kActiveCardColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'HEIGHT',
                  style: kTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      height.toInt().toString(),
                      style: kValueTextStyle,
                    ),
                    Text(
                      'CM',
                      style: kTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0XFF8E9D98),
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0XFFEB1555),
                    overlayColor: Color(0X29EB1555),
                    thumbShape: RoundSliderThumbShape(
                      enabledThumbRadius: 15.0,
                    ),
                    overlayShape: RoundSliderOverlayShape(
                      overlayRadius: 30.0,
                    ),
                  ),
                  child: Slider(
                    value: height,
                    min: 120,
                    max: 220,
                    divisions: 100,
                    onChanged: (double value) {
                      setState(() {
                        height = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ReusableCard(
                  color: kActiveCardColor,
                  child: ValueCard(
                    value: weight,
                    titleText: 'WEIGHT',
                    unitText: 'KG',
                    onPressed1: () {
                      setState(() {
                        weight--;
                      });
                    },
                    onPressed2: () {
                      setState(() {
                        weight++;
                      });
                    },
                  ),
                ),
                ReusableCard(
                  color: kActiveCardColor,
                  child: ValueCard(
                    value: age,
                    titleText: 'AGE',
                    unitText: '',
                    onPressed1: () {
                      setState(() {
                        age--;
                      });
                    },
                    onPressed2: () {
                      setState(() {
                        age++;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          BottomContainer(
            onTap: () {
              CalculatorBrain calculatorBrain = CalculatorBrain(
                height: height.toInt(),
                weight: weight,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BMI(
                    bmi: calculatorBrain.calculateBMI(),
                    result: calculatorBrain.result(),
                    advice: calculatorBrain.advice(),
                  ),
                ),
              );
            },
            text: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}

class ValueCard extends StatelessWidget {
  final int value;
  final Function onPressed1;
  final Function onPressed2;
  final String titleText;
  final String unitText;
  ValueCard(
      {this.onPressed1,
      this.onPressed2,
      this.titleText,
      this.unitText,
      this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          titleText,
          style: kTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Text(
              value.toString(),
              style: kValueTextStyle,
            ),
            Text(
              unitText,
              style: kTextStyle,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            OperationButton(
              icon: FontAwesomeIcons.minus,
              onPressed: onPressed1,
            ),
            OperationButton(
              icon: FontAwesomeIcons.plus,
              onPressed: onPressed2,
            ),
          ],
        ),
      ],
    );
  }
}

class OperationButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  OperationButton({this.onPressed, this.icon});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      heroTag: null,
      child: Icon(
        icon,
        color: Colors.white,
      ),
      backgroundColor: Colors.blueGrey.shade700,
    );
  }
}
