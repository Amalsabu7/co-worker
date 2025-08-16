import 'dart:collection';

import 'package:co_working/components/colors.dart';
import 'package:co_working/components/size_config.dart';
import 'package:co_working/ui/bookings/my_bookings_screen.dart';
import 'package:co_working/ui/main_screens/home_screen.dart';
import 'package:co_working/ui/main_screens/map_view_screen.dart';
import 'package:co_working/ui/main_screens/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserDashBoard extends StatefulWidget {
  const UserDashBoard({super.key});

  @override
  State<UserDashBoard> createState() => _UserDashBoardState();
}

class _UserDashBoardState extends State<UserDashBoard> {
  int selectedIndex = 0;
  List<Widget> pages = [];

  double selectedSize = SizeConfig.blockHeight * 3.2;
  double normalSize = SizeConfig.blockHeight * 3;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pages = [
      const HomeScreen(),
      const MapViewScreen(),
      const MyBookingsScreen(),
      const NotificationScreen(),

    ];
  }


  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: COLORS.whiteDark,
      extendBody: true,
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: Container(
        height: SizeConfig.blockHeight * 12,
        width: SizeConfig.blockWidth * 100,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: COLORS.whiteBlue,
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: COLORS.whiteDark,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/home.svg",
                width: normalSize,
                height: normalSize,
                color: (selectedIndex == 0)
                    ? COLORS.greenLight
                    : COLORS.whiteMedium,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/map.svg",
                  width: normalSize,
                  height: normalSize,
                  color: (selectedIndex == 1)
                      ? COLORS.greenLight
                      : COLORS.whiteMedium,
                ),
              label: "Map",
               ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/bookings.svg",
                  width: normalSize,
                  height: normalSize,
                  color: (selectedIndex == 2)
                      ? COLORS.greenLight
                      : COLORS.whiteMedium,
                ),
              label: "Bookings",
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/notification.svg",
                  width: normalSize,
                  height: normalSize,
                  color: (selectedIndex == 3)
                      ? COLORS.greenLight
                      : COLORS.whiteMedium,
                ),
              label: "Notify",
            ),
          ],
          currentIndex: selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: COLORS.greenLight,
          unselectedItemColor: COLORS.whiteMedium,
          selectedIconTheme:
          IconThemeData(size: SizeConfig.blockHeight * 3.2),
          selectedLabelStyle: TextStyle(
              color: COLORS.greenDark,
              fontFamily: "Poppins",
              height: 1.8,
              fontSize: SizeConfig.blockWidth * 3.3,
              fontWeight: FontWeight.w800),
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
        ),
      ),
    );
  }


}
