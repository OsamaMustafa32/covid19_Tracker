import 'package:covid19stats/components/constants.dart';
import 'package:covid19stats/screen/loadingScreen2.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF3383CD),
                Color(0xFF11249F),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: <Widget>[
              buildHeader(),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width * .75,
                  child: Image.asset('images/virus.png'),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * .30,
                right: 15,
                child: Container(
                  width: MediaQuery.of(context).size.width * .5,
                  child: Image.asset('images/doctor.png'),
                ),
              ),
              buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }

  Positioned buildFooter(BuildContext context) {
    return Positioned(
      bottom: 50.0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "CoronaVirus disease (COVID-19)",
              textAlign: TextAlign.center,
              style: KHeadingText,
            ),
            Text(
              "is an infectious disease caused by a new\nvirus.",
              style: TextStyle(
                fontSize: 18,
                letterSpacing: 0.5,
                color: Colors.white,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoadingScreen2(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.tealAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(1, 1),
                      spreadRadius: 1,
                      blurRadius: 3,
                    )
                  ],
                ),
                width: MediaQuery.of(context).size.width * .85,
                height: 60,
                child: Center(
                  child: Text(
                    'GET STARTED',
                    style: TextStyle(
                      color: Color(0xFF283593),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: Image.asset(
          'images/Logo1.png',
          width: MediaQuery.of(context).size.width * 0.85,
        ),
      ),
    );
  }
}
