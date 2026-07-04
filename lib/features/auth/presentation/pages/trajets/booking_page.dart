import 'package:flutter/material.dart';
import 'booking_confirmation_page.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int seats = 1;
  String payment = "Wave";
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Réservation"),
        backgroundColor: const Color(0xff2E7D32),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("Choisir places"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => setState(() => seats--),
                  icon: const Icon(Icons.remove),
                ),
                Text("$seats"),
                IconButton(
                  onPressed: () => setState(() => seats++),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),

            TextField(
              controller: messageController,
              decoration: const InputDecoration(
                hintText: "Message au conducteur",
              ),
            ),

            const SizedBox(height: 20),

            DropdownButton<String>(
              value: payment,
              items: const [
                DropdownMenuItem(value: "Wave", child: Text("Wave")),
                DropdownMenuItem(value: "Orange", child: Text("Orange Money")),
                DropdownMenuItem(value: "Cash", child: Text("Espèces")),
              ],
              onChanged: (v) => setState(() => payment = v!),
            ),

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
                    MaterialPageRoute(
                      builder: (_) => const BookingConfirmationPage(),
                    ),
                  );
                },
                child: const Text("Confirmer"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
