import 'package:coffeebrew/constants/color_palette.dart';
import 'package:coffeebrew/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Egitim extends StatefulWidget {
  @override
  _EgitimState createState() => _EgitimState();
}

class _EgitimState extends State<Egitim> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      buildListItem(
          'assets/books/kapaklar/5.png',
          'Python Programlama',
          'Başlangıç Seviyesinde Programlama',
          "Python, ilk sürümünden (1990 yılının başı) bu yana dikkatleri üzerine çeken genel amaçlı, yorumlamalı, nesne tabanlı, temiz kod yazılabilen, hızlı öğrenilebilip uygulama geliştirilebilen ve birçok aracı (kütüphaneyi) içeren bir programlama dilidir. Bu kitap, yeni başlayanlar için bir rehber, Python’u bilenler için bir başvuru kaynağı niteliğindedir. Bu kitap, Python konusunda uzun yıllar yayın üreten, kitaplar yazan ve akademik hayatına bu yönde devam eden Doç. Dr. Mustafa Başer’in 15 yıldan fazla deneyim ve tecrübesine dayanmaktadır.                                                                  Programlama ve Python                                                                 Python Nasıl Çalışır?                                                                  Değişkenler, İfadeler, Deyimler                                                                 İşlevler                                                                                     Argümanlar ve Parametreler                                                                               İsim Alanları (NameSpace)                                                                                       Mantıksal İşleçler                                                                                    İç İçe Döngüler                                                                                                    Listeler ve İterasyon ",
          "Enes Şahingöz",
          ColorPalette().secondSlice),
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
