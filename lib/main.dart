import "dart:async";

import "package:flutter/material.dart";
import "package:fourth_app/widgets/custom_sliver.dart";
import "package:fourth_app/widgets/drawer.dart";

import "widgets/footer.dart";
import "widgets/hero_animation.dart";
import "widgets/shop_hero.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _drawerIndex = 0;

  void _onDrawersItemTapped(int newIndex) {
    setState(() {
      _drawerIndex = newIndex;
    });
  }

  int footerIndex = 0;

  void onFooterTap(int newIndex) {
    setState(
      () {
        footerIndex = newIndex;
        _pageController.animateToPage(
          newIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      },
    );
  }

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  int countOfClicks = 0;
  int countOfGrandmas = 0;
  int countOfFarms = 0;
  int countOfMines = 0;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var timer = Timer(
      const Duration(seconds: 1),
      () => setState(
        () {
          countOfClicks +=
              countOfGrandmas + countOfFarms * 2 + countOfMines * 3;
        },
      ),
    );

    var contentList = [
      [const HeroAnimation(), AppBar(), null],
      [const CustomSliver(), null, null],
      [
        SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => footerIndex = index);
            },
            children: [
              const Card(
                shadowColor: Colors.transparent,
                margin: EdgeInsets.all(8.0),
                child: SizedBox.expand(
                  child: Center(
                    child: Text(
                      'Home page',
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.notifications_sharp),
                        title: Text('Notification 1'),
                        subtitle: Text('This is a notification'),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: Icon(Icons.notifications_sharp),
                        title: Text('Notification 2'),
                        subtitle: Text('This is a notification'),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                reverse: true,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Text(
                          'Hello',
                        ),
                      ),
                    );
                  }
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Text(
                        'Hi!',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        AppBar(),
        CustomBottomNavigationBar(
          selectedIndex: footerIndex,
          onItemTapped: (int newIndex) {
            onFooterTap(newIndex);
          },
        ),
      ],
      [
        ShopHero(
          addGrandma: () => {
            if (countOfClicks >= 100 + countOfGrandmas * 20)
              {
                setState(
                  () {
                    countOfGrandmas += 1;
                    countOfClicks -= 100 + countOfGrandmas * 20;
                  },
                ),
              }
          },
          countOfGrandmas: countOfGrandmas,
          addFarm: () => {
            if (countOfClicks >= 500 + countOfFarms * 20)
              {
                setState(
                  () {
                    countOfFarms += 1;
                    countOfClicks -= 500 + countOfFarms * 20;
                  },
                ),
              }
          },
          countOfFarms: countOfFarms,
          addMine: () => {
            if (countOfClicks >= 1000 + countOfMines * 20)
              {
                setState(
                  () {
                    countOfMines += 1;
                    countOfClicks -= 1000 + countOfMines * 20;
                  },
                ),
              }
          },
          countOfMines: countOfMines,
        ),
        AppBar(),
        null
      ],
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: contentList[_drawerIndex][1] as AppBar?,
        body: contentList[_drawerIndex][0],
        drawer: CustomDrawer(
          drawerIndex: _drawerIndex,
          onTap: _onDrawersItemTapped,
        ),
        bottomNavigationBar: contentList[_drawerIndex][2],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              countOfClicks += 1;
            });
          },
          child: Text("$countOfClicks"),
        ),
      ),
    );
  }
}
