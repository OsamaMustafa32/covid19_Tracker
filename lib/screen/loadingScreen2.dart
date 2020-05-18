import 'package:covid19stats/screen/globalCase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:covid19stats/services/adreesInfoData.dart';

class LoadingScreen2 extends StatefulWidget {
  @override
  _LoadingScreen2State createState() => _LoadingScreen2State();
}

class _LoadingScreen2State extends State<LoadingScreen2> {
  var indiaData;
  @override
  void initState() {
    super.initState();
    updateData();
  }

  void updateData() async {
    AddressInfoData addressInfoData = AddressInfoData();
    indiaData = await addressInfoData.getStateData();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => GlobalCase(
          indiaData: indiaData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF7FAFC0), Colors.white30],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Please wait while we are retrieving information',
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50.0,
              ),
              SpinKitFadingCircle(
                color: Colors.blue,
                size: 60.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
