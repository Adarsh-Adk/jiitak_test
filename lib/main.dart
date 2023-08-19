import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import 'core/values/app_assets.dart';
import 'views/screens/home_screen/home_screen.dart';
import 'views/screens/profile_screen/profile_screen.dart';
import 'views/screens/stamp_details_screen/stamp_details_screen.dart';
import 'views/theme/app_theme.dart';

void main() {
  initializeDateFormatting('ja_JP', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jiitak Test',
      theme: AppTheme.light(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PersistentTabController _controller;
  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: const [
        HomeScreen(),
        StampDetailsScreen(),
        HomeScreen(),
        HomeScreen(),
        ProfileScreen(),
      ],
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style15,
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: ("さがす"),
        activeColorPrimary: Theme.of(context).colorScheme.primaryContainer,
        inactiveColorPrimary: Theme.of(context).colorScheme.primaryContainer,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(AppAssets.workIcon),
        title: ("お仕事"),
        activeColorPrimary: Theme.of(context).colorScheme.primaryContainer,
        inactiveColorPrimary: Theme.of(context).colorScheme.primaryContainer,
      ),
      PersistentBottomNavBarItem(
        icon: Container(
          decoration:
              BoxDecoration(color: Theme.of(context).colorScheme.primary),
          child: SvgPicture.asset(
            AppAssets.scannerIcon,
          ),
        ),
        title: ("打刻する"),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: Theme.of(context).colorScheme.primary,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(AppAssets.chatIcon),
        title: ("チャット"),
        activeColorPrimary: Theme.of(context).colorScheme.primaryContainer,
        inactiveColorPrimary: Theme.of(context).colorScheme.primaryContainer,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(AppAssets.profileIcon),
        title: ("マイページ"),
        activeColorPrimary: Theme.of(context).colorScheme.primaryContainer,
        inactiveColorPrimary: Theme.of(context).colorScheme.primaryContainer,
      ),
    ];
  }
}
