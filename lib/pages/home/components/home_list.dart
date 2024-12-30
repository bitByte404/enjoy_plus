import 'package:enjoy_plus/generated/assets.dart';
import 'package:flutter/material.dart';


class HomeList extends StatelessWidget {
  HomeList({super.key/*, required this.notifyList*/});

  List notifyList = [
    {
      'title': '中秋、国庆温馨提示中秋、国庆温馨提示',
      'content': '中秋、国庆温馨提示中秋、国庆温馨提示中秋、国庆温馨提示中秋、国庆温馨提示中秋、国庆温馨提示中秋、国庆温馨提示',
      'createdAt': '2024-09-22 15:00:00',
    },
    {
      'title': '中秋、国庆温馨提示中秋、国庆温馨提示',
      'content': '中秋、国庆温馨提示中秋、国庆温馨提示中秋、国庆温馨提示中秋、国庆温馨提示中秋、国庆温馨提示中秋、国庆温馨提示',
      'createdAt': '2024-09-22 15:00:00',
    },
    {
      'title': '中秋、国庆温馨提示中秋、国庆温馨提示',
      'content': '中秋、国庆温馨提示中秋、国庆温馨提示中秋、国庆温馨提示中秋、国庆温馨提示中秋、国庆温馨提示中秋、国庆温馨提示',
      'createdAt': '2024-09-22 15:00:00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                Assets.imagesNotice2x,
                width: 25,
              ),
              const Text(
                '社区',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Text('公告',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange)),
            ],
          ),
          ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: notifyList.map((item) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/detail',
                        arguments: {'id': '10011xx'});
                  },
                  child: Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(children: [
                              Expanded(
                                child: Text(
                                  item['title'],
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ]),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(children: [
                              Expanded(
                                child: Text(
                                  item['content'],
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ]),
                            const SizedBox(height: 8),
                            Row(children: [
                              Expanded(
                                child: Text(
                                  item['createdAt'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ),
                            ])
                          ],
                        ),
                      )),
                );
              }).toList())
        ],
      ),
    );
  }
}