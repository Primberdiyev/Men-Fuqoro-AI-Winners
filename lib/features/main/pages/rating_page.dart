import 'package:flutter/material.dart';
import 'package:men_fuqoro_ai/features/main/pages/user_detail_page.dart';
import 'package:men_fuqoro_ai/features/main/widgets/users.dart';

class RatingPage extends StatelessWidget {
  const RatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    users.sort((a, b) => b.score.compareTo(a.score));

    return Scaffold(
      appBar: AppBar(
        title: Text("Foydalanuvchilar Reytingi"),
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(user.imageAsset),
            ),
            title: Text("${user.name} ${user.surname}"),
            subtitle: Text("Ball: ${user.score}"),
            trailing: Text("#${index + 1}"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailPage(user: user),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
