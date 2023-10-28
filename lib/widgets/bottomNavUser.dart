// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:growit/screens/user/biddingScreen.dart';
import 'package:growit/screens/user/userHome.dart';
import 'package:growit/screens/user/userProfile.dart';

import '../constant.dart';

class bottomNavigationBar extends StatefulWidget {
  const bottomNavigationBar({Key, key}) : super(key: key);

  // final RouteLogin=true;
  @override
  bottomNavigationBarState createState() => bottomNavigationBarState();
}

class bottomNavigationBarState extends State<bottomNavigationBar> {
  @override
  var smallHeading = 25.0;
  var largeHeading = 30.0;
  static var selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    UserHome(),
    BiddingScreen(),
    UserProfile(),
    // ConversationScreen(),
    // OrdersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: kBG,
      bottomNavigationBar: Container(
        height: 70,
        // color: Colors.black,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: const [
            BoxShadow(color: Colors.black26, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: BottomNavigationBar(
            backgroundColor: kPrimaryColor,
            type: BottomNavigationBarType.fixed,
            landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            unselectedItemColor: kSupportiveGrey,
            selectedItemColor: Color(0xff40C165),
            onTap: _onTap,
            currentIndex: selectedIndex,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: '',
                icon: Icon(
                  selectedIndex == 0
                      ? CupertinoIcons.home
                      : CupertinoIcons.home,
                  color: selectedIndex == 0 ? kWhite : kWhite.withOpacity(.5),
                  size: selectedIndex == 0 ? largeHeading : smallHeading,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  selectedIndex == 1 ? Icons.ac_unit : Icons.ac_unit,
                  color: selectedIndex == 1 ? kWhite : kWhite.withOpacity(.5),
                  size: selectedIndex == 1 ? largeHeading : smallHeading,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  selectedIndex == 2
                      ? Icons.account_circle
                      : Icons.account_circle_outlined,
                  color: selectedIndex == 2 ? kWhite : kWhite.withOpacity(.5),
                  size: selectedIndex == 2 ? largeHeading : smallHeading,
                ),
                label: "",
              ),
            ],
          ),
        ),
      ),
      body: _widgetOptions.elementAt(selectedIndex),
    );
  }

  void _onTap(int index) {
    selectedIndex = index;
    setState(() {});
  }
}
