import 'package:flutter/material.dart';
import 'secondPage.dart';

void main(){ runApp(MaterialApp(
  title: 'Guia do Santuário',
  home: firstPage(),
));
}

class firstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pontos turísticos'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _cards(
                  "https://ia801409.us.archive.org/24/items/basilica_de_caninde/Bas%C3%ADlica_de_S.Francisco-73.jpg",
                  "Basílica de São Francisco\ndas Chagas"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _cards(
                  "https://ia601503.us.archive.org/6/items/estatua_caninde/21993136.jpg",
                  "Estátua de São Francisco\ndas Chagas"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _cards(
                  "https://ia601507.us.archive.org/35/items/das_dores/dores.jpg",
                  "Igreja de Nossa Senhora\ndas Dores"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _cards(
                  "https://ia801408.us.archive.org/21/items/mosteiro_201907/mosteiro.jpg",
                  "Mosteiro das Irmãs Clarissas"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _cards(
                  "https://ia601408.us.archive.org/8/items/zoo_caninde/7600171_x720.jpg",
                  "Zoológico São Francisco"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _cards(
                  "https://ia601503.us.archive.org/17/items/convento_caninde/pb-convento1.jpg",
                  "Convento Santo Antônio"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _cards(
                  "https://ia801404.us.archive.org/13/items/saojose/s%C3%A3o%20jo%C2%B4se.jpg",
                  "Paróquia de São José"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _cards(
                  "https://ia601504.us.archive.org/5/items/saopedro/s%C3%A3o%20pedro.JPG",
                  "Paróquia de São Pedro"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _cards(
                  "https://ia801406.us.archive.org/0/items/hospitalsaofranciscocaninde2/Hospital_S%C3%A3o_Francisco_Canind%C3%A9-2.jpg",
                  "Hospital São Francisco"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _cards(
                  "https://ia801508.us.archive.org/10/items/pracadoromeiro/pra%C3%A7a%20do%20romeiro.jpg",
                  "Praça dos Romeiros"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _cards(
                  "https://ia801402.us.archive.org/2/items/cetenariodaigrejadomontecristorei/Ceten%C3%A1rio-da-Igreja-do-Monte-Cristo-Rei.jpg",
                  "Igreja do Cristo Rei"),
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => mapaPage()),
          );
        },
        child: Icon(Icons.map),
      ),
    );
  }
}

Widget _cards(String _image, String titulo) {
  return GestureDetector(
    child: Container(
      child: new FittedBox(
        child: Material(
          color: Colors.blueAccent,
          elevation: 14.0,
          borderRadius: BorderRadius.circular(24.0),
          shadowColor: Color(0x802196F3),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 180,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(24.0),
                    child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(_image),
                    ),
                  ),
                ),
                Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: detailsCards(titulo),
                    )),
              ]
          ),
        ),
      ),
    ),
  );
}

Widget detailsCards(String titulo) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
            child: Column(
              children: <Widget>[
                Text(
                  titulo,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                RaisedButton(
                  onPressed: () {

                  },
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  splashColor: Colors.white,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF32CD32),
                          Color(0xFF1976D2),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: const Text(
                        'Informações',
                        style: TextStyle(fontSize: 20)
                    ),
                  ),
                ),
              ],)
        ),
      ),
    ],
  );
}