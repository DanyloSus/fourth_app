import 'package:flutter/material.dart';

class CustomSliver extends StatefulWidget {
  const CustomSliver({super.key});

  @override
  State<CustomSliver> createState() => _CustomSliverState();
}

class _CustomSliverState extends State<CustomSliver>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          title: const Text("Custom Sliver App Bar"),
          floating: true,
          bottom: TabBar(
            tabs: const [
              Tab(
                text: 'Tab 1',
              ),
              Tab(
                text: 'Tab 2',
              ),
            ],
            controller: controller,
          ),
        ),
        SliverFillRemaining(
          child: TabBarView(
            controller: controller,
            children: const [
              Center(
                child: Text(
                  "Tab one",
                ),
              ),
              Center(
                child: Text(
                  "Tab two",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
