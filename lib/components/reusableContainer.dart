import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid19stats/components/constants.dart';

class ReusableContainer extends StatelessWidget {
  ReusableContainer(
      {this.caseArea,
      this.confirmCase,
      this.activeCase,
      this.recoveredCase,
      this.deathCase});
  final String caseArea;
  final int confirmCase;
  final int activeCase;
  final int recoveredCase;
  final int deathCase;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Material(
        elevation: 4.0,
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  caseArea,
                  style: KCaseAreaTextStyle,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFAB19C),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                          'Confirmed\n'
                          '$confirmCase',
                          style: KConfirmedCaseStyle,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFB0D5FF),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          'Active\n'
                          '$activeCase',
                          style: KActiveCaseStyle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFA0E99C),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          'Recovered\n'
                          '$recoveredCase',
                          style: KRecoveredCaseStyle,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFE8685),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          'Death\n'
                          '$deathCase',
                          style: KDeathCaseStyle,
                        ),
                      ),
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
}
