import 'package:facebook_app/config/constants.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndicator;
  final TabController controller;

  const CustomTabBar({
    Key? key,
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
    this.isBottomIndicator = false,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      controller: controller,
      indicator: BoxDecoration(
        border: isBottomIndicator
            ? Border(
                bottom: BorderSide(
                  color: Constants.facebookBlue,
                  width: 3.0,
                ),
              )
            : Border(
                top: BorderSide(
                  color: Constants.facebookBlue,
                  width: 3.0,
                ),
              ),
      ),
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
                i,
                Tab(
                  icon: Icon(
                    e,
                    color: i == selectedIndex
                        ? Constants.facebookBlue
                        : Colors.black45,
                    size: 30.0,
                  ),
                ),
              ))
          .values
          .toList(),
      onTap: onTap,
    );
  }
}
