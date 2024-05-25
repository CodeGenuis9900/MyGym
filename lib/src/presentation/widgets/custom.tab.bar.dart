import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  final List<String> tabNames;
  final TabController tabController;
  final List<Widget> tabContents;

  const CustomTabBar({
    super.key,
    required this.tabNames,
    required this.tabController,
    required this.tabContents,
  });

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.blue[100],
          ),
          child: TabBar(
            controller: widget.tabController,
            tabs: widget.tabNames.map((name) => Tab(text: name)).toList(),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.blue, // Selected tab background color
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: widget.tabController,
            children: widget.tabContents,
          ),
        ),
      ],
    );
  }
}
