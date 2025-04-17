import 'package:flutter/material.dart';
import 'package:men_fuqoro_ai/features/routes/route_names.dart';
import 'package:men_fuqoro_ai/features/utils/app_colors.dart';
import 'package:men_fuqoro_ai/features/utils/app_images.dart';

class SudPage extends StatelessWidget {
  const SudPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Online sud jarayoni'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Image.asset(AppImages.courtroom),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: Column(
                children: [
                  Text(
                    'Vaziyat',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                      "O‘zbekiston Respublikasining fuqarosi Dilnoza ismli ayol 3 yildan beri xususiy korxonada kotiba lavozimida ishlaydi. U homilador bo‘lganidan so‘ng, ish beruvchisi unga og‘zaki tarzda “ish samaradorligingiz kamaydi” degan bahona bilan boshqa xodimni yolladi va Dilnozani ishdan bo‘shatdi. Dilnoza bu qarorga norozi bo‘lib, sudga murojaat qilishga qaror qild"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Savol:",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                      "Dilnozaning ish joyidan bo‘shatilishi qonuniymi? Ushbu holatda mehnat qonunchiligiga asosan qanday choralar ko‘rish mumkin?"),
                  Text(
                    "Topshiriq",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                  ),
                  Text(
                      "O‘zbekiston Respublikasining Mehnat Kodeksi asosida javob yozing.")
                ],
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: SizedBox(
            height: 30,
            width: 30,
            child: Image.asset(
              AppImages.microphone,
            ),
          ),
        ));
  }
}
