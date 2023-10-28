// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growit/constant.dart';
import 'package:growit/screens/user/othersProfile.dart';
import 'package:growit/screens/user/userComplain.dart';
import 'package:growit/widgets/showToast.dart';
import 'package:like_button/like_button.dart';

//ignore: must_be_immutable
class AdDetails extends StatefulWidget {
  DocumentSnapshot ds;
  bool isAdmin;
  //
  AdDetails(this.ds, this.isAdmin);

  @override
  _AdDetailsState createState() => _AdDetailsState();
}

class _AdDetailsState extends State<AdDetails> {
  int _current = 0;
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  bool isLiked = false;
  bool isDisLiked = false;
  bool alreadyLiked = false;
  bool alreadyDisLiked = false;
  bool switchValue = false;
  // int adLikes;
  // var uidd;
  // bool tryy;
  // int adDisLikes;
  // bool isStore;
  bool isComment = false;
  // bool isStoree;
  // bool isStoreFromfirestoreComment;
  var comentorName, comentorImage;
  TextEditingController commentController = TextEditingController();
  var adBy;
  // ignore: non_constant_identifier_names, deprecated_member_use
  List<String> LikeList = [];
  List<String> disLikeList = [];
  dynamic test = [];
  var carouselData = [
    "assets/ad_main_img.png",
    "assets/ad_main_img.png",
  ];
  // IconData iconLike = Icons.favorite_border;
  bool isLike = false;

  @override
  Widget build(BuildContext context) {
    // var myUid = FirebaseAuth.instance.currentUser!.uid;
    var byAdUid = widget.ds['uid'];
    return Scaffold(
      backgroundColor: kBackgroundColor,
      // bottomSheet: Container(
      //   padding: EdgeInsets.symmetric(horizontal: 8),
      //   height: 70,
      //   color: Colors.white,
      //   child: Row(
      //     children: <Widget>[
      //       SizedBox(
      //         width: 15.0,
      //       ),
      //       Expanded(
      //         child: TextField(
      //           controller: commentController,
      //           textDirection: TextDirection.rtl,
      //           decoration: InputDecoration.collapsed(
      //             hintText: 'Write Comment!',
      //             //Comment Here..
      //             // hintTextDirection: TextDirection.rtl
      //           ),
      //           textCapitalization: TextCapitalization.sentences,
      //         ),
      //       ),
      //       IconButton(
      //           icon: Icon(Icons.send),
      //           iconSize: 25,
      //           color: Theme.of(context).primaryColor,
      //           onPressed: () {}),
      //     ],
      //   ),
      // ),
      // backgroundColor: kBG,
      extendBody: true,
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
          'Ad Details',
          style: kAppbarStyle.copyWith(color: kSecondaryColor),
        ),
        // actions: [
        //   IconButton(
        //       icon: const Icon(
        //         Icons.share,
        //         color: kSecondaryColor,
        //       ),
        //       // Within the `FirstRoute` widget
        //       onPressed: () {
        //         Navigator.pop(context);
        //       }),
        // ],
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
                Image.network(widget.ds.get('image'),
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                    height: 300),
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
                        ///crousel
                        // CarouselSlider(
                        //   items: imageSliders,
                        //   carouselController: _controller,
                        //   options: CarouselOptions(
                        //       autoPlay: false,
                        //       enlargeCenterPage: false,
                        //       aspectRatio: 2.0,
                        //       onPageChanged: (index, reason) {
                        //         setState(() {
                        //           _current = index;
                        //         });
                        //       }),
                        // ),
                        // SizedBox(
                        //   height: 10.h,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: imgList.asMap().entries.map((entry) {
                        //     return GestureDetector(
                        //       onTap: () => _controller.animateToPage(entry.key),
                        //       child: Container(
                        //         width: 8.0,
                        //         height: 8.0,
                        //         margin: const EdgeInsets.symmetric(
                        //             vertical: 8.0, horizontal: 4.0),
                        //         decoration: BoxDecoration(
                        //             shape: BoxShape.circle,
                        //             color: (Theme.of(context).brightness ==
                        //                         Brightness.dark
                        //                     ? Color(0xffc4c4c4)
                        //                     : kPrimaryColor)
                        //                 .withOpacity(
                        //                     _current == entry.key ? 0.9 : 0.2)),
                        //       ),
                        //     );
                        //   }).toList(),
                        // ),
                        ///
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Text(
//                               'White Flowers',
//                               style: GoogleFonts.manrope(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w800,
//                                   color: kSecondaryColor),
//                             ),
//                             IconButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     iconLike = Icons.favorite;
//                                   });
//                                 },
//                                 icon: Icon(iconLike))
//                           ],
//                         ),
                        ///title and like
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.ds.get('title'),
                                    style: GoogleFonts.manrope(
                                        fontSize: 22.sp,
                                        fontWeight: FontWeight.w800,
                                        color: kSecondaryColor),
                                  ),
                                ],
                              ),
                              isLike
                                  ? IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isLike = false;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.favorite,
                                        color: kPrimaryColor,
                                      ))
                                  : IconButton(
                                      onPressed: () {
                                        if (widget.isAdmin == false) {
                                          if (byAdUid ==
                                              FirebaseAuth
                                                  .instance.currentUser!.uid) {
                                            showToastShort(
                                                'You don\'t like your own ad',
                                                kRed);
                                          } else {
                                            setState(() {
                                              isLike = true;
                                            });
                                          }
                                        }
                                      },
                                      icon: Icon(Icons.favorite_border))
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
                              widget.ds.get('location'),
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
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (_) =>
                                  //             UserProfilePreview(
                                  //                 adBy,
                                  //                 widget
                                  //                     .isGuest)));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.person, color: kGreenColor),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    // SizedBox(
                                    //     width: 5,
                                    //     // height:15,
                                    //     // width: MediaQuery.of(context).size.width,
                                    //     child: StreamBuilder<QuerySnapshot>(
                                    //       stream: FirebaseFirestore.instance
                                    //           .collection('userInfo')
                                    //           .where('uid',
                                    //               isEqualTo: widget.ds['uid'])
                                    //           .snapshots(),
                                    //       builder: (context, dataSnapShot) {
                                    //         if (!dataSnapShot.hasData) {
                                    //           return Center(
                                    //             child: Column(
                                    //               children: [
                                    //                 Text(
                                    //                   'No User found',
                                    //                   style: GoogleFonts
                                    //                       .nunitoSans(
                                    //                     fontSize: 16.sp,
                                    //                     fontWeight:
                                    //                         FontWeight.w600,
                                    //                     color: const Color(
                                    //                         0xff000000),
                                    //                     // height: 22.h
                                    //                   ),
                                    //                 ),
                                    //               ],
                                    //             ), //No data Found
                                    //           );
                                    //         }
                                    //
                                    //         return ListView.builder(
                                    //           scrollDirection: Axis.horizontal,
                                    //           shrinkWrap: true,
                                    //           physics:
                                    //               const BouncingScrollPhysics(),
                                    //           itemBuilder: (context, index) {
                                    //             DocumentSnapshot ds =
                                    //                 dataSnapShot
                                    //                     .data!.docs[index];
                                    //             // List<dynamic> image = ds.get('image');
                                    //             return Text(
                                    //               ds.get('userName'),
                                    //               style: GoogleFonts.manrope(
                                    //                 fontSize: 14,
                                    //                 fontWeight: FontWeight.w500,
                                    //                 color: kGreenColor,
                                    //               ),
                                    //             );
                                    //           },
                                    //           itemCount: 1,
                                    //         );
                                    //       },
                                    //     ),
                                    // ),
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
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (_) =>
                                                                  OtherProfileStoreView(
                                                                      document,
                                                                      false)));
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
                                '\$ ${widget.ds.get('price')}',
                                style: GoogleFonts.manrope(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // Container(
                        //     padding: EdgeInsets.symmetric(
                        //         horizontal: 10.0, vertical: 10.0),
                        //     width: MediaQuery.of(context).size.width * 0.9,
                        //     height: MediaQuery.of(context).size.height * 0.07,
                        //     decoration: BoxDecoration(
                        //       color: Color(0xfff8f8f8),
                        //       borderRadius: BorderRadius.circular(10),
                        //     ),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //       crossAxisAlignment: CrossAxisAlignment.center,
                        //       children: [
                        //         Row(
                        //           children: [
                        //             Image(
                        //                 image:
                        //                     AssetImage("assets/ad_date.png")),
                        //             SizedBox(
                        //                 width:
                        //                     MediaQuery.of(context).size.width *
                        //                         0.01),
                        //             Text(
                        //               '2021',
                        //               style: GoogleFonts.manrope(
                        //                   color: Colors.grey,
                        //                   fontSize: 16,
                        //                   fontWeight: FontWeight.w600),
                        //             ),
                        //           ],                        //         ),
                        //       ],
                        //     )),
                        SizedBox(
                          height: 15.h,
                        ),

                        ///message and whatsapp
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              widget.isAdmin == true
                                  ? GestureDetector(
                                      onTap: () {
                                        FirebaseFirestore.instance
                                            .collection('ads')
                                            .doc(widget.ds.id)
                                            .delete()
                                            .whenComplete(() {
                                          showToastShort(
                                              'Ad Removed Successfully',
                                              kPrimaryColor);
                                          Navigator.pop(context);
                                        });
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
                                          color: kPrimaryColor,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              Icons.delete,
                                              color: kWhite,
                                            ),
                                            Text(
                                              'Remove Ad',
                                              style: GoogleFonts.manrope(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18.sp,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height: MediaQuery.of(context).size.height *
                                      0.065,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: kGreenColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                          image: AssetImage(
                                              "assets/whatsapp_ic.png")),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        'WhatsApp',
                                        style: GoogleFonts.manrope(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20.sp,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                        SizedBox(
                          height: 5.0,
                        ),

                        ///report
                        Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 10.0),
                            width: MediaQuery.of(context).size.width * 0.85,
                            height: MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                              color: Color(0xfff8f8f8),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) => SingleChildScrollView(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        child: UserComplains(widget.ds.id),
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Report', //Report
                                  style: GoogleFonts.manrope(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
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
                        widget.ds.get('description'),
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
                // SizedBox(
                //   height: 20.0,
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(12.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Text(
                //         'Comments', //Description
                //         style: GoogleFonts.manrope(
                //           fontSize: 16.sp,
                //           fontWeight: FontWeight.w700,
                //           color: kSecondaryColor,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 20.0,
                // ),
                // SingleChildScrollView(
                //   physics: BouncingScrollPhysics(),
                //   child: Column(
                //     children: <Widget>[
                //       Container(
                //         padding: EdgeInsets.only(bottom: 90.0),
                //         child: Column(
                //           children: [
                //             Container(
                //               width: MediaQuery.of(context).size.width,
                //               height: MediaQuery.of(context).size.height * 0.20,
                //               padding: EdgeInsets.symmetric(
                //                   // horizontal: 0,
                //                   vertical: 10),
                //               margin: EdgeInsets.symmetric(
                //                   // horizontal: 0,
                //                   horizontal: 10),
                //               decoration: BoxDecoration(
                //                   color: Colors.white,
                //                   borderRadius: BorderRadius.only(
                //                       topLeft: Radius.circular(10.0),
                //                       topRight: Radius.circular(10.0))),
                //               child: Column(
                //                 children: [
                //                   Row(
                //                     mainAxisAlignment: MainAxisAlignment.end,
                //                     children: [
                //                       Column(
                //                         crossAxisAlignment:
                //                             CrossAxisAlignment.end,
                //                         children: [
                //                           GestureDetector(
                //                             onTap: () {
                //                               // commentModel
                //                               //     .isStoreComment
                //                               //     ? Navigator.push(
                //                               //     context,
                //                               //     MaterialPageRoute(
                //                               //         builder: (_) => StoreProfileComment(commentModel.commentBy, storeModel, widget.isGuest)))
                //                               //     : Navigator.push(context, MaterialPageRoute(builder: (_) => UserProfilePreview(commentModel.commentBy, widget.isGuest)));
                //                             },
                //                             child: Padding(
                //                               padding:
                //                                   const EdgeInsets.all(10.0),
                //                               child: Text(
                //                                 'Unknown User',
                //                                 style: GoogleFonts.manrope(
                //                                     fontSize: 16,
                //                                     fontWeight:
                //                                         FontWeight.w500),
                //                               ),
                //                             ),
                //                           ),
                //                           Padding(
                //                             padding:
                //                                 const EdgeInsets.only(right: 7),
                //                             child: Row(
                //                               children: [
                //                                 Text(
                //                                   '10:00 AM',
                //                                   style: GoogleFonts.manrope(
                //                                       color: Colors.grey),
                //                                 ),
                //                               ],
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                       GestureDetector(
                //                         onTap: () {},
                //                         child: Container(
                //                           width: MediaQuery.of(context)
                //                                   .size
                //                                   .width *
                //                               0.20,
                //                           height: MediaQuery.of(context)
                //                                   .size
                //                                   .height *
                //                               0.10,
                //                           decoration: BoxDecoration(
                //                             borderRadius:
                //                                 BorderRadius.circular(60.0),
                //                             color: Colors.black,
                //                           ),
                //                           child: Icon(Icons.account_circle),
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                   SizedBox(
                //                     height: 10.0,
                //                   ),
                //                   Padding(
                //                     padding: const EdgeInsets.symmetric(
                //                         horizontal: 10.0),
                //                     child: Row(
                //                       mainAxisAlignment: MainAxisAlignment.end,
                //                       children: [
                //                         Container(
                //                           child: Text(
                //                             'Hey There',
                //                             style: GoogleFonts.manrope(
                //                               fontSize: 18,
                //                               fontWeight: FontWeight.w500,
                //                               color: Colors.black,
                //                             ),
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //
                //             SizedBox(
                //                 height:
                //                     MediaQuery.of(context).size.height * 0.01),
                //             // _buildContainer(),
                //             // SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                //           ],
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
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

  Widget likeButton(event) => Row(
        children: [
          LikeButton(
            onTap: (bool isLiked) async {
              // print('isLiked');
              // print(isLiked);
              // print(isLiked);
              // print(isLiked);
              // if (!isLiked) {
              //   if (adBy != FirebaseAuth.instance.currentUser.uid.toString()) {
              //     print(
              //         'adBy != FirebaseAuth.instance.currentUser.uid.toString()');
              //     if (widget.isGuest == false) {
              //       print('widget.isGuest == false');
              //       print('widget.isGuest == false');
              //       print('widget.isGuest == false');
              //       await FirebaseFirestore.instance
              //           .collection('Ads')
              //           .doc(widget.ds)
              //           .update({
              //         'likeCollection': FieldValue.arrayUnion(
              //             [FirebaseAuth.instance.currentUser.uid]),
              //         'likes': adLikes + 1,
              //       });
              //     } else {
              //       showToastShort('يرجى تسجيل الدخول اولا ', kRedColor);
              //     }
              //
              //     print('Like working');
              //     print('adBy');
              //     print(adBy);
              //     print(adBy);
              //     print(adBy);
              //     // print('FirebaseAuth.instance.currentUser.uid');
              //     // print(FirebaseAuth.instance.currentUser.uid);
              //     // print(FirebaseAuth.instance.currentUser.uid);
              //   } else {
              //     showToastShort('لا يمكنك الاعجاب بهذا الإعلان', kRedColor);
              //   }
              // } else {
              //   if (adBy != FirebaseAuth.instance.currentUser.uid.toString()) {
              //     print(
              //         'adBy != FirebaseAuth.instance.currentUser.uid.toString()');
              //     if (widget.isGuest == false) {
              //       print('widget.isGuest == false');
              //       print('widget.isGuest == false');
              //       print('widget.isGuest == false');
              //       await FirebaseFirestore.instance
              //           .collection('Ads')
              //           .doc(widget.ds)
              //           .update({
              //         'likeCollection': FieldValue.arrayUnion(
              //             [FirebaseAuth.instance.currentUser.uid]),
              //         'likes': adLikes - 1,
              //       });
              //     } else {
              //       showToastShort('يرجى تسجيل الدخول اولا ', kRedColor);
              //     }
              //
              //     print('Like working');
              //     print('adBy');
              //     print(adBy);
              //     print(adBy);
              //     print(adBy);
              //     // print('FirebaseAuth.instance.currentUser.uid');
              //     // print(FirebaseAuth.instance.currentUser.uid);
              //     // print(FirebaseAuth.instance.currentUser.uid);
              //   } else {
              //     showToastShort('لا يمكنك الاعجاب بهذا الإعلان', kRedColor);
              //   }
              // }
              return !isLiked;
            },
            bubblesSize: 100.0,
            likeBuilder: (bool isLiked) {
              // ignore: deprecated_member_use
              return Icon(
                Icons.thumb_up,
                color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
                size: 20.0,
              );
            },
            likeCount: 3,
          ),
        ],
      );
  Widget disLikeButton(event) => Row(
        children: [
          LikeButton(
            onTap: (bool isDisLiked) async {
              // print('isLiked');
              // print(isLiked);
              // print(isLiked);
              // print(isLiked);
              // if (!isDisLiked) {
              //   if (adBy != FirebaseAuth.instance.currentUser.uid.toString()) {
              //     print(
              //         'adBy != FirebaseAuth.instance.currentUser.uid.toString()');
              //     if (widget.isGuest == false) {
              //       print('widget.isGuest == false');
              //       print('widget.isGuest == false');
              //       print('widget.isGuest == false');
              //       await FirebaseFirestore.instance
              //           .collection('Ads')
              //           .doc(widget.ds)
              //           .update({
              //         'disLikeCollection': FieldValue.arrayUnion(
              //             [FirebaseAuth.instance.currentUser.uid]),
              //         'disLikes': adDisLikes + 1,
              //       });
              //     } else {
              //       showToastShort('يرجى تسجيل الدخول اولا ', kRedColor);
              //     }
              //
              //     print('Like working');
              //     print('adBy');
              //     print(adBy);
              //     print(adBy);
              //     print(adBy);
              //     print('FirebaseAuth.instance.currentUser.uid');
              //     print(FirebaseAuth.instance.currentUser.uid);
              //     print(FirebaseAuth.instance.currentUser.uid);
              //   } else {
              //     showToastShort('لا يمكنك الاعجاب بهذا الإعلان', kRedColor);
              //   }
              // } else {
              //   if (adBy != FirebaseAuth.instance.currentUser.uid.toString()) {
              //     print(
              //         'adBy != FirebaseAuth.instance.currentUser.uid.toString()');
              //     if (widget.isGuest == false) {
              //       print('widget.isGuest == false');
              //       print('widget.isGuest == false');
              //       print('widget.isGuest == false');
              //       await FirebaseFirestore.instance
              //           .collection('Ads')
              //           .doc(widget.ds)
              //           .update({
              //         'disLikeCollection': FieldValue.arrayUnion(
              //             [FirebaseAuth.instance.currentUser.uid]),
              //         'disLikes': adDisLikes - 1,
              //       });
              //     } else {
              //       showToastShort('يرجى تسجيل الدخول اولا ', kRedColor);
              //     }
              //
              //     print('Like working');
              //     print('adBy');
              //     print(adBy);
              //     print(adBy);
              //     print(adBy);
              //     // print('FirebaseAuth.instance.currentUser.uid');
              //     // print(FirebaseAuth.instance.currentUser.uid);
              //     // print(FirebaseAuth.instance.currentUser.uid);
              //   } else {
              //     showToastShort('لا يمكنك الاعجاب بهذا الإعلان', kRedColor);
              //   }
              // }
              return !isDisLiked;
            },
            bubblesSize: 100.0,
            likeBuilder: (bool isDisLiked) {
              return Icon(
                Icons.thumb_down,
                color: isDisLiked ? Colors.deepPurpleAccent : Colors.grey,
                size: 20.0,
              );
            },
            likeCount: 1,
          ),
        ],
      );

  Widget storeAdDisLikeButton10() => Row(
        children: [
          LikeButton(
            bubblesSize: 100.0,
            likeBuilder: (bool isDisLiked) {
              return Icon(
                Icons.thumb_up,
                color: Colors.deepPurpleAccent,
                size: 20.0,
              );
            },
          ),
        ],
      );
}
