import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:flutter/material.dart';

class ReytingItem extends StatelessWidget {
  const ReytingItem({super.key, required this.a, required this.onTap, required this.onTap1});
  final int a;
  final VoidCallback onTap;
  final VoidCallback onTap1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding:
      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 4)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                  color: a == 0 ? blue : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 4),
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 4)
                  ],
                  border: Border.all(
                      width: a == 0 ? 0 : 1, color: grey)),
              padding: const EdgeInsets.symmetric(
                  horizontal: 8, vertical: 10),
              child: Text(
                "Mening yo’nalishim",
                style: TextStyle(
                    color: a == 0 ? Colors.white : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          GestureDetector(
            onTap: onTap1,
            child: Container(
              decoration: BoxDecoration(
                  color: a == 1 ? blue : white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 4),
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 4)
                  ],
                  border: Border.all(
                      width: a == 1 ? 0 : 1, color: grey)),
              padding: const EdgeInsets.symmetric(
                  horizontal: 8, vertical: 10),
              child: Text(
                "Barcha guruhlar",
                style: TextStyle(
                    color: a == 1 ? Colors.white : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
