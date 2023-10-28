// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growit/screens/store/storeProfile.dart';
import 'package:growit/screens/user/userHome.dart';

import '../constant.dart';
import '../screens/store/adPostScreen.dart';

class bottomNavigationBarStore extends StatefulWidget {
  const bottomNavigationBarStore({Key, key}) : super(key: key);

  // final RouteLogin=true;
  @override
  bottomNavigationBarStoreState createState() =>
      bottomNavigationBarStoreState();
}

class bottomNavigationBarStoreState extends State<bottomNavigationBarStore> {
  @override
  var smallHeading = 25.0;
  var largeHeading = 30.0;
  static var selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    UserHome(),
    AdPost(),
    StoreProfile(),
    // ConversationScreen(),
    // OrdersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    bool showHome = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      extendBody: true,
      backgroundColor: kBG,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Visibility(
        visible: !showHome,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => AdPost()));
          },
          child: Container(
            height: 59.0,
            width: 59.0,
            child: Icon(
              Icons.add,
              color: kWhite,
            ),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: kBG, // red as border color
                ),
                color: kSecondaryColor,
                borderRadius: BorderRadius.circular(20.r)),
          ),
        ),
      ),
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
                icon: SizedBox(),
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
