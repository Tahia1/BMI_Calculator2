import 'package:flutter/material.dart';
import 'listview_page.dart';
import 'gridview_page.dart';
import 'bmi_calculator_page.dart'; // Import BMI Calculator Page

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Only check login fields for BMI Calculator
  bool _isLoginInputValid() {
    return emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
  }

  void _goToPage(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  void _goToBmiCalculator() {
    if (_isLoginInputValid()) {
      _goToPage(const BMICalculatorPage());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password to continue to BMI Calculator.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator Login'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => _goToPage(const ListviewPage()),
                child: const Text('Go to List View'),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () => _goToPage(const GridviewPage()),
                child: const Text('Go to Grid View'),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: _goToBmiCalculator,
                child: const Text('Go to BMI Calculator'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
