import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ondago/views/bussiness/Activity/all_activity.dart';
import 'package:ondago/views/bussiness/Section_3_4/Profile/profile.dart';
import 'package:ondago/views/bussiness/Section_3_4/bussiness_home_sreeen.dart';
import 'package:ondago/views/widgets/utils/images.dart';

class BusinessBottomAppBar extends StatefulWidget {
  @override
  _BottomBarCusState createState() => _BottomBarCusState();
}

class _BottomBarCusState extends State<BusinessBottomAppBar> {
  int selectedIndex = 0;

  final List<Widget> classes = [
    // HomeScreen(),
    BussinessHomeSreeen(), Text(''), ProfileScreens(), AllActivity(), Text('')
  ];

  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: classes[selectedIndex],
      bottomNavigationBar: Container(
        height: 75,
        child: BottomAppBar(
            elevation: 0,
            // shadowColor: Colors.amber,
            padding: EdgeInsets.all(0),
            color: Color(0xffFFFFFF),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildNavItem(
                  Images.home,
                  Images.home,
                  0,
                ),
                buildNavItem(
                  Images.appbar3,
                  Images.appbar3,
                  1,
                ),
                buildNavItem(
                  Images.profile,
                  Images.profile,
                  2,
                ),
                buildNavItem(
                  Images.filterr,
                  Images.filterr,
                  3,
                ),
                buildNavItem(
                  Images.chatappbar,
                  Images.chatappbar,
                  4,
                ),
              ],
            )),
      ),
    );
  }

  Widget buildNavItem(
    String icon,
    String fillIcon,
    int index,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
            onTap: () => onTabTapped(index),
            child: SvgPicture.asset(
              icon,
              color: selectedIndex == index
                  ? Color(0xff3A81F7)
                  : Color(0xff8E8E8F),
            )),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
