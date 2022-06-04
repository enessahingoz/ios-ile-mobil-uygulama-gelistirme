import 'package:coffeebrew/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeDetails extends StatefulWidget {
  final imgPath, headerColor;
  String name, detail, details, writer;

  CoffeeDetails(
      {this.imgPath,
      this.headerColor,
      this.name,
      this.detail,
      this.details,
      this.writer});

  @override
  _CoffeeDetailsState createState() => _CoffeeDetailsState();
}

class _CoffeeDetailsState extends State<CoffeeDetails> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Stack(children: [
      Container(
          height: screenHeight, width: screenWidth, color: Colors.transparent),
      Container(
          height: screenHeight,
          width: screenWidth,
          color: ColorPalette().leftBarColor),
      Container(
          height: screenHeight / 2,
          width: screenWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              ),
              color: Colors.white)),
      Container(
          height: (screenHeight / 4 + 25.0),
          width: screenWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              ),
              image: DecorationImage(
                  image: AssetImage('assets/doodle.png'), fit: BoxFit.none))),
      Container(
          height: (screenHeight / 4 + 25.0),
          width: screenWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              ),
              color: Colors.white.withOpacity(0.6))),
      Container(
          height: (screenHeight / 4 + 25.0),
          width: screenWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              ),
              color: widget.headerColor.withOpacity(0.9))),
      Positioned(
          top: 35.0,
          left: 20.0,
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          )),
      Positioned(
          top: 35.0,
          right: 20.0,
          child: Icon(
            Feather.shopping_bag,
            color: Colors.white,
          )),
      Positioned(
          top: (screenHeight / 4 - 100.0),
          left: screenWidth / 4,
          child: Container(
              child: Image(
                  image: AssetImage(widget.imgPath),
                  height: 175.0,
                  width: 175.0,
                  fit: BoxFit.cover))),
      Positioned(
          top: (screenHeight / 4) + 85.0,
          left: screenWidth / 7,
          child: Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text(
                  widget.name,
                  style: GoogleFonts.bigShouldersText(
                      color: Color(0xFF23163D), fontSize: 24.0),
                ),
                SizedBox(height: 10.0),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Feather.user),
                  SizedBox(width: 10.0),
                  Text(
                    widget.writer,
                    style: GoogleFonts.bigShouldersText(
                        color: ColorPalette().firstSlice, fontSize: 20.0),
                  ),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(Feather.book),
                  SizedBox(width: 10.0),
                  Text(
                    widget.detail,
                    style: GoogleFonts.bigShouldersText(
                        color: ColorPalette().firstSlice, fontSize: 20.0),
                  ),
                ])
              ]))),
      Positioned(
          top: screenHeight / 2 + 10.0,
          left: 25.0,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Açıklama',
              style: GoogleFonts.bigShouldersText(
                  color: Color(0xFF23163D), fontSize: 30.0),
            ),
            SizedBox(height: 10.0),
            Container(
              width: screenWidth - 40.0,
              height: 300,
              child: SingleChildScrollView(
                child: Text(
                  widget.details,
                  style: GoogleFonts.bigShouldersText(
                      color: Colors.black, fontSize: 20.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
          ]))
    ]));
  }

  buildOneItem(price) {
    return Stack(children: [
      Container(height: 125.0, width: 200.0, color: Colors.transparent),
      Positioned(
          top: 50.0,
          child: Container(
            height: 75.0,
            width: 200.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 4.0,
                      spreadRadius: 2.0,
                      color: Colors.grey.withOpacity(0.2))
                ],
                color: Colors.white),
          )),
    ]);
  }
}
