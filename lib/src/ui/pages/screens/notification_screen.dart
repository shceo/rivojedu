import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/widgets/notification_item.dart';
import 'package:edu/src/ui/pages/screens/auth/presentation/widgets/w_back_button.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(CommonAssets.background,
            width: double.infinity, fit: BoxFit.cover),
        Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WBackButton(),
                  Text(
                    "Eslatmalar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              ...List.generate(10, (index) {
                return const NotificationItem();
              })
            ],
          ),
        )
      ],
    ));
  }
}
