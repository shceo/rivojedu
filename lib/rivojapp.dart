
import 'package:edu/src/ui/theme/app_colors.dart';
import 'package:edu/src/ui/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class App extends StatelessWidget {


  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.whiteColor,
      ),
      child: IconButton(
       icon: Icon(Icons.abc_outlined),
        onPressed: () {},
      ),
    );
  }

 
    }
  

