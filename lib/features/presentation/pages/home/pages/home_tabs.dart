import 'package:flutter/material.dart';
import 'package:spotify/core/utils/resources/strings_manager.dart';
import 'package:spotify/core/utils/resources/values_manager.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({super.key});

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: AppSelectedIndex.i4,
      vsync: this,
    );

    _tabController.addListener(() {
      setState(() {});
    });
  }

  final List<Widget> tabs = const [
    Text(AppStrings.news),
    Text(AppStrings.videos),
    Text(AppStrings.artists),
    Text(AppStrings.podcasts),
  ];

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      tabs: tabs,
    );
  }
}
