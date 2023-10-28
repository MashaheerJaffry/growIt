import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growit/screens/store/loginStore.dart';
import 'package:growit/screens/user/loginUser.dart';

import '../constant.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // var address = 'address';
  // var address2 = 'address';
  //
  // isFirstUser() async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   address = sp.getString('address')!;
  //   print('address');
  //   print(address);
  // }
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   isFirstUser();
  //   print('address');
  //   print(address);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBG,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .18,
              width: MediaQuery.of(context).size.width * .33,
              margin: EdgeInsets.only(
                top: 70,
              ),
              padding: EdgeInsets.all(5),
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.r),
                  child: Image.asset(
                    'assets/growItLogo.jpg',
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
            // SizedBox(height: MediaQuery.of(context).size.height*.1,),

            Container(
              margin: EdgeInsets.only(top: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Let’s get started',
                    style: GoogleFonts.manrope(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      // height: 42.h
                    ),
                  )
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor ',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.manrope(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff000000).withOpacity(0.7),
                          // height: 22.h
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '. .',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35.sp,
                      color: kSupportiveGrey),
                ),
                Text(
                  ' .',
                  style: TextStyle(
                      fontSize: 35.sp,
                      fontWeight: FontWeight.bold,
                      color: kRedColor),
                )
              ],
            ),

            MaterialButton(
                child: Container(
                  height: MediaQuery.of(context).size.height * .1,
                  width: MediaQuery.of(context).size.width * .8,
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Continue as a User',
                        style: GoogleFonts.manrope(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800,
                          color: kWhite,
                          // height: 22.h
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: kRedColor,
                      borderRadius: BorderRadius.circular(15.r)),
                ),
                // Within the `FirstRoute` widget
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogInUser()),
                  );
                }),

            MaterialButton(
                child: Container(
                  height: MediaQuery.of(context).size.height * .1,
                  width: MediaQuery.of(context).size.width * .8,
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Continue as a store',
                        style: GoogleFonts.manrope(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800,
                          color: kWhite,
                          // height: 22.h
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: kSupportiveGrey,
                      borderRadius: BorderRadius.circular(15.r)),
                ),
                // Within the `FirstRoute` widget
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogInStore()),
                  );
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height * .03,
            ),

            // Text(
            //   'Forgot your account?',
            //   style: GoogleFonts.manrope(
            //     fontSize: 16.sp,
            //     fontWeight: FontWeight.w400,
            //     color: Color(0xff000000).withOpacity(0.5),
            //     // height: 22.h
            //   ),
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .04,
            ),
          ],
        ),
      ),
    );
  }
}
