import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/domain/blocs/user_bloc/user_bloc.dart';
import 'package:edu/src/ui/theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModulsItem extends StatelessWidget {
  const ModulsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Dars 1",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  const Text(
                    "Modul 1",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                      width: 135,
                      height: 9,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Container(
                            width: 83,
                            height: 9,
                            decoration: BoxDecoration(
                                color: blue,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ],
                      ))
                ],
              )),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                return Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(CommonAssets.coin,
                            width: 30, fit: BoxFit.cover),
                        Text(
                          state.userModel.coin.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Tangalar",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        Image.asset(CommonAssets.star,
                            width: 30, fit: BoxFit.cover),
                        Text(
                          state.userModel.totalScore.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Ballar",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
