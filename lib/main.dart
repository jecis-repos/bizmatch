import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './pages/employee_page.dart';
import './pages/employee_page_1.dart';
import './pages/entrepreneur_page.dart';
import './pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Business Match',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.transparent),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => MyHomePage(key: ValueKey(null)),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/entrepreneur': (context) => EntrepreneurPage(key: ValueKey(null)),
        '/employee': (context) => EmployeePage(key: ValueKey(null)),
        '/employee1': (context) => EmployeePage1(key: ValueKey(null)),
      },
    );
  }
}
