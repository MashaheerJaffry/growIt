import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growit/constant.dart';
import 'package:growit/screens/store/signupStore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/bottomNavStore.dart';
import '../../widgets/textFieldWidget.dart';
import '../forgotPassword.dart';

class LogInStore extends StatefulWidget {
  const LogInStore({Key? key}) : super(key: key);

  @override
  State<LogInStore> createState() => _LogInStoreState();
}

class _LogInStoreState extends State<LogInStore> {
  bool passwordObscured = true;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController pcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // decoration: BoxDecoration(
        //   gradient: gradient1,
        // )
        //,
        color: kRed,
        child: Column(
          children: [
            Row(
              children: [
                MaterialButton(
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Center(
                  child: Container(
                    margin:
                        const EdgeInsets.only(top: 50, bottom: 30, left: 60.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .10,
                          width: MediaQuery.of(context).size.width * .20,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/image/logo.png',
                                width: 60,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: MediaQuery.of(context).size.height,
                // margin: const EdgeInsets.only(right: 10),
                decoration: const BoxDecoration(
                  color: kBG,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Login as Store',
                              style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w700, fontSize: 30.sp),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sign in to continue',
                            style: GoogleFonts.manrope(
                                fontWeight: FontWeight.w500,
                                fontSize: 20.sp,
                                color: Colors.black54),
                          )
                        ],
                      ),
                      // Container(
                      //   padding: const EdgeInsets.only(
                      //       left: 30, right: 30, top: 30, bottom: 20),
                      //   child: TextField(
                      //     controller: emailcontroller,
                      //     decoration: InputDecoration(
                      //       labelText: 'Enter Email1',
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(20),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 20.0,
                      ),
                      textFieldWidget('Enter Email', emailcontroller),
                      textFieldWidget('Enter Password', pcontroller),
                      // Container(
                      //   padding: const EdgeInsets.only(
                      //     left: 30,
                      //     right: 30,
                      //   ),
                      //   child: TextField(
                      //     controller: pcontroller,
                      //     decoration: InputDecoration(
                      //       labelText: 'Enter Password',
                      //       border: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(20),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      MaterialButton(
                          child: Container(
                            margin: const EdgeInsets.only(top: 20),
                            height: 50,
                            width: MediaQuery.of(context).size.width * .6,
                            decoration: BoxDecoration(
                              color: kRed,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Log In',
                                  style: GoogleFonts.manrope(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                          // Within the `FirstRoute` widget
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) =>
                            //           const bottomNavigationBarStore()),
                            // );
                            validation(context);
                          }),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                                child: Text(
                                  'Forget Password?',
                                  style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.sp,
                                      color: Colors.black54),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgetScreen()),
                                  );
                                }),
                          ],
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              child: Text(
                                'Don\'t have an account? Sign Up',
                                style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp,
                                    color: Colors.black54),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignupStore()),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getUid() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('uid', FirebaseAuth.instance.currentUser!.uid);
    sp.setBool('isUser', false);
    // sp.remove('uidStore');
  }

  late UserCredential authResult;
  // ignore: non_constant_identifier_names
  bool Loading = false;
  void submit() async {
    setState(() {
      Loading = true;
    });
    try {
      authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text, password: pcontroller.text);
      // final SharedPreferences sp = await SharedPreferences.getInstance();
      // sp.setString('email', emailcontroller.text);
      getUid();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => bottomNavigationBarStore()));
    } on PlatformException catch (e) {
      String message = "Please Check Internet";
      if (e.message != null) {
        message = e.message.toString();
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message.toString()),
      ));
      setState(() {
        Loading = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
      setState(() {
        Loading = false;
      });
    }

    setState(() {
      Loading = false;
    });
  }

  void validation(context) {
    if (emailcontroller.text.isEmpty && pcontroller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Both are Empty"),
          duration: Duration(milliseconds: 300),
        ),
      );
    } else if (emailcontroller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid Empty"),
          duration: Duration(milliseconds: 300),
        ),
      );
    } else if (pcontroller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid Empty"),
          duration: Duration(milliseconds: 300),
        ),
      );
    } else {
      submit();
    }
  }
}
