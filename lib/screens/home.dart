import 'package:bmi_calculator/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/widgets/left_bar.dart';
import 'package:bmi_calculator/widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI CALCULATOR",
          style: TextStyle(
            color: accentHexColor,
            fontWeight: FontWeight.w300,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _heightController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "height",
                        hintStyle: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w300,
                            color: Color(0x17B3DB).withOpacity(.8))),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "weight",
                        hintStyle: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w300,
                            color: Color(0x17B3DB).withOpacity(.8))),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                print("**************************** result ");
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if (_bmiResult > 25) {
                    _textResult = "you are over weight";
                  } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                    _textResult = "you have a normal weight";
                  } else {
                    _textResult = "you are under weight";
                  }
                  print(_bmiResult);
                });
              },
              child: Container(
                child: Text(
                  "CALCULATE",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: accentHexColor),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(fontSize: 90, color: accentHexColor),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w400,
                      color: accentHexColor),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            LeftBar(
              barWidth: 40,
            ),
            SizedBox(
              height: 20,
            ),
            LeftBar(
              barWidth: 70,
            ),
            SizedBox(
              height: 20,
            ),
            LeftBar(
              barWidth: 40,
            ),
            SizedBox(
              height: 20,
            ),
            RightBar(barWidth: 70),
            SizedBox(
              height: 30,
            ),
            RightBar(barWidth: 70),
          ],
        ),
      ),
    );
  }
}
