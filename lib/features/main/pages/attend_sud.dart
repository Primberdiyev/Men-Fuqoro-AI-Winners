import 'package:flutter/material.dart';
import 'package:men_fuqoro_ai/features/routes/route_names.dart';
import 'package:men_fuqoro_ai/features/utils/app_colors.dart';
import 'package:men_fuqoro_ai/features/utils/app_images.dart';

class AttendSud extends StatelessWidget {
  const AttendSud({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iltimos, vaziyatingizni kiriting'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              height: 150,
              width: 150,
              clipBehavior: Clip.hardEdge,
              margin: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                AppImages.judge,
                fit: BoxFit.fill,
                alignment: Alignment.center,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.sud);
              },
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Sudya',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white),
                ),
              ),
            ),
            Container(
              height: 150,
              width: 150,
              clipBehavior: Clip.hardEdge,
              margin: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                AppImages.oqlovchi,
                fit: BoxFit.fill,
                alignment: Alignment.center,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.sud);
              },
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(20)),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.sud);
                  },
                  child: Text(
                    'Advokat',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white),
                  ),
                ),
              ),
            ),
            Container(
              height: 150,
              width: 150,
              clipBehavior: Clip.hardEdge,
              margin: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                AppImages.qoralovchi,
                fit: BoxFit.fill,
                alignment: Alignment.center,
              ),
            ),
            Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(20)),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.sud);
                },
                child: Text(
                  'Prokuror',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
