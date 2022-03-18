import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Tugas(),
    routes: <String, WidgetBuilder>{
      '/Tugas': (BuildContext context) => Tugas(),
      '/LuasPersegiPanjang': (BuildContext context) => LuasPersegiPanjang(),
    },
  ));
}

class Tugas extends StatelessWidget {
  const Tugas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.toc_outlined),
        centerTitle: true,
        backgroundColor: Colors.grey[300],
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
          child: Column(
        children: [
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/LuasPersegiPanjang');
              },
              title: Text(
                'HITUNG LUAS PERSEGI PANJANG',
                style: TextStyle(
                    color: Color.fromARGB(255, 163, 3, 3),
                    fontFamily: 'BattlesbridgeDemoRegular',
                    fontSize: 13.0),
              ),
              subtitle: Text('Klik Untuk Menghitung Luas Persegi Panjang'),
            ),
          ),
        ],
      )),
    );
  }
}

class LuasPersegiPanjang extends StatefulWidget {
  const LuasPersegiPanjang({Key? key}) : super(key: key);

  @override
  _LuasPersegiPanjangState createState() => _LuasPersegiPanjangState();
}

class _LuasPersegiPanjangState extends State<LuasPersegiPanjang> {
  final txtpjng = TextEditingController();
  final txtlbr = TextEditingController();

  String result = '';

  getTextInputData() {
    setState(() {
      var panjang = int.parse(txtpjng.text);
      var lebar = int.parse(txtlbr.text);
      var luas = panjang * lebar;
      result = luas.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 25, 64, 192),
          title: Text("Luas Persegi Panjang"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: 200,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: txtpjng,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Panjang'),
                  )),
              Container(
                  width: 200,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: txtlbr,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Lebar'),
                  )),
              RaisedButton(
                onPressed: getTextInputData,
                color: Color.fromARGB(255, 62, 218, 62),
                textColor: Colors.black,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Text('Hitung'),
              ),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(" Luas Persegi Panjang = $result",
                      style: TextStyle(fontSize: 20)))
            ],
          ),
        ));
  }
}
