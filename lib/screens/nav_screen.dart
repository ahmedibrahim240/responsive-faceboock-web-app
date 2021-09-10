import 'package:facebook_app/data/data.dart';
import 'package:facebook_app/screens/screens.dart';
import 'package:facebook_app/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> with TickerProviderStateMixin {
  final List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    Mdi.accountCircleOutline,
    Mdi.accountGroupOutline,
    Mdi.bellOutline,
    Icons.menu,
  ];
  int _selectedIndex = 0;
  TabController? controller;

  void initState() {
    super.initState();

    controller = TabController(length: _icons.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: Responsive.isDesktop(context)
          ? PreferredSize(
              preferredSize: Size(
                screenSize.width,
                screenSize.height,
              ),
              child: CustomAppBar(
                currentUser: currentUser,
                icons: _icons,
                selectedIndex: _selectedIndex,
                controller: controller!,
                onTap: (index) => setState(() {
                  _selectedIndex = index;
                }),
              ),
            )
          : null,
      body: IndexedStack(
        children: _screens,
        index: _selectedIndex,
      ),
      bottomNavigationBar: (!Responsive.isDesktop(context))
          ? Container(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: CustomTabBar(
                icons: _icons,
                controller: controller!,
                selectedIndex: _selectedIndex,
                onTap: (index) => setState(() {
                  _selectedIndex = index;
                }),
              ),
            )
          : null,
    );
  }
}
