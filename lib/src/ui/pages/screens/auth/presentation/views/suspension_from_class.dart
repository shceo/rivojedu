
import 'package:edu/assets/constants/common_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../theme/app_themes.dart';
import '../widgets/warning_item.dart';

class SuspensionFromScreen extends StatelessWidget {
  const SuspensionFromScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 70),
              Image.asset(
                CommonAssets.rivojLogo,
                height: 99,
                width: 255,
              ),
              const SizedBox(height: 37),
              const Text(
                "Akkauntga kirish",
                style: TextStyle(
                  fontSize: 30,
                  color: blackDark,
                ),
              ),
              const SizedBox(height: 99),
               WarningItem(
                imagePath: CommonAssets.cancelImage,
                text:
                    "Sizni darsdan chetlashririshdi!\n\nIltimos operatorga murojat qiling +998 90 111 11 11",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
