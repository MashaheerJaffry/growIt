import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growit/screens/admin/bidViewAdmin.dart';
import 'package:growit/screens/admin/storesAdminScreen.dart';
import 'package:growit/screens/admin/userViewAdmin.dart';
import 'package:growit/screens/serviceSelection.dart';

import '../../constant.dart';
import 'adViewAdmin.dart';
import 'complainBoxAdmin.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  var stores = '0';
  var worker = '0';
  var freeAds = '0';
  var transport = '0';
  var complain = '0';
  // ignore: non_constant_identifier_names
  var Marketer = '0';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        key: _scaffold,
        backgroundColor: kBackgroundColor,
        // drawer: Drawer(
        //   child: Column(
        //     children: [
        //       Container(
        //         width: MediaQuery.of(context).size.width,
        //         height: MediaQuery.of(context).size.height * 0.35,
        //         color: kRedColor,
        //         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //           children: [
        //             // Row(
        //             //   mainAxisAlignment: MainAxisAlignment.end,
        //             //   children: [
        //             //     Icon(Icons.arrow_forward, color: Colors.white),
        //             //   ],
        //             // ),
        //             CircleAvatar(
        //               radius: 45,
        //               backgroundColor: Colors.transparent,
        //               backgroundImage: AssetImage("assets/admin_user_Ic.png"),
        //             ),
        //             Text(
        //               "ADMIN",
        //               style: GoogleFonts.manrope(
        //                 fontWeight: FontWeight.w700,
        //                 fontSize: 26.sp,
        //                 color: Colors.white,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       Container(
        //         width: MediaQuery.of(context).size.width,
        //         height: MediaQuery.of(context).size.height * 0.5,
        //         padding: EdgeInsets.symmetric(vertical: 15),
        //         child: Column(
        //           children: [
        //             // GestureDetector(
        //             //   onTap: () {
        //             //   },
        //             //   child: Container(
        //             //     width: MediaQuery.of(context).size.width,
        //             //     height: MediaQuery.of(context).size.height * 0.06,
        //             //     padding: EdgeInsets.symmetric(horizontal: 15),
        //             //     child: Row(
        //             //       mainAxisAlignment: MainAxisAlignment.start,
        //             //       children: [
        //             //         Icon(
        //             //           Icons.image,
        //             //           color: kGreenColor,
        //             //         ),
        //             //         SizedBox(width: 5),
        //             //         Text(
        //             //           "Change Testimonial", //Change Testimonials
        //             //           style: TextStyle(
        //             //               fontSize: 16, fontWeight: FontWeight.w600),
        //             //         ),
        //             //       ],
        //             //     ),
        //             //   ),
        //             // ),
        //             SizedBox(
        //               height: 15.0,
        //             ),
        //             GestureDetector(
        //               onTap: () {
        //
        //               },
        //               child: Container(
        //                 width: MediaQuery.of(context).size.width,
        //                 height: MediaQuery.of(context).size.height * 0.06,
        //                 padding: EdgeInsets.symmetric(horizontal: 15),
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.start,
        //                   children: [
        //                     Image(
        //                       image: AssetImage("assets/logout_ic.png"),
        //                       width: 30,
        //                       height: 30,
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //             SizedBox(
        //               height: 15.0,
        //             ),
        //           ],
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        appBar: AppBar(
          backgroundColor: kRedColor,
          title: Text(
            "Admin Dashboard",
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => WelcomeScreen()),
                      (route) => false);
                },
                icon: Icon(
                  Icons.login,
                  color: kWhite,
                ))
          ],
          centerTitle: true,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  children: [
                    ///stores
                    Expanded(
                      child: Container(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => StoreViewAdmin()));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.27,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                      AssetImage("assets/store_ic.png"),
                                ),
                                Text(
                                  "Stores",
                                  style: GoogleFonts.manrope(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                      color: kSupportiveGrey),
                                ), //Store
                                Spacer(),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                  decoration: BoxDecoration(
                                      color: Colors.green[300],
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      )),
                                  child: Center(
                                    child: StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance
                                          .collection('userInfo')
                                          .where('isStore', isEqualTo: true)
                                          .snapshots(),
                                      builder: (context, dataSnapShot) {
                                        return !dataSnapShot.hasData
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ), //No data Found
                                              )
                                            : StaggeredGridView.countBuilder(
                                                scrollDirection: Axis.vertical,
                                                shrinkWrap: true,
                                                physics:
                                                    const ScrollPhysics(), // new
                                                crossAxisCount: 1,
                                                staggeredTileBuilder: (c) =>
                                                    const StaggeredTile.fit(1),
                                                itemBuilder: (context, index) {
                                                  DocumentSnapshot ds =
                                                      dataSnapShot
                                                          .data!.docs[index];
                                                  return dataSnapShot
                                                          .data!.docs.isEmpty
                                                      ? Center(
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                'No Stores yet',
                                                                style: GoogleFonts
                                                                    .nunitoSans(
                                                                  fontSize:
                                                                      16.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Colors
                                                                      .white,
                                                                  // height: 22.h
                                                                ),
                                                              ),
                                                            ],
                                                          ), //No data Found
                                                        )
                                                      : Center(
                                                          child: Text(
                                                            dataSnapShot.data!
                                                                .docs.length
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 30,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        );
                                                },
                                                itemCount: 1,
                                              );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),

                    ///free ads
                    Expanded(
                      child: Container(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.27,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => AdViewAdmin()));
                            },
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                      AssetImage("assets/ad_ic.png"),
                                ),
                                Text(
                                  "Ads",
                                  style: GoogleFonts.manrope(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                      color: kSupportiveGrey),
                                ), //Free Ads
                                Spacer(),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                  decoration: BoxDecoration(
                                      color: Colors.pink[100],
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      )),
                                  child: Center(
                                    child: StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance
                                          .collection('ads')
                                          .snapshots(),
                                      builder: (context, dataSnapShot) {
                                        return !dataSnapShot.hasData
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ), //No data Found
                                              )
                                            : StaggeredGridView.countBuilder(
                                                scrollDirection: Axis.vertical,
                                                shrinkWrap: true,
                                                physics:
                                                    const ScrollPhysics(), // new
                                                crossAxisCount: 1,
                                                staggeredTileBuilder: (c) =>
                                                    const StaggeredTile.fit(1),
                                                itemBuilder: (context, index) {
                                                  DocumentSnapshot ds =
                                                      dataSnapShot
                                                          .data!.docs[index];
                                                  return dataSnapShot
                                                          .data!.docs.isEmpty
                                                      ? Center(
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                'No Stores yet',
                                                                style: GoogleFonts
                                                                    .nunitoSans(
                                                                  fontSize:
                                                                      16.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Colors
                                                                      .white,
                                                                  // height: 22.h
                                                                ),
                                                              ),
                                                            ],
                                                          ), //No data Found
                                                        )
                                                      : Center(
                                                          child: Text(
                                                            dataSnapShot.data!
                                                                .docs.length
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 30,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        );
                                                },
                                                itemCount: 1,
                                              );
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 50,
                  height: 10.0,
                ),
                Row(
                  children: [
                    ///Users
                    Expanded(
                      child: Container(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => UserViewAdmin()));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.27,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                      AssetImage("assets/worker_ic.png"),
                                ),
                                Text("User"), //Worker
                                Spacer(),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                  decoration: BoxDecoration(
                                      color: Colors.blue[300],
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      )),
                                  child: Center(
                                    child: StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance
                                          .collection('userInfo')
                                          .where('isStore', isEqualTo: false)
                                          .snapshots(),
                                      builder: (context, dataSnapShot) {
                                        return !dataSnapShot.hasData
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ), //No data Found
                                              )
                                            : StaggeredGridView.countBuilder(
                                                scrollDirection: Axis.vertical,
                                                shrinkWrap: true,
                                                physics:
                                                    const ScrollPhysics(), // new
                                                crossAxisCount: 1,
                                                staggeredTileBuilder: (c) =>
                                                    const StaggeredTile.fit(1),
                                                itemBuilder: (context, index) {
                                                  DocumentSnapshot ds =
                                                      dataSnapShot
                                                          .data!.docs[index];
                                                  return dataSnapShot
                                                          .data!.docs.isEmpty
                                                      ? Center(
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                'No Stores yet',
                                                                style: GoogleFonts
                                                                    .nunitoSans(
                                                                  fontSize:
                                                                      16.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Colors
                                                                      .white,
                                                                  // height: 22.h
                                                                ),
                                                              ),
                                                            ],
                                                          ), //No data Found
                                                        )
                                                      : Center(
                                                          child: Text(
                                                            dataSnapShot.data!
                                                                .docs.length
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 30,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        );
                                                },
                                                itemCount: 1,
                                              );
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => BidViewAdmin()));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.27,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                      AssetImage("assets/truck_ic.png"),
                                ),
                                Text(
                                  "Bids",
                                  style: GoogleFonts.manrope(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                      color: kSupportiveGrey),
                                ), //Transport
                                Spacer(),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                  decoration: BoxDecoration(
                                      color: Color(0xffb19cd9),
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      )),
                                  child: Center(
                                    child: StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance
                                          .collection('bids')
                                          .snapshots(),
                                      builder: (context, dataSnapShot) {
                                        return !dataSnapShot.hasData
                                            ? const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ), //No data Found
                                              )
                                            : StaggeredGridView.countBuilder(
                                                scrollDirection: Axis.vertical,
                                                shrinkWrap: true,
                                                physics:
                                                    const ScrollPhysics(), // new
                                                crossAxisCount: 1,
                                                staggeredTileBuilder: (c) =>
                                                    const StaggeredTile.fit(1),
                                                itemBuilder: (context, index) {
                                                  DocumentSnapshot ds =
                                                      dataSnapShot
                                                          .data!.docs[index];
                                                  return dataSnapShot
                                                          .data!.docs.isEmpty
                                                      ? Center(
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                'No Bids yet',
                                                                style: GoogleFonts
                                                                    .nunitoSans(
                                                                  fontSize:
                                                                      16.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Colors
                                                                      .white,
                                                                  // height: 22.h
                                                                ),
                                                              ),
                                                            ],
                                                          ), //No data Found
                                                        )
                                                      : Center(
                                                          child: Text(
                                                            dataSnapShot.data!
                                                                .docs.length
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 30,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        );
                                                },
                                                itemCount: 1,
                                              );
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    ///complains
                    Expanded(
                      child: Container(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ComplainViewAdmin()));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.27,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.error,
                                    size: 75.0,
                                    color: Colors.redAccent,
                                  ),
                                ),
                                Text(
                                  "Complains",
                                  style: GoogleFonts.manrope(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                      color: kSupportiveGrey),
                                ), //Complains
                                Spacer(),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                  decoration: BoxDecoration(
                                      color: Color(0xffe76f51),
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      )),
                                  child: Center(
                                    child: Text(
                                      complain,
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),

                    ///marketer
                    // Expanded(
                    //   child: Container(
                    //     child: GestureDetector(
                    //       onTap: () {
                    //         // Navigator.push(
                    //         //     context,
                    //         //     MaterialPageRoute(
                    //         //         builder: (_) =>
                    //         //             MarketerCollectionAdmin(
                    //         //                 'مسوقين')));
                    //       },
                    //       child: Container(
                    //         width: MediaQuery.of(context).size.width,
                    //         height: MediaQuery.of(context).size.height * 0.27,
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(20),
                    //           color: Colors.white,
                    //         ),
                    //         child: Column(
                    //           children: [
                    //             CircleAvatar(
                    //                 radius: 50,
                    //                 backgroundColor: Colors.white,
                    //                 child: Image(
                    //                   image: AssetImage(
                    //                       'assets/marketer_profile.jpeg'),
                    //                 )),
                    //             Text(
                    //               "Marketer",
                    //               style: GoogleFonts.manrope(
                    //                   fontSize: 18.sp,
                    //                   fontWeight: FontWeight.w600,
                    //                   color: kSupportiveGrey),
                    //             ), //Marketer
                    //             Spacer(),
                    //             Container(
                    //               width: MediaQuery.of(context).size.width,
                    //               height:
                    //                   MediaQuery.of(context).size.height * 0.08,
                    //               decoration: BoxDecoration(
                    //                   color: kGrayColor,
                    //                   borderRadius: BorderRadius.only(
                    //                     bottomRight: Radius.circular(20),
                    //                     bottomLeft: Radius.circular(20),
                    //                   )),
                    //               child: Center(
                    //                 child: Text(
                    //                   Marketer,
                    //                   style: TextStyle(
                    //                       fontSize: 30,
                    //                       fontWeight: FontWeight.bold,
                    //                       color: Colors.white),
                    //                 ),
                    //               ),
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Object _onBackPressed() {
  //   return showDialog(
  //         context: context,
  //         builder: (context) => new AlertDialog(
  //           title: new Text(
  //             'Are you sure?',
  //             textAlign: TextAlign.right,
  //             style: TextStyle(fontWeight: FontWeight.bold),
  //           ), //Are you sure?
  //           content: new Text('Do you want to exit an App',
  //               textAlign: TextAlign.right), //Do you want to exit an App
  //           actions: <Widget>[
  //             new GestureDetector(
  //               onTap: () => Navigator.of(context).pop(false),
  //               child: Text(
  //                 "No",
  //                 style: TextStyle(fontWeight: FontWeight.bold),
  //               ), //NO
  //             ),
  //             SizedBox(
  //               height: 16,
  //               width: 25.0,
  //             ),
  //             new GestureDetector(
  //               onTap: () => Navigator.of(context).pop(true),
  //               child: Text(
  //                 "Yes",
  //                 style:
  //                     TextStyle(fontWeight: FontWeight.bold, color: kRedColor),
  //               ), //YES
  //             ),
  //           ],
  //         ),
  //       ) ??
  //       false;
  // }
  Future<bool> _onBackPressed() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Are you sure',
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(fontWeight: FontWeight.bold),
            ), //Are you sure?
            content: const Text('Do you want to leave the app',
                textAlign: TextAlign.center), //Do you want to exit an App
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
                          border: Border.all(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(15.0),
                          color: kPrimaryColor),
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
