import 'package:coffeebrew/constants/color_palette.dart';
import 'package:coffeebrew/screens/details.dart';
import 'package:coffeebrew/sqldb.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class BlackGold extends StatefulWidget {
  @override
  _BlackGoldState createState() => _BlackGoldState();
}

class _BlackGoldState extends State<BlackGold> {
  SqlDb sqlDb = SqlDb();

  Future<List<Map>> readData() async {
    List<Map> response = await sqlDb.readData("SELECT * FROM 'notes'");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      FutureBuilder(
          future: readData(),
          builder: (BuildContext context, AsyncSnapshot<List<Map>> snapshot) {
            if (snapshot.hasData) {
              int i = 0;
              int k = 0;
              String path, name, aciklama, details, yazar;

              path = snapshot.data[i]['path'];
              name = snapshot.data[i]['name'];
              details = snapshot.data[i]['aciklama'];
              aciklama = snapshot.data[i]['details'];
              yazar = snapshot.data[i]['writer'];

              return buildListItem(path, name, aciklama, details, yazar,
                  ColorPalette().firstSlice);
            }
            return Center(child: CircularProgressIndicator());
          })
    ]);
  }

  buildListItem(String imgPath, String price, String aciklama, String details,
      String writer, Color bgColor) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CoffeeDetails(
                  imgPath: imgPath,
                  headerColor: bgColor,
                  name: price,
                  detail: aciklama,
                  details: details,
                  writer: writer)));
        },
        child: Stack(
          children: [
            Container(
                height: 300.0,
                width: 250.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.transparent)),
            Positioned(
                top: 100.0,
                child: Container(
                    height: 200.0,
                    width: 250.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        image: DecorationImage(
                            image: AssetImage('assets/doodle.png'),
                            fit: BoxFit.none)))),
            Positioned(
                top: 100.0,
                child: Container(
                    height: 200.0,
                    width: 250.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white.withOpacity(0.6),
                    ))),
            Positioned(
                top: 100.0,
                child: Container(
                    height: 200.0,
                    width: 250.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: bgColor.withOpacity(0.9),
                    ))),
            Positioned(
                right: 2.0,
                child: Hero(
                    tag: imgPath,
                    child: Container(
                        height: 250.0,
                        width: 150.0,
                        child: Image(
                            image: AssetImage(imgPath),
                            fit: BoxFit.scaleDown)))),
            Positioned(
                top: 125.0,
                left: 15.0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        writer,
                        style: GoogleFonts.bigShouldersText(
                            color: Color(0xFF23163D), fontSize: 20.0),
                      ),
                      Text(
                        ' ',
                        style: GoogleFonts.bigShouldersText(
                            color: Colors.white, fontSize: 40.0),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        price,
                        style: GoogleFonts.bigShouldersText(
                            color: Color(0xFF23163D), fontSize: 27.0),
                      ),
                      SizedBox(height: 2.0),
                      Container(
                          width: 200.0,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        aciklama,
                                        style: GoogleFonts.bigShouldersText(
                                            color: Colors.white,
                                            fontSize: 15.0),
                                      ),
                                    ]),
                              ]))
                    ]))
          ],
        ));
  }
}
