import 'package:flutter/material.dart';
import 'package:men_fuqoro_ai/features/main/models/user_model.dart';

class UserDetailPage extends StatelessWidget {
  final UserModel user;

  const UserDetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${user.name} ${user.surname}"),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(user.imageAsset),
                radius: 60,
              ),
            ),
            SizedBox(height: 20),
            Text("Ism: ${user.name} ${user.surname}",
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Ball: ${user.score}", style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Ilovaga qo'shilgan sana: ${user.joinDate}",
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Yashash manzili: ${user.address}",
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text("Email: ${user.email}", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
