import 'package:coffeebrew/constants/color_palette.dart';
import 'package:coffeebrew/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ColdBrew extends StatefulWidget {
  @override
  _ColdBrewState createState() => _ColdBrewState();
}

class _ColdBrewState extends State<ColdBrew> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      buildListItem(
          'assets/books/kapaklar/1.png',
          'İnsan Ne İle Yaşar',
          'Dünya Klasikleri',
          " Tolstoy, İtiraflarım'dan Tolstoy, İnsan Ne İle Yaşar'daki tüm öykülerinde insanın özünde iyilik olduğunu vurgular. Şeytan ve meleği temsil eden karakterleri öykülerinde kullanarak, insanın er ya da geç iyiliğin peşinden gidebileceğini anlatmak ister. Tolstoy 1885'te yayımlanan bu esere adını veren 'İnsan Ne İle Yaşar' adlı öyküde, insanların özünde iyilik olduğunu ve durum her ne olursa olsun iyilik yapması gerektiğini anlatır. 'Peki insanların içinde hiç mi kötülük yoktur?' diye bir soru akla geldiğinde ise yazarın başka bir öyküsüne göz atmak yeterli olacaktır. 'İnsana Ne Kadar Toprak Lazım' hikâyesinde de bu sorunun cevabını buluruz.",
          "Tolstoy",
          ColorPalette().secondSlice),
      buildListItem(
          'assets/books/kapaklar/2.png',
          'Kürk Mantolu Madonna',
          'Dünya Klasikleri',
          "Koltuğundan kalkmadan elini uzattı. Sokuldum ve teşekkür ettim. Yüzünde, bana iyilik ettiği için, samimi bir memnuniyet vardı. Onun aslında hiç de fena bir insan olmadığını, yalnız mevkiinin icaplarını yaptığını ve bunun da belki hakikaten lüzumlu olabileceğini düşündüm. Fakat dışarı çıkınca koridorda bir müddet durakladım ve bana tarif ettiği odaya gitmekle burayı bırakıp çıkmak arasında bir hayli tereddüt ettim. Sonra ağır ağır, başım önümde, birkaç adım yürüyerek ilk rast geldiğim hademeye mütercim Raif Efendi’nin odasını sordum. Adam eliyle gayrimuayyen bir kapıyı gösterdi ve geçti. Tekrar durdum. Niçin bırakıp gidemiyordum? Kırk lira aylığı mı feda edemiyordum? Yoksa Hamdi’ye karşı ayıp bir harekette bulunmuş olmaktan mı çekiniyordum? Hayır! Aylardan beri süren işsizlik, buradan çıkınca nereye gideceğimi, nerede iş arayacağımı bilmemek... Ve artık tamamıyla pençesine düşmüş olduğum bir cesaretsizlik... İşte beni o loş koridorda tutan ve oradan geçecek olan diğer hademeyi beklemeye sevk eden bunlardı. ",
          "Sabahattin Ali",
          ColorPalette().firstSlice)
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
