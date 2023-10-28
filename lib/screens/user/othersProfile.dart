// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growit/widgets/showToast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constant.dart';
import '../../widgets/adTile.dart';
import '../user/adDetails.dart';
import 'messageScreen.dart';

class OtherProfileStoreView extends StatefulWidget {
  DocumentSnapshot ds;
  bool isAdmin;
  OtherProfileStoreView(this.ds, this.isAdmin);
  @override
  _OtherProfileStoreViewState createState() => _OtherProfileStoreViewState();
}

class _OtherProfileStoreViewState extends State<OtherProfileStoreView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('widget.ds.id');
    print(widget.ds.id);
  }

  // int index = 1;
  var muUserName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
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
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                widget.isAdmin
                    ? SizedBox()
                    : StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('userInfo')
                            .where('uid',
                                isEqualTo:
                                    FirebaseAuth.instance.currentUser!.uid)
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError)
                            return new Text('Error: ${snapshot.error}');
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return new Text('Loading...');
                            default:
                              return new Column(
                                children: snapshot.data!.docs
                                    .map((DocumentSnapshot document) {
                                  muUserName = document['userName'];
                                  return SizedBox();
                                }).toList(),
                              );
                          }
                        }),
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
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // GestureDetector(
                                  //   onTap: () {
                                  //     // Navigator.pushAndRemoveUntil(
                                  //     //     context,
                                  //     //     MaterialPageRoute(
                                  //     //         builder: (_) =>
                                  //     //             EditProfileUser(widget.uid)),
                                  //     //     (route) => false);
                                  //     Navigator.push(
                                  //         context,
                                  //         MaterialPageRoute(
                                  //             builder: (_) =>
                                  //                 EditProfileUser(widget.uid)));
                                  //   },
                                  //   child: Image(
                                  //       image: AssetImage(
                                  //           "assets/edit_profile.png")),
                                  // ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
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
                            child: Column(
                              children: [
                                widget.ds['photoUrl'] == null
                                    ? CircleAvatar(
                                        radius: 50,
                                        backgroundImage: AssetImage(
                                            'assets/image/peson1.png'),
                                      )
                                    : CircleAvatar(
                                        radius: 50,
                                        backgroundImage:
                                            NetworkImage(widget.ds['photoUrl']),
                                      ),
                                SizedBox(height: 30.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.ds['userName'],
                                      style: GoogleFonts.manrope(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            widget.ds['profession'] ??
                                                'Profession',
                                            style: GoogleFonts.manrope(
                                                color: kGreenColor,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          color: kGrayColor,
                                          size: 15,
                                        ),
                                        Text(
                                          widget.ds['address'] ?? 'Address',
                                          style: GoogleFonts.manrope(
                                              color: kGrayColor),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),

                                ///contact details
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    widget.isAdmin == true
                                        ? GestureDetector(
                                            onTap: () {
                                              ///delete user
                                              FirebaseFirestore.instance
                                                  .collection('userInfo')
                                                  .doc(widget.ds.id)
                                                  .delete()
                                                  .whenComplete(() {
                                                showToastShort(
                                                    'Account Removed Successfully',
                                                    kPrimaryColor);
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.065,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: kPrimaryColor,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Icon(
                                                    Icons.delete,
                                                    color: kWhite,
                                                  ),
                                                  Text(
                                                    'Remove Store',
                                                    style: GoogleFonts.manrope(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 18.sp,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          MessageScreen(
                                                              widget.ds.get(
                                                                  'photoUrl'),
                                                              widget.ds
                                                                  .get('uid'),
                                                              widget.ds.get(
                                                                  'userName'),
                                                              muUserName)));
                                            },
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.065,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: kPrimaryColor,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Icon(
                                                    Icons.chat,
                                                    color: kWhite,
                                                  ),
                                                  Text(
                                                    'Message',
                                                    style: GoogleFonts.manrope(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 18.sp,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                    GestureDetector(
                                      onTap: () {
                                        ///Store Whatsapp Number
                                        print('working whatsapp button');

                                        lunchWhatsapp() async {
                                          // ${SharedPref.sharedPreferences.getString(SharedPref.storeWhatsapp)}
                                          String url =
                                              "whatsapp://send?phone=${widget.ds.get('whatsapp')}&text=Hello";
                                          await canLaunch(url)
                                              ? launch(url)
                                              : showToastShort(
                                                  "Can't Open Whatssapp",
                                                  kRedColor);
                                        }

                                        lunchWhatsapp();
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.065,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: kGreenColor,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Image(
                                                image: AssetImage(
                                                    "assets/whatsapp_ic.png")),
                                            Text(
                                              'WhatsApp',
                                              style: GoogleFonts.manrope(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18.sp,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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
                    height: MediaQuery.of(context).size.height - 500,
                    // width: MediaQuery.of(context).size.width,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('ads')
                          // .where('category',
                          //     isEqualTo: _selectedCategory)
                          .where('uid', isEqualTo: widget.ds['uid'])
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
                            return Column(
                              children: [
                                adTile(() {
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
