import 'package:enjoy_plus/generated/assets.dart';
import 'package:enjoy_plus/pages/home/index.dart';
import 'package:enjoy_plus/pages/mine/index.dart';
import 'package:flutter/material.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
  // 记录当前索引
  int currentIndex = 0;

  // 底部TabBar数据
  List tabBarList = [
    {
      "title": "首页",
      "default": Assets.tabsHomeDefault,
      "active": Assets.tabsHomeActive
    },
    {
      "title": "我的",
      "default": Assets.tabsMyDefault,
      "active": Assets.tabsMyActive
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [HomePage(), MinePage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // 设置底部导航item样式
        type: BottomNavigationBarType.fixed,
        items: barItemList(),
        currentIndex: currentIndex,
        selectedItemColor: const Color.fromARGB(255, 85, 145, 175),
        unselectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }

  List<BottomNavigationBarItem> barItemList() {
    List<BottomNavigationBarItem> items = [];
    for (var item in tabBarList) {
      items.add(
        BottomNavigationBarItem(
            icon: Image.asset(
              item['default'],
              width: 32,
              height: 32,
            ),
            activeIcon: Image.asset(
              item['active'],
              width: 32,
              height: 32,
            ),
            label: item['title']),
      );
    }
    return items;
  }
}