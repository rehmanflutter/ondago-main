import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ondago/views/pages/worker/worker_home_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WorkerBnbPage extends StatefulWidget {
  const WorkerBnbPage({super.key});

  @override
  State<WorkerBnbPage> createState() => _WorkerBnbPageState();
}

class _WorkerBnbPageState extends State<WorkerBnbPage> {
  int _selectedIndex = 4;
  final _pages = [
    Container(color: Colors.red),
    Container(color: Colors.yellow),
    Container(color: Colors.grey),
    Container(color: Colors.blue),
    WorkerHomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F5FE),
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned(
                child: SizedBox(
              height: Get.height,
              width: Get.width,
              child: _pages[_selectedIndex],
            )),
            Positioned(
              bottom: 0,
              child: Container(
                height: Adaptive.px(72),
                width: Adaptive.w(100),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.05),
                        blurRadius: 15,
                        offset: const Offset(0, -4),
                      ),
                    ],
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(26))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    tabs('assets/icons/home.png', 0),
                    tabs('assets/icons/calendar.png', 1),
                    tabs('assets/icons/profile.png', 2),
                    tabs('assets/icons/graph.png', 3),
                    tabs('assets/icons/chat.png', 4),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabs(String icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Image.asset(
        icon,
        color: _selectedIndex == index
            ? const Color(0xff3A81F7)
            : const Color(0xff8E8E8F),
      ),
    );
  }
}
