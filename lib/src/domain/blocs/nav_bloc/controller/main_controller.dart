
import 'package:edu/assets/constants/common_assets.dart';
import 'package:edu/src/ui/pages/navbar_pages/kurslar_page.dart';
import 'package:flutter/cupertino.dart';

import '../../../entity/nav_item_entity.dart';

class MainController {
  List<NavItemEntity> navItems = [
    NavItemEntity(
        page: const CoursesPage(), icon: CommonAssets.courses, title: 'Kurslar'),
    NavItemEntity(
        page: Container(), icon: CommonAssets.lessons, title: 'Darslar'),
    NavItemEntity(
        page: Container(), icon: CommonAssets.rating, title: 'Reyting'),
    NavItemEntity(
        page: Container(), icon: CommonAssets.messages, title: 'Xabarlar'),
    NavItemEntity(page: Container(), icon: CommonAssets.user, title: 'Profil'),
  ];
}
