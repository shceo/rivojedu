import 'package:edu/src/ui/theme/theme_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../domain/blocs/nav_bloc/controller/main_controller.dart';
import '../../domain/blocs/nav_bloc/main_bloc.dart';
import '../../domain/blocs/nav_bloc/main_event.dart';
import '../theme/app_themes.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final vmController = MainController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return CupertinoTabScaffold(
          tabBuilder: (BuildContext context, int index) {
            return CupertinoTabView(
              builder: (BuildContext context) {
                return vmController.navItems[index].page;
              },
            );
          },
          tabBar: CupertinoTabBar(
            height: 60,
            inactiveColor: context.theme.grey,
            activeColor: context.theme.lightBlue,
            onTap: (index) {
              context.read<MainBloc>().add(
                NavItemChangedEvent(currentIndex: index),
              );

              FocusManager.instance.primaryFocus?.unfocus();
            },
            items: vmController.navItems
                .asMap()
                .entries
                .map((entries) => _buildItem(
                      context,
                      entries.value.icon,
                      state.currentIndex == entries.key,
                      entries.value.title,
                    ))
                .toList(),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem _buildItem(
      BuildContext context, String icon, bool isCurrent, String title) {
    final lightBlue = context.theme.lightBlue;
    final grey = context.theme.grey;

    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
          isCurrent ? lightBlue : grey,
          BlendMode.srcIn,
        ),
      ),
      label: title,
    );
  }
}
