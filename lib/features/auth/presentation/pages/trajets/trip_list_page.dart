import 'package:flutter/material.dart';
import 'trip_detail_page.dart';

class TripListPage extends StatelessWidget {
  const TripListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trajets disponibles"),
        backgroundColor: const Color(0xff2E7D32),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(
                Icons.directions_car,
                color: Color(0xff2E7D32),
              ),
              title: Text("Dakar → Thiès"),
              subtitle: const Text("08:30 • 3 places"),
              trailing: const Text("2500 FCFA"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TripDetailPage()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
