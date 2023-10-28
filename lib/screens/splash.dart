import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growit/constant.dart';
import 'package:growit/screens/serviceSelection.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/bottomNavStore.dart';
import '../widgets/bottomNavUser.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  // String? uid;
  // Bool? isUser;
  // getUid() async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   var uid1 = sp.getString('uid');
  //   bool? isUser1 = sp.getBool('isUser');
  //   setState(() {
  //     uid = uid1;
  //     isUser = isUser1 as Bool?;
  //     print('uid');
  //     print(uid);
  //     print('isUser');
  //     print(isUser);
  //   });
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   getUid().whenComplete(() => {
  //         Timer(
  //           const Duration(seconds: 5),
  //           () {
  //             uid == null
  //                 ? Navigator.pushReplacement(context,
  //                     MaterialPageRoute(builder: (_) => WelcomeScreen()))
  //                 : isUser == true
  //                     ? Navigator.pushReplacement(
  //                         context,
  //                         MaterialPageRoute(
  //                             builder: (_) => bottomNavigationBar()))
  //                     : Navigator.pushReplacement(
  //                         context,
  //                         MaterialPageRoute(
  //                             builder: (_) => bottomNavigationBarStore()));
  //           },
  //         )
  //       });
  // }
  String? uid1;
  bool isUser1 = false;
  @override
  void initState() {
    super.initState();
    getValidation().whenComplete(() => {
          Timer(
            const Duration(seconds: 5),
            () {
              uid1 == null
                  ? Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) => WelcomeScreen()))
                  : isUser1
                      ? Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => bottomNavigationBar()))
                      : Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => bottomNavigationBarStore()));
            },
          )
        });
  }

  Future getValidation() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    var uid = sp.getString('uid');
    bool? isUser = sp.getBool('isUser');
    setState(() {
      uid1 = uid;
      isUser1 = isUser!;
    });
    print('uid');
    print(uid);
    print('isUser');
    print(isUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBG,
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * .3,
              width: MediaQuery.of(context).size.width * .6,
              margin: EdgeInsets.only(
                top: 70,
              ),
              padding: EdgeInsets.all(5),
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.r),
                  child: Image.asset(
                    'assets/image/logoo1.png',
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * .17,
                    width: MediaQuery.of(context).size.width * .32,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xffFFEFDC),
                borderRadius: BorderRadius.circular(40.r),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          CircularProgressIndicator(
            color: kSupportiveGrey,
          )
        ],
      ),
    );
  }
}
