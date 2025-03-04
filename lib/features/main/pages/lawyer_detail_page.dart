import 'package:flutter/material.dart';
import 'package:men_fuqoro_ai/features/main/models/lawyer_model.dart';

class LawyerDetailPage extends StatelessWidget {
  final Lawyer lawyer;

  const LawyerDetailPage({super.key, required this.lawyer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${lawyer.name} ${lawyer.surname}"),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(lawyer.imageAsset),
                radius: 60,
              ),
            ),
            SizedBox(height: 20),
            Text("Ism: ${lawyer.name} ${lawyer.surname}",
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Yoshi: ${lawyer.age}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Mutaxassisligi: ${lawyer.specialization}",
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Yutgan ishlar: ${lawyer.casesWon}",
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Yutqazgan ishlar: ${lawyer.casesLost}",
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Telefon: ${lawyer.phoneNumber}",
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Email: ${lawyer.email}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text("Qisqacha ma'lumot:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(lawyer.description, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
