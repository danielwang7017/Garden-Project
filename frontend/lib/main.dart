import 'package:flutter/material.dart';
import 'daniel/test_ai.dart';
import 'matthew/test_backend.dart';

const Color primaryColor = Color.fromARGB(255, 37, 49, 140);
const Color secondaryColor = Color.fromARGB(240, 120, 143, 205);
const Color accentColor = Color(0xFF43A047);
const Color backgroundColor = Color.fromARGB(255, 255, 255, 255);
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
// --- This is the First Screen (Onboarding) ---
class OnboardPage extends StatelessWidget {
  
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
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
                  primaryColor, 
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
                  onPressed: () {
                    
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 60), // width, height
                    textStyle: TextStyle(fontSize: 24), 
                  ),
                  child: const Text('Sign in')),
                SizedBox(height:30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 60), // width, height
                    textStyle: TextStyle(fontSize: 24), 
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
class SignUpPage extends StatefulWidget{
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage>{
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context){
    
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          children: [
            SizedBox(height:100),
            SizedBox(
              width: 200, // desired width
              height:200, // desired height
              child: Image.asset(
                'assets/icons/icon-blueberry.png',
                fit: BoxFit.contain, // or BoxFit.cover, etc.
              ),
            ),
            
            SizedBox(height: 50),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                
                labelText: 'Enter your email',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                
                labelText: 'Enter your password',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: Size(200, 60), 
                textStyle: TextStyle(fontSize: 24), 
                
              ),
              child: Text('Create Account'),
              
            ),
          ],
        ),
      ),
    );
  }
}
// -- home page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Welcome Back!', style: TextStyle(color: Colors.white)),
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        shape: const RoundedRectangleBorder(
          
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {
              // Handle settings button press
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          
          children: [
            
            // This is where Daniel's test thing will go
            TestAI(label: "AI", onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Test - AI")),
                );
            }),

            // This is where Matthew's test thing will go
            TestBackend(label: "Backend", onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Test - Backend")),
                );
            })

          ],
        ),
      ),
    );
  }
}