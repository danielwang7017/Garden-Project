import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OnboardPage(), // Start with the Onboarding page
    );
  }
}
// --- This is the First Screen (Home Page) ---
class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bridge-53769_1280.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Fade gradient overlay
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.blue, // Change to your desired fade color
                ],
                stops: [0, 1], // Adjust fade position
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(height:350),
                Icon(
                  Icons.account_circle,
                  size: 250,
                  color: Colors.white,
                ),
                SizedBox(height:40),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 60), // width, height
                    textStyle: TextStyle(fontSize: 24), // bigger text
                  ),
                  child: const Text('Sign in')),
                SizedBox(height:30),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 60), // width, height
                    textStyle: TextStyle(fontSize: 24), // bigger text
                  ),
                  child: const Text('Sign up')),
              ],

            ),

          ),
        ],
      ),
    );
  }
}