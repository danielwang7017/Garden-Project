import 'package:flutter/material.dart';
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SigninPage()));
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
              width: 200, 
              height:200, 
              child: Image.asset(
                'assets/icons/icon-blueberry.png',
                fit: BoxFit.contain, 
              ),
            ),
            
            SizedBox(height: 150),
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
              onPressed: () => showDialog<String>(
                context: context, 
                builder: (BuildContext context) => Dialog(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Verify email and password sign up, also check if email isnt already used', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomePage()),
                            );
                          }, 
                          child: Text('Continue to Home')
                        ),
                      ],
                    ),
                  ),
                )
              ),
              
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: Size(200, 60), 
                textStyle: TextStyle(fontSize: 24), 
                
              ),
              child: Text('Create Account'),
              
            ),
            SizedBox(height:20),
            Text("or"),
            SizedBox(height:20),
            ElevatedButton.icon(
              onPressed: () => showDialog<String>(
                context: context, 
                builder: (BuildContext context) => Dialog(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Verify google sign up info with firebase', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomePage()),
                            );
                          }, 
                          child: Text('Continue to Home')
                        ),
                      ],
                    ),
                  ),
                )
              ),
              label: Text('Sign up with Google'), icon: Image.asset('assets/icons/googleloginlogo.jpg', height:54, width:54,),
            ),
          ],
        ),
      ),
    );
  }
}
// -- log in page
class SigninPage extends StatefulWidget{
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}
class _SigninPageState extends State<SigninPage>{
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
            
            SizedBox(height: 150),
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
              onPressed: () => showDialog<String>(
                context: context, 
                builder: (BuildContext context) => Dialog(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Check whether login information is correct and then give login successful information', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomePage()),
                            );
                          }, 
                          child: Text('Continue to Home')
                        ),
                      ],
                    ),
                  ),
                )
              ),
              
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: Size(200, 60), 
                textStyle: TextStyle(fontSize: 24), 
                
              ),
              child: Text('Sign In'),
              
            ),
            SizedBox(height:20),
            Text("or"),
            SizedBox(height:20),

            ElevatedButton.icon(
              onPressed: () => showDialog<String>(
                context: context, 
                builder: (BuildContext context) => Dialog(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Check whether login information is correct and then give login successful information', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomePage()),
                            );
                          }, 
                          child: Text('Continue to Home')
                        ),
                      ],
                    ),
                  ),
                )
              ),
              label: Text('Sign in with Google'), icon: Image.asset('assets/icons/googleloginlogo.jpg', height:54, width:54,),
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
      body: const Center(
        child: Column(
          
          children: [
            
            
          ],
        ),
      ),
    );
  }
}