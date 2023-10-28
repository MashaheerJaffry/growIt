import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growit/widgets/bottomNavStore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant.dart';
import '../../widgets/textFieldWidget.dart';
import '../serviceSelection.dart';

class SignupStore extends StatefulWidget {
  const SignupStore({Key? key}) : super(key: key);

  @override
  State<SignupStore> createState() => _SignupStoreState();
}

class _SignupStoreState extends State<SignupStore> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController whatsapp = TextEditingController();
  TextEditingController profession = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WelcomeScreen()),
                              );
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
                                  children: [
                                    Text(
                                      'Create New',
                                      style: GoogleFonts.manrope(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 30.sp),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Store',
                                    style: GoogleFonts.manrope(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 30.sp,
                                        color: Colors.black54),
                                  )
                                ],
                              ),
                              // Container(
                              //   padding: const EdgeInsets.only(
                              //       left: 30, right: 30, top: 30, bottom: 20),
                              //   child: TextField(
                              //     controller: userName,
                              //     decoration: InputDecoration(
                              //       labelText: 'Enter Username',
                              //       prefixIcon: const Icon(
                              //         Icons.person,
                              //         color: kSupportiveGrey,
                              //       ),
                              //       border: OutlineInputBorder(
                              //         borderRadius: BorderRadius.circular(20),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              SizedBox(
                                height: 20.0,
                              ),
                              textFieldWidgetWithPrefix(
                                  'Enter Username', userName, Icons.person),
                              textFieldWidgetWithPrefix(
                                  'Enter Email', email, Icons.email),
                              textFieldWidgetWithPrefix(
                                  'Enter Address', address, Icons.location_on),
                              textFieldWidgetWithPrefix('Enter Whatsapp Number',
                                  whatsapp, Icons.whatsapp),
                              textFieldWidgetWithPrefix('Enter Profession',
                                  profession, Icons.percent_rounded),
                              // Container(
                              //   padding: const EdgeInsets.only(
                              //       left: 30, right: 30, bottom: 20),
                              //   child: TextField(
                              //     controller: email,
                              //     decoration: InputDecoration(
                              //       labelText: 'Enter Email',
                              //       prefixIcon: const Icon(
                              //         Icons.email,
                              //         color: kSupportiveGrey,
                              //       ),
                              //       border: OutlineInputBorder(
                              //         borderRadius: BorderRadius.circular(20),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // Container(
                              //   padding: const EdgeInsets.only(
                              //     left: 30,
                              //     right: 30,
                              //   ),
                              //   child: TextField(
                              //     controller: address,
                              //     decoration: InputDecoration(
                              //       labelText: 'Enter Address  ',
                              //       prefixIcon: const Icon(
                              //         Icons.location_on,
                              //         color: kSupportiveGrey,
                              //       ),
                              //       border: OutlineInputBorder(
                              //         borderRadius: BorderRadius.circular(20),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // Container(
                              //   padding: const EdgeInsets.only(
                              //       left: 30, right: 30, top: 20),
                              //   child: TextField(
                              //     controller: whatsapp,
                              //     decoration: InputDecoration(
                              //       labelText: 'Enter Whatsapp Number  ',
                              //       prefixIcon: const Icon(
                              //         Icons.whatsapp,
                              //         color: kSupportiveGrey,
                              //       ),
                              //       border: OutlineInputBorder(
                              //         borderRadius: BorderRadius.circular(20),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 30, right: 30, top: 10, bottom: 10),
                                child: TextField(
                                  controller: password,
                                  decoration: InputDecoration(
                                    hintText: 'Enter Password',
                                    hintStyle: kFieldStyle,
                                    filled: true,
                                    fillColor: kWhite,
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: kSupportiveGrey,
                                    ),
                                    suffixIcon: const Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: kSupportiveGrey,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  validation(context);
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      top: 50, bottom: 20),
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
                                        'Create Store',
                                        style: GoogleFonts.manrope(
                                            color: Colors.white,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

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
      "isStore": true,
      "whatsapp": whatsapp.text.toString(),
      "address": address.text.toString(),
      'profession': profession.text.toString(),
      "uid": authResult.user?.uid,
      "userPass": password.text.toString(),
      "photoUrl": null,
    });
    getUid();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => bottomNavigationBarStore()));
    setState(() {
      isLoading = false;
    });
  }

  getUid() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('uid', FirebaseAuth.instance.currentUser!.uid);
    sp.setBool('isUser', false);
  }

  static String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(p);
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
}
