import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({required Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _loginEntrepreneur() {
    Navigator.pushNamed(context, '/entrepreneur');
  }

  void _loginEmployee() {
    Navigator.pushNamed(context, '/employee');
  }

  void _loginEmployee1() {
    Navigator.pushNamed(context, '/employee1');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(200, 175, 255, 1),
            Color.fromRGBO(250, 118, 102, 1)
          ],
        )),
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: (Image(image: AssetImage('assets/images/logo.png')))),
              Expanded(
                  flex: 2,
                  child: (Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: _loginEmployee,
                          child: Text('Pievienoties ar Facebook'),
                          style: TextButton.styleFrom(
                              minimumSize: Size(250, 50),
                              backgroundColor: Color(0xFF4267B2), // foreground
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0))),
                        ),
                        ElevatedButton(
                          onPressed: _loginEmployee1,
                          child: Text('Pievienoties ar Google'),
                          style: TextButton.styleFrom(
                              minimumSize: Size(250, 50),
                              backgroundColor: Color(0xFFDB4437), // foreground
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0))),
                        ),
                        ElevatedButton(
                          onPressed: _loginEntrepreneur,
                          child: Text('Pievienoties ar LinkedIn'),
                          style: TextButton.styleFrom(
                              minimumSize: Size(250, 50),
                              backgroundColor: Color(0xFF0E76A8), // foreground
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(30.0))),
                        )
                      ])))
            ],
          ),
        ),
      ),
    );
  }
}
