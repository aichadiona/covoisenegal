import 'package:flutter/material.dart';
import 'booking_page.dart';

class TripDetailPage extends StatelessWidget {
  const TripDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Détails du trajet"),
        backgroundColor: const Color(0xff2E7D32),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Dakar → Thiès",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),
            const Text("Conducteur: Modou"),
            const Text("Heure: 08:30"),
            const Text("Prix: 2500 FCFA"),
            const Text("Places restantes: 3"),

            const Spacer(),

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
                    MaterialPageRoute(builder: (_) => const BookingPage()),
                  );
                },
                child: const Text("Réserver"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
