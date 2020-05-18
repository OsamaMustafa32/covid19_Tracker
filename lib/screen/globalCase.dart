import 'package:covid19stats/screen/loadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:covid19stats/components/constants.dart';
import 'package:flutter_boom_menu/flutter_boom_menu.dart';
import 'package:covid19stats/screen/state_Case.dart';
import 'package:covid19stats/screen/virus_info.dart';
import 'package:covid19stats/screen/app_info.dart';

class GlobalCase extends StatefulWidget {
  GlobalCase({this.indiaData});
  final indiaData;
  @override
  _GlobalCaseState createState() => _GlobalCaseState();
}

class _GlobalCaseState extends State<GlobalCase> {
  int countryConfirmCase;
  int countryRecoveredCase;
  int countryDeathCase;
  @override
  void initState() {
    super.initState();
    updateIndiaData(widget.indiaData);
  }

  void updateIndiaData(var indiaData) {
    setState(() {
      countryConfirmCase = indiaData['totalCases'];
      countryRecoveredCase = indiaData['recovered'];
      countryDeathCase = indiaData['deaths'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: BoomMenu(
          animatedIcon: AnimatedIcons.menu_arrow,
          animatedIconTheme: IconThemeData(size: 22.0),
          scrollVisible: true,
          overlayColor: Colors.black,
          overlayOpacity: 0.7,
          children: [
            MenuItem(
              elevation: 20.0,
              child: Icon(Icons.location_on, color: Colors.black),
              title: "Location Case Stats",
              titleColor: Colors.white,
              subtitle: "Know CoronaVirus Cases in Your Area",
              subTitleColor: Colors.white,
              backgroundColor: Color(0xFFE57F84),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return LoadingScreen();
                }),
              ),
            ),
            MenuItem(
              elevation: 20.0,
              child: Icon(Icons.home, color: Colors.black),
              title: "State Wise Cases",
              titleColor: Colors.white,
              subtitle: "Know CoronaVirus Case in States",
              subTitleColor: Colors.white,
              backgroundColor: Color(0xFF549369),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return StateCase();
                }),
              ),
            ),
            MenuItem(
              elevation: 20.0,
              child: Icon(Icons.ac_unit, color: Colors.black),
              title: "CoronaVirus(covid-19)",
              titleColor: Colors.white,
              subtitle: "know More Info About Virus",
              subTitleColor: Colors.white,
              backgroundColor: Color(0xFF3CACAE),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return VirusInfo();
                }),
              ),
            ),
            MenuItem(
              elevation: 20.0,
              child: Icon(Icons.info, color: Colors.black),
              title: "App Info",
              titleColor: Colors.black,
              subtitle: "Application Related Information",
              subTitleColor: Colors.black,
              backgroundColor: Colors.white70,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return AppInfo();
                }),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(90.0),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [
                        Color(0xFF5289B5),
                        Color(0xFFEDF2F3),
                      ],
                    ),
                    image: DecorationImage(
                      image: AssetImage('images/virusss.png'),
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          //height: MediaQuery.of(context).size.height * 0.75,
                          width: MediaQuery.of(context).size.width * 0.55,
                          child: Image(
                            image: AssetImage('images/person.png'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 130.0, left: 50.0),
                        child: Text(
                          'Stay Home\n'
                          'Stay Safe',
                          style: KHeadingText.copyWith(
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.75,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.white70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                          child: Text(
                            'CoronaVirus Cases In INDIA  ',
                            style: KCaseTextStyle.copyWith(
                              fontSize: 30.0,
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Material(
                                elevation: 10.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Column(
                                      children: <Widget>[
                                        Image(
                                          image:
                                              AssetImage('images/confirm.png'),
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        Text(
                                            'Confirmed\n'
                                            '$countryConfirmCase',
                                            style: KConfirmedCaseStyle),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: Material(
                                elevation: 10.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 15,
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Image(
                                          image: AssetImage(
                                              'images/recoveredCase.png'),
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        Text(
                                          'Recovered\n'
                                          '$countryRecoveredCase',
                                          style: KRecoveredCaseStyle,
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Expanded(
                              child: Material(
                                elevation: 10.0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 15,
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Image(
                                          image: AssetImage(
                                              'images/DeathCase.png'),
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        Text(
                                            'Death\n'
                                            '$countryDeathCase',
                                            style: KDeathCaseStyle),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Spread of CoronaVirus',
                          style: KCaseTextStyle,
                        ),
                      ),
                      Image(
                        image: AssetImage('images/worldMapp.png'),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
