import 'package:flutter/material.dart';

void main() {
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
                Text(
                  'English Advantage',
                  style: TextStyle(
                    color: Color(0xFF1B9AAA),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
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
                      MaterialPageRoute(builder: (context) => Slang()),
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

class Slang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
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
