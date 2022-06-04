import 'package:coffeebrew/constants/color_palette.dart';

import 'package:coffeebrew/screens/romanlar.dart';
import 'package:coffeebrew/screens/hikayeler.dart';
import 'package:coffeebrew/screens/egitim.dart';

import 'package:coffeebrew/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final colorPalette = ColorPalette();

  var _selectedOption = 0;

  List allOptions = [BlackGold(), ColdBrew(), Egitim(), Home()];

  List isSelected = [false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Stack(
      children: [
        Container(
            height: screenHeight,
            width: screenWidth,
            color: Colors.transparent),
        Container(
            height: screenHeight,
            width: screenWidth / 5,
            color: colorPalette.leftBarColor),
        Positioned(
            left: screenWidth / 5,
            child: Container(
              height: screenHeight,
              width: screenWidth - (screenWidth / 5),
              color: Colors.white,
            )),
        Positioned(
            top: screenHeight - (screenHeight - 80.0),
            left: (screenWidth / 5) + 25.0,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Kütüphanecim',
                  style: GoogleFonts.bigShouldersText(
                      color: Color(0xFF23163D), fontSize: 40.0)),
              Text('Kitaplar hakkında en kolay bilgi',
                  style: GoogleFonts.bigShouldersText(
                      color: Color(0xFFA59FB0), fontSize: 15.0)),
            ])),
        buildSideNavigator(),
        Positioned(
            top: (screenHeight / 3) - 80.0,
            left: (screenWidth / 5) + 25.0,
            child: Container(
                height: screenHeight - ((screenHeight / 3)),
                width: screenWidth - ((screenWidth / 5) + 40.0),
                child: allOptions[_selectedOption]))
      ],
    ));
  }

  buildSideNavigator() {
    return Positioned(
        top: 75.0,
        child: RotatedBox(
            quarterTurns: 3,
            child: Container(
                width: MediaQuery.of(context).size.height - 100.0,
                height: MediaQuery.of(context).size.width / 5,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildOption('Romanlar', 0),
                      buildOption('Hikayeler', 1),
                      buildOption('Eğitim', 2),
                      buildOption('Ekle Çıkar', 3),
                    ]))));
  }

  buildOption(String title, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isSelected[index]
            ? Container(
                height: 8.0,
                width: 8.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFF23163D)))
            : Container(
                height: 8.0,
                width: 8.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.transparent)),
        SizedBox(height: 5.0),
        GestureDetector(
            onTap: () {
              setState(() {
                _selectedOption = index;
              });
            },
            child: Text(
              title,
              style: isSelected[index]
                  ? GoogleFonts.bigShouldersText(
                      color: Color(0xFF23163D), fontSize: 18.0)
                  : GoogleFonts.bigShouldersText(
                      color: Color(0xFFA59FB0), fontSize: 17.0),
            ))
      ],
    );
  }
/*
  isOptionSelected(index) {
    var previousIndex = isSelected.indexOf(true);
    isSelected[index] = true;
    isSelected[previousIndex] = false;
  }*/
}
