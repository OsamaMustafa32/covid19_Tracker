import 'dart:convert';

import 'package:covid19stats/components/constants.dart';
import 'package:covid19stats/components/reusableContainer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class StateCase extends StatefulWidget {
  @override
  _StateCaseState createState() => _StateCaseState();
}

class _StateCaseState extends State<StateCase> {
  List data;

  @override
  void initState() {
    super.initState();
    this.makeRequest();
  }

  void makeRequest() async {
    var response = await http.get(
        'https://api.apify.com/v2/key-value-stores/toDWvRj1JpTXiM8FF/records/LATEST?disableRedirect=true');

    setState(() {
      var extractData = jsonDecode(response.body);
      data = extractData['regionData'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 10.0,
          backgroundColor: Colors.teal.shade200,
          title: Container(
            child: Text(
              'COVID-19 StateWise Cases',
              style: KCaseAreaTextStyle.copyWith(
                  height: 1.0, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF7FAFC0), Colors.white30],
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: LiquidPullToRefresh(
            height: 40.0,
            showChildOpacityTransition: false,
            color: Colors.blueAccent,
            backgroundColor: Colors.white,
            onRefresh: () async {
              makeRequest();
            },
            child: new ListView.builder(
              itemCount: data == null ? 0 : data.length - 1,
              itemBuilder: (BuildContext context, i) {
                var name = data[i]['region'];
                int confirmCase = data[i]['totalInfected'];
                int recoveredCase = data[i]['recovered'];
                int deathCase = data[i]['deceased'];
                int activeCase = confirmCase - (recoveredCase + deathCase);
                return ListTile(
                  contentPadding: EdgeInsets.only(
                    left: 5.0,
                    right: 5.0,
                  ),
                  title: ReusableContainer(
                    caseArea: name,
                    deathCase: deathCase,
                    recoveredCase: recoveredCase,
                    activeCase: activeCase,
                    confirmCase: confirmCase,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
