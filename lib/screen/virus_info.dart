import 'package:covid19stats/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VirusInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF7FAFA0), Colors.white70],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Image.asset(
                    'images/Thanks.jpg',
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(6.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Symptoms',
                      style: KCaseAreaTextStyle.copyWith(fontSize: 30.0),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Material(
                          elevation: 8.0,
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  'images/HEADACAHE.png',
                                  width:
                                      MediaQuery.of(context).size.height * 0.09,
                                ),
                                Text(
                                  'Headache',
                                  style: KCaseTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        Material(
                          elevation: 8.0,
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  'images/FEVERR.png',
                                  width:
                                      MediaQuery.of(context).size.height * 0.12,
                                ),
                                Text(
                                  'Fever',
                                  style: KCaseTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                        Material(
                          elevation: 8.0,
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  'images/CAUGHH.png',
                                  width:
                                      MediaQuery.of(context).size.height * 0.07,
                                ),
                                Text(
                                  'Caugh',
                                  style: KCaseTextStyle,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Material(
                elevation: 10.0,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Preventions',
                      style: KCaseAreaTextStyle.copyWith(fontSize: 30.0),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                child: Image.asset(
                                  'images/mask.png',
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Wear Mask',
                                style: KCaseTextStyle,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Container(
                            child: Expanded(
                              child: Text(
                                'Wear a mask if you are coughing or sneezing.\n\n'
                                'Masks are effective only when used in combination with frequent hand-cleaning with alcohol-based hand rub or soap and water.',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    child: Image.asset(
                                      'images/sanitizer.jpg',
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    'Handwashing',
                                    style: KCaseTextStyle,
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                child: Expanded(
                                  child: Text(
                                    'Handwashing must be done properly and with soap and water.\n\n'
                                    ' When soap and water are not available, the next best option is to use an alcohol-based hand sanitizer.',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600),
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
