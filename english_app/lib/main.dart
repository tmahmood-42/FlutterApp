import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFF5F1E3),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        backgroundColor: Color(0xFF1B9AAA),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1B9AAA),
              ),
              onPressed: () {
                // Do something
              },
              child: Text('Slang'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1B9AAA),
              ),
              onPressed: () {
                // Do something
              },
              child: Text('Informal English'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1B9AAA),
              ),
              onPressed: () {
                // Do something
              },
              child: Text('Formal English'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_forward),
            label: 'Next',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            _handleHomeButtonPressed(context); // Pass the context parameter
          }
        },
      ),
    );
  }
}
//Function to GO Back Home Screen
void _handleHomeButtonPressed(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text(
            'Home',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
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
