import 'package:enjoy_plus/generated/assets.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  // 菜单数据
  final List menuList = [
    {
      "title": "我的房屋",
      "icon": Assets.imagesHouseProfileIcon2x,
    },
    {
      "title": "我的报修",
      "icon": Assets.imagesRepairProfileIcon2x,
    },
    {
      "title": "访客记录",
      "icon": Assets.imagesVisitorProfileIcon2x,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(200, 85, 145, 175),
      appBar: AppBar(
        title: const Text('我的', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // 个人信息
          Container(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, '/profile');
                  },
                  child: Row(children: [
                    Row(children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.asset(Assets.imagesAvatar1,
                              width: 50, height: 50)),
                      const SizedBox(width: 10),
                      const Text('用户名',
                          style: TextStyle(fontSize: 16, color: Colors.white))
                    ]),
                    const Spacer(),
                    const Row(children: [
                      Text(
                        '去完善信息',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 13,
                      )
                    ])
                  ])
              )
          ),
          Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(
                  top: 20, left: 10, right: 10, bottom: 20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                  children: menuList.map((item) {
                    return SizedBox(
                        height: 50,
                        child: Row(children: [
                          Row(
                            children: [
                              Image.asset(
                                item['icon'],
                                width: 20,
                                height: 20,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                item['title'],
                                style: const TextStyle(fontSize: 16),
                              )
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 12,
                            color: Colors.grey,
                          )
                        ]));
                  }).toList()))
        ],
      ),
    );
  }
}