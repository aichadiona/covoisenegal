import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'trip_list_page.dart';

class SearchTripPage extends StatefulWidget {
  const SearchTripPage({super.key});

  @override
  State<SearchTripPage> createState() => _SearchTripPageState();
}

class _SearchTripPageState extends State<SearchTripPage> {
  final fromController = TextEditingController();
  final toController = TextEditingController();

  int passengers = 1;

  GoogleMapController? mapController;

  // 📍 Position par défaut (Dakar)
  static const LatLng _initialPosition = LatLng(14.6928, -17.4467);

  // 🧭 Markers
  final Set<Marker> _markers = {};

  // 🔴 Simuler géolocalisation des villes (à remplacer API plus tard)
  final Map<String, LatLng> cityCoordinates = {
    "dakar": const LatLng(14.6928, -17.4467),
    "thiès": const LatLng(14.7886, -16.9260),
    "mbour": const LatLng(14.4220, -16.9640),
    "saint louis": const LatLng(16.0326, -16.4818),
  };

  void _setMarkers() {
    String from = fromController.text.toLowerCase();
    String to = toController.text.toLowerCase();

    setState(() {
      _markers.clear();

      if (cityCoordinates.containsKey(from)) {
        _markers.add(
          Marker(
            markerId: const MarkerId("from"),
            position: cityCoordinates[from]!,
            infoWindow: const InfoWindow(title: "Départ"),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueGreen,
            ),
          ),
        );
      }

      if (cityCoordinates.containsKey(to)) {
        _markers.add(
          Marker(
            markerId: const MarkerId("to"),
            position: cityCoordinates[to]!,
            infoWindow: const InfoWindow(title: "Arrivée"),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueRed,
            ),
          ),
        );
      }
    });

    // zoom automatique si 2 points
    if (cityCoordinates.containsKey(from) && cityCoordinates.containsKey(to)) {
      mapController?.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            southwest: LatLng(
              cityCoordinates[from]!.latitude < cityCoordinates[to]!.latitude
                  ? cityCoordinates[from]!.latitude
                  : cityCoordinates[to]!.latitude,
              cityCoordinates[from]!.longitude < cityCoordinates[to]!.longitude
                  ? cityCoordinates[from]!.longitude
                  : cityCoordinates[to]!.longitude,
            ),
            northeast: LatLng(
              cityCoordinates[from]!.latitude > cityCoordinates[to]!.latitude
                  ? cityCoordinates[from]!.latitude
                  : cityCoordinates[to]!.latitude,
              cityCoordinates[from]!.longitude > cityCoordinates[to]!.longitude
                  ? cityCoordinates[from]!.longitude
                  : cityCoordinates[to]!.longitude,
            ),
          ),
          100,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F7F5),

      appBar: AppBar(
        title: const Text("Recherche de trajet"),
        backgroundColor: const Color(0xff2E7D32),
      ),

      body: Column(
        children: [
          /// 🗺️ MAP
          SizedBox(
            height: 250,
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: _initialPosition,
                zoom: 7,
              ),
              markers: _markers,
              onMapCreated: (controller) {
                mapController = controller;
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                /// 🚗 DEPART
                TextField(
                  controller: fromController,
                  decoration: InputDecoration(
                    hintText: "Ville de départ",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (_) => _setMarkers(),
                ),

                const SizedBox(height: 10),

                /// 📍 ARRIVEE
                TextField(
                  controller: toController,
                  decoration: InputDecoration(
                    hintText: "Ville d'arrivée",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (_) => _setMarkers(),
                ),

                const SizedBox(height: 10),

                /// 👥 PASSAGERS
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Passagers"),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (passengers > 1) {
                                setState(() => passengers--);
                              }
                            },
                            icon: const Icon(Icons.remove),
                          ),
                          Text("$passengers"),
                          IconButton(
                            onPressed: () {
                              setState(() => passengers++);
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// 🔍 RECHERCHE
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff2E7D32),
                      padding: const EdgeInsets.all(16),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const TripListPage()),
                      );
                    },
                    child: const Text("Rechercher"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
