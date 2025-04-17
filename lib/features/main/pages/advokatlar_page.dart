import 'package:flutter/material.dart';
import 'package:men_fuqoro_ai/features/main/pages/lawyer_detail_page.dart';
import 'package:men_fuqoro_ai/features/main/widgets/lawyers.dart';

class LawyerListPage extends StatelessWidget {
  const LawyerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Advokatlar RO'yhati"),
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemCount: lawyers.length,
        itemBuilder: (context, index) {
          final lawyer = lawyers[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(lawyer.imageAsset),
            ),
            title: Text("${lawyer.name} ${lawyer.surname}"),
            subtitle: Text(lawyer.specialization),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LawyerDetailPage(lawyer: lawyer),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
