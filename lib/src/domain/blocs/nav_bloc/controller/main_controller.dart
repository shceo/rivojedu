import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/ui/pages/navbar_pages/darslar_page.dart';
import 'package:edu/src/ui/pages/navbar_pages/kurslar_page.dart';
import 'package:edu/src/ui/pages/navbar_pages/profil_page.dart';
import 'package:edu/src/ui/pages/navbar_pages/reyting_page.dart';
import 'package:edu/src/ui/pages/navbar_pages/xabarlar_page.dart';
import 'package:flutter/cupertino.dart';

import '../../../entity/nav_item_entity.dart';

class MainController {
  List<NavItemEntity> navItems = [
    NavItemEntity(
        page: const CoursesPage(),
        icon: CommonAssets.courses,
        title: 'Kurslar'),
    NavItemEntity(
        page: const LessonsPage(),
        icon: CommonAssets.lessons,
        title: 'Darslar'),
    NavItemEntity(
        page: const RatingPage(), icon: CommonAssets.rating, title: 'Reyting'),
    NavItemEntity(
        page: const MessagesPage(),
        icon: CommonAssets.messages,
        title: 'Xabarlar'),
    NavItemEntity(
        page: const ProfilePage(), icon: CommonAssets.user, title: 'Profil'),
  ];
}
