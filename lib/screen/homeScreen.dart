import 'package:covid19stats/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/model.dart';
import 'package:covid19stats/components/reusableContainer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    this.addressInfo,
    this.stateData,
    this.districtData,
  });
  final Address addressInfo;
  final stateData;
  final districtData;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String districtName;
  String stateName;
  String countryName;
  int districtConfirmCase;
  int districtActiveCase;
  int districtRecoveredCase;
  int districtDeathCase;
  int stateConfirmCase;
  int stateActiveCase;
  int stateRecoveredCase;
  int stateDeathCase;
  int countryConfirmCase;
  int countryActiveCase;
  int countryRecoveredCase;
  int countryDeathCase;
  var time;

  @override
  void initState() {
    super.initState();
    updateDomainName(widget.addressInfo);
    updateDistrictData(widget.districtData);
    updateStateAndCountryData(widget.stateData);
  }

  void updateDomainName(Address addressInfo) {
    districtName = addressInfo.subAdminArea;
    stateName = addressInfo.adminArea;
    countryName = addressInfo.countryName;
  }

  void updateDistrictData(dynamic districtData) {
    districtConfirmCase = districtData['$stateName']['districtData']
        ['$districtName']['confirmed'];
    districtActiveCase =
        districtData['$stateName']['districtData']['$districtName']['active'];
    districtRecoveredCase = districtData['$stateName']['districtData']
        ['$districtName']['recovered'];
    districtDeathCase =
        districtData['$stateName']['districtData']['$districtName']['deceased'];
  }

  void updateStateAndCountryData(dynamic stateAndCountryData) {
    for (int i = 0; i < 33; i++) {
      var getState = stateAndCountryData['regionData'][i]['region'];
      if (getState == stateName) {
        stateConfirmCase =
            stateAndCountryData['regionData'][i]['totalInfected'];
        stateRecoveredCase = stateAndCountryData['regionData'][i]['recovered'];
        stateDeathCase = stateAndCountryData['regionData'][i]['deceased'];
        stateActiveCase =
            stateConfirmCase - (stateRecoveredCase + stateDeathCase);
      }
    }
    countryConfirmCase = stateAndCountryData['totalCases'];
    countryActiveCase = stateAndCountryData['activeCases'];
    countryRecoveredCase = stateAndCountryData['recovered'];
    countryDeathCase = stateAndCountryData['deaths'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF7FAFC0), Colors.indigoAccent.shade100],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 15.0, left: 10.0),
                child: Text(
                  'CoronaVirus(COVID-19)\n'
                  'Cases In Your Area',
                  style: KCaseTextStyle.copyWith(fontSize: 30.0),
                ),
              ),
              Expanded(
                child: ReusableContainer(
                    caseArea: districtName,
                    confirmCase: districtConfirmCase,
                    activeCase: districtActiveCase,
                    recoveredCase: districtRecoveredCase,
                    deathCase: districtDeathCase),
              ),
              Expanded(
                child: ReusableContainer(
                  caseArea: stateName,
                  confirmCase: stateConfirmCase,
                  activeCase: stateActiveCase,
                  recoveredCase: stateRecoveredCase,
                  deathCase: stateDeathCase,
                ),
              ),
              Expanded(
                child: ReusableContainer(
                  caseArea: countryName,
                  confirmCase: countryConfirmCase,
                  activeCase: countryActiveCase,
                  recoveredCase: countryRecoveredCase,
                  deathCase: countryDeathCase,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
