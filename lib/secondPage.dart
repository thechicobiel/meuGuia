import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//É A SEGUNDA TELA, A QUE CONTEM O MAPA EM SI

class mapaPage extends StatefulWidget {
  @override
  _mapaPageState createState() => _mapaPageState();
}

class _mapaPageState extends State<mapaPage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(

      //A BARRA EM CIMA QUE CONTÉM O TÍTULO, O BOTÃO DE VOLTAR E O BOTÃO DE REFRESH
      appBar: AppBar(
        title: Text("Guia do Santuário de Canindé (CE)"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _refresh(-4.358, -39.3137);
              }),
        ],
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _buildContainer(),
        ],
      ),
    );
  }

  //ESSA FUNÇÃO É EXCLUSIVA DO BOTÃO REFRESH, QUE DEIXA O MAPA NO ESTADO INICIAL
  Future<void> _refresh(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,)));
  }

  //É A MONTAGEM DOS BOTÕES NO CANTO INFERIOR, DESENVOLVE O TAMANHO E DISPOSIÇÃO
  //CHAMA A FUNÇÃO '_boxes' QUE QUANDO CLICADO, LEVA A VISÃO DO MAPA PARA O LOCAL SELECIONADO DE ACORDO COM AS SUAS COORDENADAS
  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 70.0),
        height: 120.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://ia801409.us.archive.org/24/items/basilica_de_caninde/Bas%C3%ADlica_de_S.Francisco-73.jpg",
                  -4.359281,
                  -39.311843,
                  "Basílica de São Francisco\ndas Chagas"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://ia601503.us.archive.org/6/items/estatua_caninde/21993136.jpg",
                  -4.367470,
                  -39.305115,
                  "Estátua de São Francisco\ndas Chagas"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://ia601507.us.archive.org/35/items/das_dores/dores.jpg",
                  -4.359086,
                  -39.314841,
                  "Igreja de Nossa Senhora\ndas Dores"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://ia801408.us.archive.org/21/items/mosteiro_201907/mosteiro.jpg",
                  -4.352859,
                  -39.313711,
                  "Mosteiro das Irmãs Clarissas"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://ia601408.us.archive.org/8/items/zoo_caninde/7600171_x720.jpg",
                  -4.362529,
                  -39.315197,
                  "Zoológico São Francisco"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://ia601503.us.archive.org/17/items/convento_caninde/pb-convento1.jpg",
                  -4.361924,
                  -39.314156,
                  "Convento Santo Antônio"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://ia801404.us.archive.org/13/items/saojose/s%C3%A3o%20jo%C2%B4se.jpg",
                  -4.344808,
                  -39.310465,
                  "Paróquia de São José"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://ia601504.us.archive.org/5/items/saopedro/s%C3%A3o%20pedro.JPG",
                  -4.363948,
                  -39.306162,
                  "Paróquia de São Pedro"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://ia801406.us.archive.org/0/items/hospitalsaofranciscocaninde2/Hospital_S%C3%A3o_Francisco_Canind%C3%A9-2.jpg",
                  -4.361966,
                  -39.313717,
                  "Hospital São Francisco"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://ia801508.us.archive.org/10/items/pracadoromeiro/pra%C3%A7a%20do%20romeiro.jpg",
                  -4.363025,
                  -39.317075,
                  "Praça dos Romeiros"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://ia801402.us.archive.org/2/items/cetenariodaigrejadomontecristorei/Ceten%C3%A1rio-da-Igreja-do-Monte-Cristo-Rei.jpg",
                  -4.362618,
                  -39.320637,
                  "Igreja do Cristo Rei"),
            ),
          ],
        ),
      ),
    );
  }

  //É A FUNÇÃO CHAMADA QUANDO O USUÁRIO CLICAR NOS BOTÕES DOS PONTOS TURÍSTICOS
  //DESENVOLVE CORES E DISPÕES ELES EM LINHA
  Widget _boxes(String _image, double lat, double long, String titulo) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(lat, long);//QUANDO CLICADO, CHAMA ESSA FUNÇÃO MANDANDO OS PARAMETROS LAT E LONG
      },
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
                      child: myDetailsContainer1(titulo),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  //O OBJETIVO DESSA FUNÇÃO É MOSTRAR O TÍTULO DO PONTO DENTRO DOS CARDS NO CANTO INFERIOR
  Widget myDetailsContainer1(String titulo) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
                titulo,
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              )),
        ),
        SizedBox(height: 5.0),
      ],
    );
  }

  //ESSA SERIA COMO A FUNÇÃO MAIN DESTE ARQUIVO.
  //ELA CONTRÓI O MAPA NA POSIÇÃO INICIAL E CHAMA AS FUNÇÕES INICIAIS DEIXANDO-AS PRONTAS PARA USO
  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
        CameraPosition(target: LatLng(-4.358, -39.3137), zoom: 15),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          mosteiroMarker,
          zoologicoMarker,
          conventoMarker,
          basilicaMarker,
          estatuaMarker,
          doresMarker,
          paroquiajoseMarker,
          paroquiapedroMarker,
          hospitalMarker,
          pracaMarker,
          cristoreiMarker
        },
      ),
    );
  }

  //É A FUNÇÃO CHAMADA NO '_boxes' QUE LEVA A CÂMERA PARA O PONTO ESCOLHIDO
  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 20,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }
}

//OS MARKERS ABAIXO SÃO OS LOCAIS CHAMADOS NA CONSTRUÇÃO DO MAPA QUE POSICIONA AS "SETINHAS" VERDES NO MAPA MOSTRANDO ONDE QUE FICA CADA LOCAL DE UM MODO GERAL.
Marker basilicaMarker = Marker(
  markerId: MarkerId('basilica'),
  position: LatLng(-4.359281, -39.311843),
  infoWindow: InfoWindow(title: 'Basílica de São Francisco das Chagas'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);
Marker estatuaMarker = Marker(
  markerId: MarkerId('estatua'),
  position: LatLng(-4.367470, -39.305115),
  infoWindow: InfoWindow(title: 'Estátua de São Francisco das Chagas'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);
Marker doresMarker = Marker(
  markerId: MarkerId('dores'),
  position: LatLng(-4.359086, -39.314841),
  infoWindow: InfoWindow(title: 'Igreja de Nossa Senhora das Dores'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);
Marker mosteiroMarker = Marker(
  markerId: MarkerId('mosteiro'),
  position: LatLng(-4.352859, -39.313711),
  infoWindow: InfoWindow(title: 'Mosteiro das Irmãs Clarissas'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);
Marker zoologicoMarker = Marker(
  markerId: MarkerId('zoologico'),
  position: LatLng(-4.362529, -39.315197),
  infoWindow: InfoWindow(title: 'Zoológico São Francisco'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);
Marker conventoMarker = Marker(
  markerId: MarkerId('convento'),
  position: LatLng(-4.361924, -39.314156),
  infoWindow: InfoWindow(title: 'Convento Santo Antônio'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);
Marker paroquiajoseMarker = Marker(
  markerId: MarkerId('paroquiajose'),
  position: LatLng(-4.344808,-39.310465),
  infoWindow: InfoWindow(title: 'Paróquia de São José'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);
Marker paroquiapedroMarker = Marker(
  markerId: MarkerId('paroquiapedro'),
  position: LatLng(-4.363948,-39.306162),
  infoWindow: InfoWindow(title: 'Paróquia de São Pedro'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);
Marker hospitalMarker = Marker(
  markerId: MarkerId('hospital'),
  position: LatLng(-4.361966,-39.313717),
  infoWindow: InfoWindow(title: 'Hospital São Francisco'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);
Marker pracaMarker = Marker(
  markerId: MarkerId('praca'),
  position: LatLng(-4.363025,-39.317075),
  infoWindow: InfoWindow(title: 'Praça dos Romeiros'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);
Marker cristoreiMarker = Marker(
  markerId: MarkerId('cristorei'),
  position: LatLng(-4.362618,-39.320637),
  infoWindow: InfoWindow(title: 'Igreja do Cristo Rei'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueGreen,
  ),
);
