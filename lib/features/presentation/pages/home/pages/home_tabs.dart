import 'package:flutter/material.dart';
import 'package:spotify/core/utils/resources/strings_manager.dart';
import 'package:spotify/core/utils/resources/values_manager.dart';

import '../widgets/news_songs.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({super.key});

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> with TickerProviderStateMixin {
  late TabController _tabController;
  late VoidCallback _tabListener;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: AppSelectedIndex.i4,
      vsync: this,
    );

    _tabListener = () {
      _tabController.addListener(_tabListener);
      setState(() {});
    };
  }

  @override
  void dispose() {
    _tabController.removeListener(_tabListener);
    _tabController.dispose();
    super.dispose();
  }

  final List<Widget> tabs = const [
    Text(AppStrings.news),
    Text(AppStrings.videos),
    Text(AppStrings.artists),
    Text(AppStrings.podcasts),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: tabs,
        ),
        const SizedBox(height: AppSize.s30),
        SizedBox(
          height: AppSize.s220,
          child: TabBarView(
            controller: _tabController,
            children: const [
              NewsSongs(),
              Center(child: Text(AppStrings.videos)),
              Center(child: Text(AppStrings.artists)),
              Center(child: Text(AppStrings.podcasts)),
            ],
          ),
        ),
      ],
    );
  }
}
