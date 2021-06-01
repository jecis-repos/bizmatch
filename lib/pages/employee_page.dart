import 'dart:math';

import 'package:bizmatch/data/employees.dart';
import 'package:bizmatch/data/entrepreneurs.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class EmployeePage extends StatefulWidget {
  EmployeePage({required Key key}) : super(key: key);

  @override
  _EmployeePageState createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  int entrepreneurIndex = 0;

  Random random = new Random();

  void _changeEntrepreneur() {
    int randomNumber = random.nextInt(entrepreneurs.length);
    if (randomNumber == entrepreneurIndex) {
      _changeEntrepreneur();
    } else {
      setState(() {
        entrepreneurIndex = randomNumber;
      });
    }
  }

  void _getBack() {
    Navigator.pop(context);
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final myData = employees[0];

  void _launchURL(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: TextButton(
            onPressed: _getBack,
            child: Icon(
              Icons.arrow_back,
              color: Color.fromRGBO(254, 60, 114, 1),
            )),
        actions: [
          TextButton(
              onPressed: () => _key.currentState!.openDrawer(),
              child: Icon(
                Icons.menu,
                color: Color.fromRGBO(254, 60, 114, 1),
              )),
        ],
        title: Text(
          'Ideju īstenotājs',
          style: TextStyle(
            color: Color.fromRGBO(254, 60, 114, 1),
          ),
        ),
        backgroundColor: Color.fromRGBO(200, 175, 255, 1),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(200, 175, 255, 1),
              ),
              child: Text(
                'Mani dati',
                style: TextStyle(
                  color: Color.fromRGBO(254, 60, 114, 1),
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.adjust_rounded),
              title: Text('Vārds:'),
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.message, color: Colors.white),
              title: Text(
                myData.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
            ListTile(
              leading: Icon(Icons.adjust_rounded),
              title: Text('Vecums:'),
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.message, color: Colors.white),
              title: Text(
                myData.age,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
            ListTile(
              leading: Icon(Icons.adjust_rounded),
              title: Text('Ieņemamais amats:'),
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.message, color: Colors.white),
              title: Text(
                myData.job.join(',\n\n'),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
            ListTile(
              leading: Icon(Icons.adjust_rounded),
              title: Text('Iepriekšējā pieredze:'),
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.message, color: Colors.white),
              title: Text(
                myData.experience.join(',\n\n'),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
            ListTile(
              leading: Icon(Icons.adjust_rounded),
              title: Text('Par mani:'),
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.message, color: Colors.white),
              title: Text(
                myData.description.join(',\n\n'),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
            ListTile(
              leading: Icon(Icons.adjust_rounded),
              title: Text('E-pasta adrese:'),
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.message, color: Colors.white),
              title: Text(
                myData.email,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
            ListTile(
              leading: Icon(Icons.adjust_rounded),
              title: Text('Tālrunis:'),
            ),
            ListTile(
              dense: true,
              leading: Icon(Icons.message, color: Colors.white),
              title: Text(
                myData.phone,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
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
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Card(
                    // child: Padding(
                    //   padding: EdgeInsets.all(16.0),
                    child: CarouselList(entrepreneurIndex: entrepreneurIndex, key: ValueKey(null),),
                    // ),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0))),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _changeEntrepreneur,
                      child: Icon(
                        Icons.thumb_down_alt_outlined,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFC70707), // foreground
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0))),
                    ),
                    ElevatedButton(
                      onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          title: Text('Kontaktinformācija:',
                              style: TextStyle(fontSize: 24.0)),
                          content: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.email_outlined,
                                      size: 24.0,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      ' E-pasta adrese:',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  style: TextButton.styleFrom(
                                    minimumSize: Size(300, 50),
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () => _launchURL(Uri(
                                          scheme: 'mailto',
                                          path: entrepreneurs[entrepreneurIndex]
                                              .email,
                                          query:
                                              'subject=Sadarbība biznesa idejā (Business Match)&body=Sveiki!\n\n...\n\nAr cieņu,\n' +
                                                  myData.name)
                                      .toString()),
                                  child: Text(
                                    entrepreneurs[entrepreneurIndex].email,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 18.0),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone_outlined,
                                      size: 24.0,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      ' Tālrunis:',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  style: TextButton.styleFrom(
                                    minimumSize: Size(300, 50),
                                    backgroundColor: Colors.white,
                                  ),
                                  onPressed: () => _launchURL(Uri(
                                          scheme: 'tel',
                                          path: entrepreneurs[entrepreneurIndex]
                                              .phone)
                                      .toString()),
                                  child: Text(
                                    entrepreneurs[entrepreneurIndex].phone,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 18.0),
                                  ),
                                ),
                              ]),
                          actions: [
                            TextButton(
                              onPressed: () => {
                                Navigator.pop(context),
                                _changeEntrepreneur()
                              },
                              child: const Text('Nākamais profils',
                                  style: TextStyle(
                                      color: Color.fromRGBO(254, 60, 114, 1))),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Aizvērt',
                                  style: TextStyle(
                                      color: Color.fromRGBO(254, 60, 114, 1))),
                            ),
                          ],
                        ),
                      ),
                      child: Icon(
                        Icons.thumb_up_alt_outlined,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xFF39C707), // foreground
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0))),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CarouselCard extends StatelessWidget {
  CarouselCard({required this.entrepreneur, required this.index});

  Entrepreneur entrepreneur;
  int index;

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return Container(
        child: Padding(
          padding: EdgeInsets.only(
            top: 16.0,
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(entrepreneur.image)),
                          borderRadius:
                              BorderRadius.all(Radius.circular(100.0)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.1),
                        child: Column(
                          children: [
                            Text(
                              entrepreneur.name + ', ' + entrepreneur.age,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 22.0,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            Text(
                              'Ideju ģenerētājs',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16.0,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width * 0.1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9 - 32,
                            decoration: BoxDecoration(color: Color(0xFFE5E5E5)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: Text(
                                            'Biznesa idejas apraksts:',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 24.0,
                                            ),
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 10,
                                          ),
                                        )
                                      ] +
                                      entrepreneur.idea.map((job) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, bottom: 8.0),
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 6),
                                                    child: Icon(
                                                      Icons.circle,
                                                      color: Colors.black,
                                                      size: 9.0,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 5,
                                                  child: Text(
                                                    job,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black,
                                                      fontSize: 18.0,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 10,
                                                    textWidthBasis:
                                                        TextWidthBasis.parent,
                                                  ),
                                                ),
                                              ]),
                                        );
                                      }).toList()),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9 - 32,
                            height: 16.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9 - 32,
                            decoration: BoxDecoration(color: Color(0xFFE5E5E5)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: Text(
                                            'Meklē:',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 24.0,
                                            ),
                                            textAlign: TextAlign.start,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 10,
                                          ),
                                        )
                                      ] +
                                      entrepreneur.job.map((job) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, bottom: 8.0),
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 6),
                                                    child: Icon(
                                                      Icons.circle,
                                                      color: Colors.black,
                                                      size: 9.0,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 5,
                                                  child: Text(
                                                    job,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: Colors.black,
                                                      fontSize: 18.0,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 10,
                                                    textWidthBasis:
                                                        TextWidthBasis.parent,
                                                  ),
                                                ),
                                              ]),
                                        );
                                      }).toList()),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
          top: 16.0,
          bottom: 16.0,
          left: 16.0,
          right: 16.0,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9 - 32,
                        decoration: BoxDecoration(color: Color(0xFFE5E5E5)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Text(
                                        'Par mani:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 24.0,
                                        ),
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 10,
                                      ),
                                    )
                                  ] +
                                  entrepreneur.description.map((job) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, bottom: 8.0),
                                      child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 6),
                                                child: Icon(
                                                  Icons.circle,
                                                  color: Colors.black,
                                                  size: 9.0,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 5,
                                              child: Text(
                                                job,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black,
                                                  fontSize: 18.0,
                                                ),
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 10,
                                                textWidthBasis:
                                                    TextWidthBasis.parent,
                                              ),
                                            ),
                                          ]),
                                    );
                                  }).toList()),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CarouselList extends StatefulWidget {
  final int entrepreneurIndex;

  CarouselList({required Key key, required this.entrepreneurIndex}) : super(key: key);

  @override
  _CarouselListState createState() => _CarouselListState();
}

class _CarouselListState extends State<CarouselList> {
  int currentPage = 0;

  Widget updateIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [0, 1].map(
        (idx) {
          return Container(
            width: 16.0,
            height: 16.0,
            margin: EdgeInsets.symmetric(horizontal: 6.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentPage == idx
                  ? Color.fromRGBO(254, 60, 114, 1)
                  : Color(0xFFA6AEBD),
            ),
          );
        },
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 5 / 6 - 114,
              width: double.infinity,
              child: PageView.builder(
                itemBuilder: (context, index) {
                  return Opacity(
                    opacity: currentPage == index ? 1.0 : 0.5,
                    child: CarouselCard(
                        entrepreneur: entrepreneurs[widget.entrepreneurIndex],
                        index: index),
                  );
                },
                itemCount: 2,
                controller: PageController(initialPage: 0, viewportFraction: 1),
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: updateIndicators(),
        )
      ],
    );
  }
}
