// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growit/screens/store/editAdScreen.dart';
import 'package:growit/screens/user/loginUser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant.dart';
import '../../widgets/adTile.dart';
import '../../widgets/showToast.dart';
import '../serviceSelection.dart';
import '../user/adDetails.dart';
import 'editProfileStore.dart';

class StoreProfile extends StatefulWidget {
  @override
  _StoreProfileState createState() => _StoreProfileState();
}

class _StoreProfileState extends State<StoreProfile> {
  int index = 1;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.35,
                color: kRedColor,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     Icon(Icons.arrow_forward,
                    //         color: Colors.white),
                    //   ],
                    // ),
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/image/peson1.png'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Adam Aslam',
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'userProfession',
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
                // StreamBuilder<QuerySnapshot>(
                //   stream: FirebaseFirestore.instance
                //       .collection('userInfo')
                //       .where('uid',
                //           isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                //       .snapshots(),
                //   builder: (context, dataSnapShot) {
                //     return !dataSnapShot.hasData
                //         ? Center(
                //             child: Stack(
                //               children: const [
                //                 Text('Loading'),
                //               ],
                //             ),
                //           )
                //         : StaggeredGridView.countBuilder(
                //             scrollDirection: Axis.vertical,
                //             shrinkWrap: true,
                //             physics: ScrollPhysics(), // new
                //             crossAxisCount: 1,
                //             staggeredTileBuilder: (c) => StaggeredTile.fit(1),
                //             itemBuilder: (context, index) {
                //               DocumentSnapshot ds =
                //                   dataSnapShot.data!.docs[index];
                //               // WorkerAdModel userModel = WorkerAdModel.fromJson(
                //               //     dataSnapShot.data.docs[index].data());
                //               return Column(
                //                 mainAxisAlignment:
                //                     MainAxisAlignment.spaceEvenly,
                //                 children: [
                //                   // Row(
                //                   //   mainAxisAlignment: MainAxisAlignment.end,
                //                   //   children: [
                //                   //     Icon(Icons.arrow_forward,
                //                   //         color: Colors.white),
                //                   //   ],
                //                   // ),
                //                   CircleAvatar(
                //                     radius: 45,
                //                     backgroundColor: Colors.transparent,
                //                     backgroundImage: NetworkImage(dataSnapShot
                //                         .data!.docs[index]
                //                         .get('photoUrl')),
                //                   ),
                //                   SizedBox(
                //                     height: 10.0,
                //                   ),
                //                   Text(
                //                     dataSnapShot.data!.docs[index]
                //                         .get('userName'),
                //                     style: GoogleFonts.manrope(
                //                       fontWeight: FontWeight.w600,
                //                       fontSize: 20,
                //                       color: Colors.white,
                //                     ),
                //                   ),
                //                   SizedBox(
                //                     height: 5.0,
                //                   ),
                //                   Text(
                //                     'userProfession',
                //                     style: GoogleFonts.manrope(
                //                       fontWeight: FontWeight.bold,
                //                       fontSize: 15,
                //                       color: Colors.white.withOpacity(0.9),
                //                     ),
                //                   ),
                //                 ],
                //               );
                //             },
                //             itemCount: 1,
                //           );
                //   },
                // ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (_) => EditProfileUser()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.06,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.settings,
                              size: 30.0,
                              color: kGreenColor,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Settings', //Settings
                              style: GoogleFonts.manrope(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => LogInUser()),
                            (route) => false);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.06,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image(
                              image: AssetImage("assets/logout_ic.png"),
                              width: 30,
                              height: 30,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Logout', //Logout
                              style: GoogleFonts.manrope(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: false,
          backgroundColor: kRedColor,
          title: Text(
            'Store Profile',
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString('uidStore', 'null').whenComplete(() {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => WelcomeScreen()),
                        (route) => false);
                  });
                  showToastShort('Signed out', kPrimaryColor);
                },
                icon: Icon(
                  Icons.logout_outlined,
                  color: Colors.white,
                ))
          ],
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.25,
                          color: kRedColor,
                          child: Column(
                            children: [
                              SizedBox(height: 25),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 50,
                          left: 20,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.55,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)),
                            child: Container(
                              // margin: EdgeInsets.only(bottom: 105.0),
                              height: MediaQuery.of(context).size.height * 0.6,
                              child: StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('userInfo')
                                      .where('uid',
                                          isEqualTo: FirebaseAuth
                                              .instance.currentUser!.uid)
                                      .snapshots(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.hasError)
                                      return new Text(
                                          'Error: ${snapshot.error}');
                                    switch (snapshot.connectionState) {
                                      case ConnectionState.waiting:
                                        return new Text('Loading...');
                                      default:
                                        return new Column(
                                          children: snapshot.data!.docs
                                              .map((DocumentSnapshot document) {
                                            return Column(
                                              children: [
                                                document['photoUrl'] == null
                                                    ? const CircleAvatar(
                                                        radius: 50,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        backgroundImage: AssetImage(
                                                            'assets/image/peson1.png'),
                                                      )
                                                    : CircleAvatar(
                                                        radius: 50,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        backgroundImage:
                                                            NetworkImage(
                                                                document[
                                                                    'photoUrl']),
                                                      ),
                                                SizedBox(height: 30.h),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      document['userName'] ??
                                                          'Adam Aslam',
                                                      style:
                                                          GoogleFonts.manrope(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 20.h),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                            document[
                                                                    'profession'] ??
                                                                'userProfession',
                                                            style: GoogleFonts.manrope(
                                                                color:
                                                                    kGreenColor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .location_on_outlined,
                                                          color: kGrayColor,
                                                          size: 15,
                                                        ),
                                                        Text(
                                                          document['address'] ??
                                                              'Lahore',
                                                          style: GoogleFonts
                                                              .manrope(
                                                                  color:
                                                                      kGrayColor),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 20.h),

                                                ///contact details
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (_) =>
                                                                    EditProfileStore()));
                                                      },
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.065,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: kGreenColor,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Icon(
                                                              Icons.edit,
                                                              color: kWhite,
                                                            ),
                                                            Text(
                                                              'Edit Profile',
                                                              style: GoogleFonts.manrope(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      18.sp,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        ///Store Whatsapp Number
                                                        print(
                                                            'working whatsapp button');

                                                        lunchWhatsapp() async {
                                                          // ${SharedPref.sharedPreferences.getString(SharedPref.storeWhatsapp)}
                                                          String url =
                                                              "whatsapp://send?phone=+923017999835&text=Hello";
                                                          await canLaunch(url)
                                                              ? launch(url)
                                                              : print(
                                                                  "Can't Open Whatssapp");
                                                        }

                                                        lunchWhatsapp();
                                                      },
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.065,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: kGreenColor,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Image(
                                                                image: AssetImage(
                                                                    "assets/whatsapp_ic.png")),
                                                            Text(
                                                              'WhatsApp',
                                                              style: GoogleFonts.manrope(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      18.sp,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.02,
                                                ),
                                              ],
                                            );
                                          }).toList(),
                                        );
                                    }
                                  }),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    'Ads',
                    style: GoogleFonts.manrope(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                      color: kSecondaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height - 400,
                      // width: MediaQuery.of(context).size.width,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('ads')
                            // .where('category',
                            //     isEqualTo: _selectedCategory)
                            .where('uid',
                                isEqualTo:
                                    FirebaseAuth.instance.currentUser!.uid)
                            .snapshots(),
                        builder: (context, dataSnapShot) {
                          if (!dataSnapShot.hasData) {
                            return Center(
                              child: Column(
                                children: [
                                  Text(
                                    'No Ads found',
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff000000),
                                      // height: 22.h
                                    ),
                                  ),
                                ],
                              ), //No data Found
                            );
                          }

                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              DocumentSnapshot ds =
                                  dataSnapShot.data!.docs[index];
                              // List<dynamic> image = ds.get('image');
                              return Column(
                                children: [
                                  EditadTile(
                                      () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    AdDetails(ds, false)));
                                      },
                                      ds.get('title'),
                                      ds.get('location'),
                                      '\$ ${ds.get('price')}',
                                      kWhite,
                                      kPrimaryColor,
                                      kSupportiveGrey,
                                      kSecondaryColor,
                                      () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => EditAdPost()));
                                      },
                                      ds.get('image')),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              );
                            },
                            itemCount: dataSnapShot.data!.docs.length,
                          );
                        },
                      )),
                  SizedBox(
                    height: 100.h,
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Are you sure',
              // textAlign: TextAlign.right,
              style: GoogleFonts.manrope(fontWeight: FontWeight.bold),
            ), //Are you sure?
            content: const Text(
              'Do you want to leave the app',
              // textAlign: TextAlign.right
            ), //Do you want to exit an App
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(false),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 40.0,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.orange),
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.orange),
                      child: Center(
                        child: Text(
                          'No',
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ), //NO
                  ),
                  // SizedBox(
                  //   width: 25.0,
                  // ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(true),
                    child: Container(
                      height: 40.0,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.red),
                      child: Center(
                        child: Text(
                          'Yes',
                          style: GoogleFonts.manrope(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ), //YES
                  ),
                ],
              )
            ],
          ),
        ) ??
        false;
  }
}
