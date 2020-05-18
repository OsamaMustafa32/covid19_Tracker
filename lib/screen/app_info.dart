import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid19stats/components/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class AppInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Material(
                elevation: 6.0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.forward,
                        size: 30.0,
                      ),
                      Text('APP INFO',
                          style: KCaseTextStyle.copyWith(fontSize: 30.0)),
                    ],
                  ),
                ),
              ),
              Material(
                elevation: 6.0,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'About app',
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Ubuntu',
                            color: Colors.black54),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Covid 19 Stats is an application built in Flutter,to demonstrate the use of flutter in modern app development.\n'
                        'it simply loads the cases information from Government website,and represent it in a more detailed way.',
                        style: KInfoTextStyle,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Material(
                elevation: 4.0,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Credits', style: KAppInfoTitle),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Special thanks to COVID19-India API team and apify for creating and maintaining this databases.\n'
                        'A volunteer-driven API for Covid-19 stats & patient tracing in India (Unofficial).\n'
                        'For more info about Covid19-India API,click on this link',
                        style: KInfoTextStyle,
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchURL();
                        },
                        child: Text('https://github.com/covid19india/api\n',
                            style: KLinkTextStyle),
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchURL2();
                        },
                        child: Text(
                          'https://apify.com/covid-19',
                          style: KLinkTextStyle,
                        ),
                      ),
                      Text(
                        'And also this app would not have been possible without the Flutter toolkit,an open-source UI software development kit created by Google\n'
                        'thanks to all the developers and contributors in the Flutter Community.\n'
                        'icons used in project is from',
                        style: KInfoTextStyle,
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchURL3();
                        },
                        child: Text(
                          'https://www.flaticon.com/\n',
                          style: KLinkTextStyle,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _launchURL4();
                        },
                        child: Text(
                          'https://www.rawpixel.com/?sort=shuffle&page=1',
                          style: KLinkTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Material(
                elevation: 10.0,
                child: Container(
                  padding: EdgeInsets.only(left: 20.0, bottom: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'About Developer',
                        style: KAppInfoTitle,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.info,
                            size: 30.0,
                            color: Colors.lightBlue,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          GestureDetector(
                            onTap: () {
                              _launchURL5();
                            },
                            child: Text(
                              'Osama Mustafa\n'
                              '3rd Year Engineering UnderGraduate',
                              style: KLinkTextStyle.copyWith(
                                  letterSpacing: 0.5,
                                  fontSize: 19.0,
                                  color: Color(0xFF002B98),
                                  fontFamily: 'Ubuntu',
                                  decoration: TextDecoration.none),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://github.com/covid19india/api';
  launch(url);
}

_launchURL2() async {
  const url = 'https://apify.com/covid-19';
  launch(url);
}

_launchURL3() async {
  const url = 'https://www.flaticon.com/';
  launch(url);
}

_launchURL4() async {
  const url = 'https://www.rawpixel.com/?sort=shuffle&page=1';
  launch(url);
}

_launchURL5() async {
  const url = 'https://github.com/OsamaMustafa32';
  launch(url);
}
