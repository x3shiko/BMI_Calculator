import 'package:flutter_application_1/constants/app_constants.dart';
import 'package:flutter_application_1/widgets/left_bar.dart';
import 'package:flutter_application_1/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
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
          "BMI Calculator",
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      hintStyle: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                double h = double.parse(_heightController.text);
                double w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = w / (h * h);
                  if (_bmiResult < 18.5) {
                    _textResult = "Underweight";
                  }
                  if (_bmiResult >= 18.5 && _bmiResult < 25) {
                    _textResult = "Acceptable Weight";
                  }
                  if (_bmiResult >= 25 && _bmiResult <= 30) {
                    _textResult = "Overweight";
                  }
                  if (_bmiResult > 30) {
                    _textResult = "Obese";
                  }
                });
              },
              child: Text(
                "Calculate",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: accentHexColor,
                ),
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(fontSize: 90, color: accentHexColor),
              ),
            ),
            SizedBox(height: 30),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Text(
                _textResult,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: accentHexColor,
                ),
              ),
            ),
            SizedBox(height: 10),
            LeftBar(barWidth: 40),
            SizedBox(height: 10),
            LeftBar(barWidth: 70),
            SizedBox(height: 10),
            LeftBar(barWidth: 30),
            SizedBox(height: 50),
            RightBar(barWidth: 70),
            SizedBox(height: 30),
            RightBar(barWidth: 40),
          ],
        ),
      ),
    );
  }
}
