import 'package:flutter/material.dart';

class BMICalculatorPage extends StatefulWidget {
  const BMICalculatorPage({super.key});

  @override
  State<BMICalculatorPage> createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  double? bmiResult;
  String? errorTextHeight;
  String? errorTextWeight;

  void calculateBMI() {
    final heightText = heightController.text;
    final weightText = weightController.text;

    final double? height = double.tryParse(heightText);
    final double? weight = double.tryParse(weightText);

    setState(() {
      errorTextHeight = heightText.isEmpty ? "Can't be empty" : null;
      errorTextWeight = weightText.isEmpty ? "Can't be empty" : null;

      if (height != null && weight != null && height > 0) {
        bmiResult = weight / ((height / 100) * (height / 100));
      } else {
        bmiResult = null;
      }
    });
  }

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.brown,
        width: 2,
        style: BorderStyle.solid,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(40)),
    );

    final textStyle = const TextStyle(
      color: Colors.brown,
      fontSize: 23,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 5,
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          height: 550,
          child: Card(
            elevation: 5,
            shadowColor: const Color.fromARGB(255, 104, 95, 95),
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.monitor_weight, size: 40, color: Colors.brown),
                  const SizedBox(height: 10),
                  Text("Calculate Your BMI", style: textStyle),
                  const SizedBox(height: 20),
                  TextField(
                    controller: heightController,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      errorText: errorTextHeight,
                      errorBorder: border,
                      focusedErrorBorder: border,
                      label: const Text("Height (cm)"),
                      labelStyle: const TextStyle(color: Colors.black),
                      hintText: "Enter height in cm",
                      prefixIcon: const Icon(Icons.height),
                      prefixIconColor: Colors.brown,
                      focusedBorder: border,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: weightController,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      errorText: errorTextWeight,
                      errorBorder: border,
                      focusedErrorBorder: border,
                      label: const Text("Weight (kg)"),
                      labelStyle: const TextStyle(color: Colors.black),
                      hintText: "Enter weight in kg",
                      prefixIcon: const Icon(Icons.fitness_center),
                      prefixIconColor: Colors.brown,
                      focusedBorder: border,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: calculateBMI,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.brown,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text("Calculate"),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    bmiResult != null
                        ? 'Your BMI is: ${bmiResult!.toStringAsFixed(2)}'
                        : 'Enter valid values',
                    style: const TextStyle(
                      color: Colors.brown,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
