// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:growit/constant.dart';
import 'package:growit/screens/admin/adminDashBoard.dart';
import 'package:growit/screens/user/signupUser.dart';
import 'package:growit/widgets/bottomNavUser.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/userDetails.dart';
import '../../widgets/getCTAButton.dart';
import '../../widgets/textFieldWidget.dart';
import '../forgotPassword.dart';

class LogInUser extends StatefulWidget {
  const LogInUser({Key? key}) : super(key: key);

  @override
  State<LogInUser> createState() => _LogInUserState();
}

class _LogInUserState extends State<LogInUser> {
  getUid() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('uid', FirebaseAuth.instance.currentUser!.uid);
    sp.setBool('isUser', true);
    // sp.remove('uidStore');
  }

  bool passwordObscured = true;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController pcontroller = TextEditingController();
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
      getUid();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => bottomNavigationBar()));
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
    }
    // else if (phonecontroller.text.length < 11) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text("PhoneNumber Length must be 11 digits"),
    //       duration: Duration(milliseconds: 300),
    //     ),
    //   );
    // }
    else if (pcontroller.text.isEmpty) {
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

  ///google Login
  bool isLoadGoogle = false;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googlSignIn = new GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoadGoogle == true
          ? const Center(
              child: CircularProgressIndicator(
              color: kPrimaryColor,
            ))
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // decoration: BoxDecoration(
              //   gradient: gradient1,
              // )
              //,
              color: kPrimaryColor,
              child: Column(
                children: [
                  Center(
                    child: Container(
                      margin:
                          const EdgeInsets.only(top: 50, bottom: 30, left: 0.0),
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
                                    'Login',
                                    style: GoogleFonts.manrope(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
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
                                      fontSize: 11, color: Colors.black54),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            textFieldWidget('Enter Email', emailcontroller),
                            textFieldWidget('Enter Password', pcontroller),
                            SizedBox(
                              height: 30.h,
                            ),
                            getCtaButton(
                                onPress: () {
                                  if (emailcontroller.text ==
                                          'admin@admin.com' &&
                                      pcontroller.text == 'admin123') {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => AdminDashboard()),
                                        (route) => false);
                                  } else {
                                    validation(context);
                                  }
                                },
                                color: kGreenColor,
                                text: 'Login'),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'Or Sign in with',
                              style: GoogleFonts.nunitoSans(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff505050),
                                // height: 22.h
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await _signIn(context);
                                  },
                                  child: isLoadGoogle
                                      ? CircularProgressIndicator(
                                          color: Colors.black)
                                      : Image.asset(
                                          'assets/image/Google.png',
                                          width: 36,
                                          height: 36,
                                        ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: TextButton(
                                  child: Text(
                                    'Forget Password?',
                                    style: GoogleFonts.manrope(
                                        fontSize: 14.sp,
                                        color: kSupportiveGrey),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ForgetScreen()),
                                    );
                                  }),
                            ),
                            Container(
                              // margin: EdgeInsets.only(top: 10),
                              child: TextButton(
                                child: Text(
                                  'Don\'t have an account? Sign Up',
                                  style: GoogleFonts.manrope(
                                      fontSize: 14.sp, color: kSupportiveGrey),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignupUser()),
                                  );
                                },
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

  Future<User?> _signIn(BuildContext context) async {
    // Scaffold.of(context).showSnackBar(new SnackBar(
    //   content: new Text('Sign in'),
    // ));

    final GoogleSignInAccount? googleUser = await _googlSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential userDetails =
        await _firebaseAuth.signInWithCredential(credential);
    ProviderDetails providerInfo =
        new ProviderDetails(userDetails.credential!.providerId);

    // ignore: deprecated_member_use
    List<ProviderDetails> providerData = <ProviderDetails>[];
    providerData.add(providerInfo);

    UserDetails details = new UserDetails(
      userDetails.credential!.providerId,
      userDetails.user!.displayName!,
      userDetails.user!.displayName!,
      userDetails.user!.email!,
      providerData,
    );
    try {
      await FirebaseFirestore.instance
          .collection('userInfo')
          .doc(userDetails.user!.uid)
          .update({
        'uid': userDetails.user!.uid,
      });
    } catch (e) {
      await FirebaseFirestore.instance
          .collection('userInfo')
          .doc(userDetails.user!.uid)
          .set({
        'userEmail': userDetails.user!.email.toString(),
        'uid': userDetails.user!.uid,
        "isStore": false,
        'userName': userDetails.user!.displayName.toString(),
        'photoUrl': userDetails.user!.photoURL.toString(),
        'address': null,
        'profession': null,
      });
      getUid() async {
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString('uid', FirebaseAuth.instance.currentUser!.uid);
        sp.setBool('isUser', true);
        // sp.remove('uidStore');
      }

      getUid();
    }

    setState(() {
      isLoadGoogle = false;
    });
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => bottomNavigationBar(),
        ),
        (route) => false);
    return userDetails.user;
  }
}
