import 'package:covid19stats/screen/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:covid19stats/services/networking.dart';
import 'package:covid19stats/services/adreesInfoData.dart';
import 'package:geocoder/geocoder.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getAllInfo();
  }

  void getAllInfo() async {
    Network network = Network();
    Address addressInfo = await network.getCurrentLocationAddress();
    AddressInfoData addressInfoData = AddressInfoData();
    var districtData = await addressInfoData.getDistrictData();
    var stateData = await addressInfoData.getStateData();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(
          addressInfo: addressInfo,
          stateData: stateData,
          districtData: districtData,
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
                'Please enable your location',
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
