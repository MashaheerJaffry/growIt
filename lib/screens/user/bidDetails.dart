// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growit/constant.dart';

import '../../widgets/showToast.dart';
import 'bidNow.dart';

// import 'constants.dart';
// import 'imagePreview.dart';
// import 'models/commentModel.dart';
// import 'models/sharedPreferences.dart';
//
//ignore: must_be_immutable
class BidDetails extends StatefulWidget {
  DocumentSnapshot ds;
  bool isAdmin;
  BidDetails(this.ds, this.isAdmin);

  // var ds;
  // bool isGuest;
  //
  // AdDetails(this.ds, this.isGuest);

  @override
  _BidDetailsState createState() => _BidDetailsState();
}

class _BidDetailsState extends State<BidDetails> {
  @override
  Widget build(BuildContext context) {
    var dateTime = DateTime.now().toString();
    return Scaffold(
      extendBody: true,
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: kWhite,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: kSecondaryColor,
            ),
            // Within the `FirstRoute` widget
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'Bid Details',
          style: kAppbarStyle.copyWith(color: kSecondaryColor),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Image.network(widget.ds['image'],
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                    height: 250),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.37,
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.ds['title'],
                                    style: GoogleFonts.manrope(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.w800,
                                        color: kPrimaryColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        ///location
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: kSupportiveGrey.withOpacity(0.5),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              widget.ds['location'],
                              style: GoogleFonts.manrope(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: kSupportiveGrey.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),

                        ///price and user
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.person, color: kGreenColor),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    StreamBuilder<QuerySnapshot>(
                                        stream: FirebaseFirestore.instance
                                            .collection('userInfo')
                                            .where('uid',
                                                isEqualTo: widget.ds['uid'])
                                            .snapshots(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<QuerySnapshot>
                                                snapshot) {
                                          if (snapshot.hasError)
                                            return Text("");
                                          switch (snapshot.connectionState) {
                                            case ConnectionState.waiting:
                                              return Text('');
                                            default:
                                              return new Column(
                                                children: snapshot.data!.docs
                                                    .map((DocumentSnapshot
                                                        document) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      // Navigator.push(
                                                      //     context,
                                                      //     MaterialPageRoute(
                                                      //         builder: (_) =>
                                                      //             OtherProfile(
                                                      //                 document)));
                                                    },
                                                    child: Text(
                                                      document['userName'],
                                                      style:
                                                          GoogleFonts.manrope(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: kGreenColor,
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              );
                                          }
                                        }),
                                  ],
                                ),
                              ),
                              Text(
                                '\$ ${widget.ds['price']}',
                                style: GoogleFonts.manrope(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),

                        ///message and whatsapp
                        widget.isAdmin
                            ? Center(
                                child: GestureDetector(
                                  onTap: () {
                                    FirebaseFirestore.instance
                                        .collection('bids')
                                        .doc(widget.ds.id)
                                        .delete()
                                        .whenComplete(() {
                                      showToastShort('Bid Removed Successfully',
                                          kPrimaryColor);
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    height: MediaQuery.of(context).size.height *
                                        0.065,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: kPrimaryColor,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Remove Bid',
                                          style: GoogleFonts.manrope(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18.sp,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                    GestureDetector(
                                      onTap: () {
                                        ///Store Contact Number
                                        // launch(
                                        //     "tel://${widget.workerAdModel.adNumber}");
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    BidNow(widget.ds['ds'])));
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
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/biddW.png',
                                              scale: 2.5,
                                            ),
                                            // SizedBox(
                                            //   width: 5.w,
                                            // ),
                                            Text(
                                              'Bid Now',
                                              style: GoogleFonts.manrope(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20.sp,
                                                color: kWhite,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.065,
                                        decoration: BoxDecoration(
                                          color: Color(0xfff8f8f8),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.report),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Text(
                                              'Report',
                                              style: GoogleFonts.manrope(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 20.sp,
                                                  color: kPrimaryColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Description', //Description
                        style: GoogleFonts.manrope(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: kSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.25,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.ds['description'],
                        style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                            color: kSupportiveGrey.withOpacity(0.6)),
                        // textAlign: TextAlign.right,
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Requested Bids', //Description
                        style: GoogleFonts.manrope(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: kSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('bids')
                        .doc(widget.ds['ds'])
                        .collection('replies')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) return Text("");
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Text('');
                        default:
                          return new Column(
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              // var username = getProfile(document['replyByUid']);
                              // print('username in stream');
                              // print(username);
                              // FirebaseFirestore.instance
                              //     .collection('userInfo')
                              //     .doc(document['replyByUid'])
                              //     .get()
                              //     .then((value) {
                              //   username = value.get('userName');
                              //   print('username');
                              //   print(username);
                              // });
                              // var user = getProfile(document['replyByUid']);
                              // print('bidd user');
                              // print(user.toString());
                              return Column(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: MediaQuery.of(context).size.height *
                                        0.39,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 15.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {},
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    CircleAvatar(
                                                        backgroundColor:
                                                            kGreenColor,
                                                        child: Icon(
                                                            Icons.person,
                                                            color: kWhite)),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'username',
                                                          style: GoogleFonts
                                                              .manrope(
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: kGreenColor,
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .location_on_outlined,
                                                              size: 15,
                                                              color: kSupportiveGrey
                                                                  .withOpacity(
                                                                      0.5),
                                                            ),
                                                            // SizedBox(
                                                            //   width: 5.w,
                                                            // ),
                                                            Text(
                                                              document[
                                                                  'location'],
                                                              style: GoogleFonts
                                                                  .manrope(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                color: kSupportiveGrey
                                                                    .withOpacity(
                                                                        0.5),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                '\$ ${document['expectedPrice']}.00',
                                                style: GoogleFonts.manrope(
                                                  fontSize: 20.sp,
                                                  fontWeight: FontWeight.w700,
                                                  color: kPrimaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.25,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                            color: kSupportiveGrey
                                                .withOpacity(0.2),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0)),
                                          ),
                                          child: Text(
                                            '\n${document['productDescription']}',
                                            style: GoogleFonts.manrope(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.sp,
                                                color: Colors.black
                                                    .withOpacity(0.5)),
                                            // textAlign: TextAlign.right,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                ],
                              );
                            }).toList(),
                          );
                      }
                    }),
                SizedBox(
                  height: 200.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getProfile(var uid) {
    var username;
    FirebaseFirestore.instance
        .collection('userInfo')
        .doc(uid)
        .get()
        .then((value) {
      username = value.get('userName');
      print('username');
      print(username);
      return username;
    });
    return username;
  }

  ///
  // Widget likeButton(event) => Row(
  //       children: [
  //         LikeButton(
  //           onTap: (bool isLiked) async {
  //             // print('isLiked');
  //             // print(isLiked);
  //             // print(isLiked);
  //             // print(isLiked);
  //             // if (!isLiked) {
  //             //   if (adBy != FirebaseAuth.instance.currentUser.uid.toString()) {
  //             //     print(
  //             //         'adBy != FirebaseAuth.instance.currentUser.uid.toString()');
  //             //     if (widget.isGuest == false) {
  //             //       print('widget.isGuest == false');
  //             //       print('widget.isGuest == false');
  //             //       print('widget.isGuest == false');
  //             //       await FirebaseFirestore.instance
  //             //           .collection('Ads')
  //             //           .doc(widget.ds)
  //             //           .update({
  //             //         'likeCollection': FieldValue.arrayUnion(
  //             //             [FirebaseAuth.instance.currentUser.uid]),
  //             //         'likes': adLikes + 1,
  //             //       });
  //             //     } else {
  //             //       showToastShort('يرجى تسجيل الدخول اولا ', kRedColor);
  //             //     }
  //             //
  //             //     print('Like working');
  //             //     print('adBy');
  //             //     print(adBy);
  //             //     print(adBy);
  //             //     print(adBy);
  //             //     // print('FirebaseAuth.instance.currentUser.uid');
  //             //     // print(FirebaseAuth.instance.currentUser.uid);
  //             //     // print(FirebaseAuth.instance.currentUser.uid);
  //             //   } else {
  //             //     showToastShort('لا يمكنك الاعجاب بهذا الإعلان', kRedColor);
  //             //   }
  //             // } else {
  //             //   if (adBy != FirebaseAuth.instance.currentUser.uid.toString()) {
  //             //     print(
  //             //         'adBy != FirebaseAuth.instance.currentUser.uid.toString()');
  //             //     if (widget.isGuest == false) {
  //             //       print('widget.isGuest == false');
  //             //       print('widget.isGuest == false');
  //             //       print('widget.isGuest == false');
  //             //       await FirebaseFirestore.instance
  //             //           .collection('Ads')
  //             //           .doc(widget.ds)
  //             //           .update({
  //             //         'likeCollection': FieldValue.arrayUnion(
  //             //             [FirebaseAuth.instance.currentUser.uid]),
  //             //         'likes': adLikes - 1,
  //             //       });
  //             //     } else {
  //             //       showToastShort('يرجى تسجيل الدخول اولا ', kRedColor);
  //             //     }
  //             //
  //             //     print('Like working');
  //             //     print('adBy');
  //             //     print(adBy);
  //             //     print(adBy);
  //             //     print(adBy);
  //             //     // print('FirebaseAuth.instance.currentUser.uid');
  //             //     // print(FirebaseAuth.instance.currentUser.uid);
  //             //     // print(FirebaseAuth.instance.currentUser.uid);
  //             //   } else {
  //             //     showToastShort('لا يمكنك الاعجاب بهذا الإعلان', kRedColor);
  //             //   }
  //             // }
  //             return !isLiked;
  //           },
  //           bubblesSize: 100.0,
  //           likeBuilder: (bool isLiked) {
  //             // ignore: deprecated_member_use
  //             return Icon(
  //               Icons.thumb_up,
  //               color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
  //               size: 20.0,
  //             );
  //           },
  //           likeCount: 3,
  //         ),
  //       ],
  //     );
  // Widget disLikeButton(event) => Row(
  //       children: [
  //         LikeButton(
  //           onTap: (bool isDisLiked) async {
  //             // print('isLiked');
  //             // print(isLiked);
  //             // print(isLiked);
  //             // print(isLiked);
  //             // if (!isDisLiked) {
  //             //   if (adBy != FirebaseAuth.instance.currentUser.uid.toString()) {
  //             //     print(
  //             //         'adBy != FirebaseAuth.instance.currentUser.uid.toString()');
  //             //     if (widget.isGuest == false) {
  //             //       print('widget.isGuest == false');
  //             //       print('widget.isGuest == false');
  //             //       print('widget.isGuest == false');
  //             //       await FirebaseFirestore.instance
  //             //           .collection('Ads')
  //             //           .doc(widget.ds)
  //             //           .update({
  //             //         'disLikeCollection': FieldValue.arrayUnion(
  //             //             [FirebaseAuth.instance.currentUser.uid]),
  //             //         'disLikes': adDisLikes + 1,
  //             //       });
  //             //     } else {
  //             //       showToastShort('يرجى تسجيل الدخول اولا ', kRedColor);
  //             //     }
  //             //
  //             //     print('Like working');
  //             //     print('adBy');
  //             //     print(adBy);
  //             //     print(adBy);
  //             //     print(adBy);
  //             //     print('FirebaseAuth.instance.currentUser.uid');
  //             //     print(FirebaseAuth.instance.currentUser.uid);
  //             //     print(FirebaseAuth.instance.currentUser.uid);
  //             //   } else {
  //             //     showToastShort('لا يمكنك الاعجاب بهذا الإعلان', kRedColor);
  //             //   }
  //             // } else {
  //             //   if (adBy != FirebaseAuth.instance.currentUser.uid.toString()) {
  //             //     print(
  //             //         'adBy != FirebaseAuth.instance.currentUser.uid.toString()');
  //             //     if (widget.isGuest == false) {
  //             //       print('widget.isGuest == false');
  //             //       print('widget.isGuest == false');
  //             //       print('widget.isGuest == false');
  //             //       await FirebaseFirestore.instance
  //             //           .collection('Ads')
  //             //           .doc(widget.ds)
  //             //           .update({
  //             //         'disLikeCollection': FieldValue.arrayUnion(
  //             //             [FirebaseAuth.instance.currentUser.uid]),
  //             //         'disLikes': adDisLikes - 1,
  //             //       });
  //             //     } else {
  //             //       showToastShort('يرجى تسجيل الدخول اولا ', kRedColor);
  //             //     }
  //             //
  //             //     print('Like working');
  //             //     print('adBy');
  //             //     print(adBy);
  //             //     print(adBy);
  //             //     print(adBy);
  //             //     // print('FirebaseAuth.instance.currentUser.uid');
  //             //     // print(FirebaseAuth.instance.currentUser.uid);
  //             //     // print(FirebaseAuth.instance.currentUser.uid);
  //             //   } else {
  //             //     showToastShort('لا يمكنك الاعجاب بهذا الإعلان', kRedColor);
  //             //   }
  //             // }
  //             return !isDisLiked;
  //           },
  //           bubblesSize: 100.0,
  //           likeBuilder: (bool isDisLiked) {
  //             return Icon(
  //               Icons.thumb_down,
  //               color: isDisLiked ? Colors.deepPurpleAccent : Colors.grey,
  //               size: 20.0,
  //             );
  //           },
  //           likeCount: 1,
  //         ),
  //       ],
  //     );
  //
  // Widget storeAdDisLikeButton10() => Row(
  //       children: [
  //         LikeButton(
  //           bubblesSize: 100.0,
  //           likeBuilder: (bool isDisLiked) {
  //             return Icon(
  //               Icons.thumb_up,
  //               color: Colors.deepPurpleAccent,
  //               size: 20.0,
  //             );
  //           },
  //         ),
  //       ],
  //     );
}
