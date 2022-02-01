import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';

// ignore: library_prefixes
import 'package:latlong2/latlong.dart' as latLng;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapPage(),
    );
  }
}

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: latLng.LatLng(40.970646, 29.246403),
          zoom: 12,
        ),
        layers: <LayerOptions>[
          TileLayerOptions(
            urlTemplate: "<YOUR_INTEGRATION_URL>",
            attributionBuilder: (BuildContext context) {
              return Container(
                  margin: const EdgeInsets.only(right: 25, bottom: 10),
                  child: const Text("© MapBox"));
            },
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: latLng.LatLng(40.970646, 29.246403),
                builder: (ctx) => const FlutterLogo(),
              ),
              Marker(
                width: 50.0,
                height: 50.0,
                point: latLng.LatLng(41.0123, 29.286403),
                builder: (ctx) => Container(
                  color: Colors.red,
                ),
              ),
              Marker(
                width: 50.0,
                height: 50.0,
                point: latLng.LatLng(41.023, 29.226403),
                builder: (ctx) => Image.asset("assets/marker.png"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
