import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant.dart';
import '../../widgets/bottomNavUser.dart';
import '../../widgets/getCTAButton.dart';

class SignupUser extends StatefulWidget {
  const SignupUser({Key? key}) : super(key: key);

  @override
  State<SignupUser> createState() => _SignupUserState();
}

class _SignupUserState extends State<SignupUser> {
  bool passwordObscured = true;
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(p);
  bool isLoading = false;
  late UserCredential authResult;
  void submit() async {
    setState(() {
      isLoading = true;
    });
    try {
      authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      // ignore: nullable_type_in_catch_clause
    } on PlatformException catch (e) {
      String message = "Please Check Internet";
      if (e.message != null) {
        message = e.message.toString();
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
      ));
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
    // var random = Random().nextInt(99999999);
    await FirebaseFirestore.instance
        .collection('userInfo')
        .doc(authResult.user?.uid)
        .set({
      "userName": userName.text.toString(),
      "userEmail": email.text.toString(),
      "isStore": false,
      "uid": authResult.user?.uid,
      "userPass": password.text.toString(),
      "photoUrl": null,
    });
    getUid();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => bottomNavigationBar()));
    setState(() {
      isLoading = false;
    });
  }

  getUid() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('uid', FirebaseAuth.instance.currentUser!.uid);
    sp.setBool('isUser', true);
    // sp.remove('uidStore');
  }

  void validation(context) {
    if (email.text.isEmpty && password.text.isEmpty && userName.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("All Fields are Empty"),
          duration: Duration(milliseconds: 500),
        ),
      );
    } else if (email.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid Email"),
          duration: Duration(milliseconds: 500),
        ),
      );
    } else if (!regExp.hasMatch(email.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid Email"),
          duration: Duration(milliseconds: 500),
        ),
      );
    } else if (password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid Password"),
          duration: Duration(milliseconds: 500),
        ),
      );
    } else if (userName.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid Username"),
          duration: Duration(milliseconds: 500),
        ),
      );
    } else if (password.text.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password is too short!"),
          duration: Duration(milliseconds: 500),
        ),
      );
    } else {
      submit();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: kRedColor,
            ))
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // decoration: BoxDecoration(
              //   gradient: gradient1,
              // ),
              color: kRed,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30, bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                      ],
                    ),
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
                                children: const [
                                  Text(
                                    'Create New',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Account',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.black54),
                                )
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, top: 30, bottom: 20),
                              child: TextField(
                                style: kFieldStyle,
                                controller: userName,
                                decoration: InputDecoration(
                                  fillColor: kWhite,
                                  filled: true,
                                  hintText: 'Enter Username',
                                  hintStyle: kFieldStyle,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, bottom: 20),
                              child: TextField(
                                style: kFieldStyle,
                                controller: email,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: kWhite,
                                  hintStyle: kFieldStyle,
                                  hintText: 'Enter Email',
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                                padding: const EdgeInsets.only(
                                  left: 30,
                                  right: 30,
                                ),
                                child: TextField(
                                  style: kFieldStyle,
                                  controller: password,
                                  decoration: InputDecoration(
                                    fillColor: kWhite,
                                    filled: true,
                                    hintText: 'Enter Password',
                                    hintStyle: kFieldStyle,
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 30.h,
                            ),
                            getCtaButton(
                                onPress: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (_) =>
                                  //             bottomNavigationBar()));
                                  validation(context);
                                },
                                color: kGreenColor,
                                text: 'Signup'),
                            SizedBox(
                              height: 20.0,
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
}
