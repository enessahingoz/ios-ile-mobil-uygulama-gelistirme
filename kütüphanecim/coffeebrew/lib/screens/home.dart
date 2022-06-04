import 'package:coffeebrew/sqldb.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SqlDb sqlDb = SqlDb();
  GlobalKey<FormState> formstate = new GlobalKey();
  TextEditingController path = new TextEditingController();
  TextEditingController name = new TextEditingController();
  TextEditingController yazar = new TextEditingController();
  TextEditingController detail = new TextEditingController();
  TextEditingController aciklama = new TextEditingController();
  TextEditingController id = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              Form(
                key: formstate,
                child: Column(
                  children: [
                    TextFormField(
                      controller: path,
                      decoration: InputDecoration(hintText: "path"),
                    ),
                    TextFormField(
                      controller: name,
                      decoration: InputDecoration(hintText: "kitap adı"),
                    ),
                    TextFormField(
                      controller: yazar,
                      decoration: InputDecoration(hintText: "yazar adı"),
                    ),
                    TextFormField(
                      controller: detail,
                      decoration: InputDecoration(hintText: "detail"),
                    ),
                    TextFormField(
                      controller: aciklama,
                      decoration: InputDecoration(hintText: "açıklama"),
                    ),
                    Center(
                      child: MaterialButton(
                        color: Colors.red,
                        textColor: Colors.white,
                        onPressed: () async {
                          int response =
                              await sqlDb.insertData("""INSERT INTO 'notes' 
                   ('path','name','aciklama','details','writer') 
                   VALUES ('${path.text}','${name.text}','${aciklama.text}','${detail.text}','${yazar.text}')
                   """);
                          print(response);
                        },
                        child: Text("Kitap Ekle"),
                      ),
                    ),
                    TextFormField(
                      controller: id,
                      decoration:
                          InputDecoration(hintText: "silinecek kitap id'si"),
                    ),
                    Center(
                      child: MaterialButton(
                        color: Colors.red,
                        textColor: Colors.white,
                        onPressed: () async {
                          int response = await sqlDb.deleteData(
                              "DELETE  FROM 'kitaplar' WHERE id='${id.text}' ");
                          print("$response");
                        },
                        child: Text("Kitap Sil"),
                      ),
                    ),
                    Center(
                      child: MaterialButton(
                        color: Colors.red,
                        textColor: Colors.white,
                        onPressed: () async {
                          List<Map> response =
                              await sqlDb.readData("SELECT * FROM 'notes' ");
                          print("$response");
                        },
                        child: Text("Database i incele"),
                      ),
                    ),
                    Center(
                      child: MaterialButton(
                        color: Colors.red,
                        textColor: Colors.white,
                        onPressed: () async {
                          await sqlDb.mydeleteDatabase();
                        },
                        child: Text("Database i sil"),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
 /*body: Container(
        child: Column(children: [
          Center(
            child: MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () async {
                int response = await sqlDb.insertData("""INSERT INTO 'notes' 
                   ('path','name','aciklama','details','writer') 
                   VALUES ('assets/books/kapaklar/2.png','İnsan ne ile yasar','Victor Hugo','detaylar','yazar')
                   """);
                print(response);
              },
              child: Text("Insert data"),
            ),
          ),
          Center(
            child: MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () async {
                List<Map> response =
                    await sqlDb.readData("SELECT * FROM 'notes' ");
                print("$response");
              },
              child: Text("read data"),
            ),
          ),
          Center(
            child: MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () async {
                await sqlDb.mydeleteDatabase();
              },
              child: Text("delete database"),
            ),
          ),
          Center(
            child: MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () async {
                int response =
                    await sqlDb.deleteData("DELETE  FROM 'notes' WHERE id=3 ");
                print("$response");
              },
              child: Text("Delete data"),
            ),
          ),
        ]),
      ),*/
