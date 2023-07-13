import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Firebase auth package
import 'package:cloud_firestore/cloud_firestore.dart'; //firestroe package

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'English Advantage',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF5F1E3),
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.8, // Adjust the width factor as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'English Advantage',
                  style: TextStyle(
                    color: Color(0xFF1B9AAA),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the next page.
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainMenu()),
                    );
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1B9AAA),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF5F1E3),
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.8, // Adjust the width factor as needed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SlangPage()),
                    );
                  },
                  child: Text('Slang'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF1B9AAA),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Informal'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF1B9AAA),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Formal'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF1B9AAA),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SlangPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 390,
          height: 844,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Color(0xFFF5F1E3)),
          child: Stack(
            children: [
              Positioned(
                left: 22,
                top: 29,
                child: SizedBox(
                  width: 65,
                  height: 63,
                  child: Text(
                    'A',
                    style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 27,
                top: 148,
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Aight/Aite: Alright\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Josefin Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'The pizza was aight.\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Josefin Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '\nAmped: Excited\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Josefin Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'I am so amped for the party on Friday.\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Josefin Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '\nAKA: Also Known As\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Josefin Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'His name is James Harden AKA “The\nBeard”.\n\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Josefin Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Aced: Getting an A grade on something\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Josefin Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'I totally aced that calculus final.\n\n\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Josefin Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '\n\n\n\n\n\n',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Josefin Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 324,
                top: 778,
                child: Container(
                  width: 38.05,
                  height: 40,
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 7.93,
                    right: 6.34,
                    bottom: 10,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 320,
                top: 776,
                child: Container(
                  width: 38.05,
                  height: 40,
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 7.93,
                    right: 6.34,
                    bottom: 10,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 764,
                child: Container(
                  width: 390,
                  height: 80,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.71, -0.71),
                      end: Alignment(-0.71, 0.71),
                      colors: [Color(0xFF52E5E7), Color(0xFF130CB7)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 171,
                top: 780,
                child: Container(
                  width: 47,
                  height: 43,
                  child: Stack(children: [
                  ]),
                ),
              ),
              Positioned(
                left: 324,
                top: 778,
                child: Container(
                  width: 38.05,
                  height: 40,
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 7.93,
                    right: 6.34,
                    bottom: 10,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/*import 'package:flutter/material.dart';
//First APP GITHUB TESTS
void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text('English App'),
      centerTitle: true,
      backgroundColor: Colors.red[600],
    ),
    body: Center(
      child: Text(
        'Body Text',
        style : TextStyle(
          fontSize : 20.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          color : Colors.grey[600],
          ),
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      child: Text('Click'),
      backgroundColor: Colors.red[600],
    ),
  ),
));*/
