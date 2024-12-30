import 'package:enjoy_plus/generated/assets.dart';
import 'package:flutter/material.dart';

class HomeNav extends StatelessWidget {
  HomeNav({super.key});

  // 导航数据
  List navList = [
    {
      'title': '我的房屋',
      'icon': Assets.imagesHouseNavIcon2x,
    },
    {
      'title': '我的报修',
      'icon': Assets.imagesRepairNavIcon2x,
    },
    {
      'title': '访客登记',
      'icon': Assets.imagesVisitorNavIcon2x,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      padding: const EdgeInsets.only(bottom: 10, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
          navList.map((item) {
            return Expanded(
                child: Column(
                  children: [
                    Image.asset(
                      item['icon'],
                      width: 35,
                    ),
                    Text(item['title']),
                  ],
                ));
          }).toList()
      ),
    );
  }
}