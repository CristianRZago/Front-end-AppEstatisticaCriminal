import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import 'Zona.dart';

class Telaprincipal extends StatefulWidget {
  const Telaprincipal({super.key});

  @override
  State<Telaprincipal> createState() => _TelaprincipalState();
}

class _TelaprincipalState extends State<Telaprincipal> {

  Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  Set<Circle> _circulos = {};

  Future<List<Zona>> RecuperarZonas() async{
    List<Zona> zonas = [];

    try {
      String url = "https://192.168.0.108:33644/Zona";
      http.Response response = await http.get(Uri.parse(url));


      var dadosJson = json.decode(response.body);

      for(var zona in dadosJson){
        Zona p = Zona(zona["id"],zona["latitudeCentral"],zona["longitudeCentral"],zona["raio"],zona["area"]);

        zonas.add(p);
      }
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro: $e')),
      );
    }
    return zonas;
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Mapas"),
      ),
      body: Container(
        child: FutureBuilder<List<Zona>>(
          future: RecuperarZonas(),
          builder: (context, snapshot){

            switch( snapshot.connectionState ){
              case ConnectionState.none :
              case ConnectionState.waiting :
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.active :
              case ConnectionState.done :
                if( snapshot.hasError ){
                  print("lista: Erro ao carregar ");
                }else {
                    for(var zona in snapshot.data!){
                      Circle circulo = Circle(
                        circleId: CircleId("id"),
                        center: LatLng(zona.LatitudeCentral, zona.LongitudeCentral),
                        radius: zona.Raio,
                        fillColor: Colors.red.withOpacity(0.2),
                        strokeWidth: 2,

                      );

                      _circulos.add(circulo);
                    }
                  return Container(
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                          target: LatLng(-23.2652163761331, -45.900088944777956),
                          zoom: 15
                      ),
                      onMapCreated: (GoogleMapController controller){
                        _controller.complete(controller);
                        },
                      circles: _circulos,
                      mapType: MapType.normal,
                    ),
                  );

                }
                break;
            }
          return Container();
          },
        ),
      ),
    );
  }
}
