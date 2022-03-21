// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:covid19_app/constant.dart';
import 'package:covid19_app/widgets/counter_widget.dart';
import 'package:covid19_app/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid19 App',
      theme: ThemeData(
        scaffoldBackgroundColor: KBackgroundColor,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: KBodyTextColor),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Header(
            image: 'assets/images/Drcorona.svg',
            textTop: 'All you need',
            textBottom: 'is stay at home',
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Color(0xFFE5E5E5),
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/maps-and-flags.svg'),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: DropdownButton(
                    isExpanded: true,
                    underline: SizedBox(),
                    icon: SvgPicture.asset('assets/icons/dropdown.svg'),
                    value: 'Nigeria',
                    items: ['Nigeria', 'China', 'USA', 'Italy']
                        .map<DropdownMenuItem<String>>(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Case Update\n',
                            style: KTitleTextstyle,
                          ),
                          TextSpan(
                            text: 'Newest update March 20th',
                            style: TextStyle(
                              color: KTextLightColor,
                            ),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    Text(
                      'See details',
                      style: TextStyle(
                          color: KPrimaryColor, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 30,
                        color: KShadowColor,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Counter(
                        color: KInfectedColor,
                        number: 1042,
                        title: 'infected',
                      ),
                      Counter(
                        color: KDeathColor,
                        number: 84,
                        title: 'Deaths',
                      ),
                      Counter(
                        color: KRecoverColor,
                        number: 958,
                        title: 'Recovered',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Spread of virus',
                      style: KTitleTextstyle,
                    ),
                    Text(
                      'see details',
                      style: TextStyle(
                        color: KPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(20),
                  height: 178,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 30,
                        color: KShadowColor,
                      )
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/map.png',
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
