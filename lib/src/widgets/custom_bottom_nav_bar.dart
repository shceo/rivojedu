// ignore_for_file: unused_element

import 'package:edu/src/ui/theme/theme_extensions.dart';
import 'package:edu/src/utils/constants/common_dimensions.dart';
import 'package:edu/src/widgets/custom_vector_button.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final List<CustomNavigationItem> items;
  final ValueChanged<int>? onIndexChanged;
  const CustomNavigationBar({
    required this.selectedIndex,
    required this.items,
    this.onIndexChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(CommonDimensions.large),
      decoration: BoxDecoration(
        color: context.theme.whiteColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            CommonDimensions.large,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (int index = 0; index < items.length; index++)
            _CustomNavigationItem(
              itemIndex: index,
              selectedIndex: selectedIndex,
              iconPath: items[index].iconPath,
              onIndexChanged: onIndexChanged,
            ),
        ],
      ),
    );
  }
}

class _CustomNavigationItem extends StatelessWidget {
  final int itemIndex;
  final int selectedIndex;
  final String iconPath;
  final ValueChanged<int>? onIndexChanged;
  const _CustomNavigationItem({
    required this.itemIndex,
    required this.selectedIndex,
    required this.iconPath,
    this.onIndexChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomVectorButton(
      backgroundColor: context.theme.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(
            CommonDimensions.large,
          ),
        ),
        side: BorderSide(
          color: context.theme.whiteColor,
        ),
      ),
      assetPath: iconPath,
      assetColor: itemIndex == selectedIndex
          ? context.theme.whiteColor
          : context.theme.whiteColor,
      onPressed: () => onIndexChanged?.call(itemIndex),
    );
  }
}

final class CustomNavigationItem {
  final String iconPath;

  const CustomNavigationItem({required this.iconPath});
}
