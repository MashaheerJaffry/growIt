// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../constant.dart';
// import 'chatScreen.dart';
//
// class ConversationScreen extends StatefulWidget {
//   const ConversationScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ConversationScreen> createState() => _ConversationScreenState();
// }
//
// class _ConversationScreenState extends State<ConversationScreen> {
//   final GlobalKey<ScaffoldState> _key = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       key: _key,
//       child: Scaffold(
//         backgroundColor: kBG,
//         extendBody: true,
//         appBar: AppBar(
//           centerTitle: true,
//           elevation: 0,
//           backgroundColor: kBG,
//           leading: IconButton(
//               icon: const Icon(
//                 Icons.arrow_back_ios,
//                 color: kSecondaryColor,
//               ),
//               // Within the `FirstRoute` widget
//               onPressed: () {
//                 Navigator.pop(context);
//               }),
//           title: Text(
//             'Conversations',
//             style: kAppbarStyle.copyWith(color: kSecondaryColor),
//           ),
//         ),
//         body: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 20.h,
//               ),
//               Center(
//                 child: Center(
//                   child: Container(
//                     height: 45,
//                     width: 327,
//                     padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(26.r)),
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         // suffixIcon: icon,
//                         prefixIcon: const Icon(Icons.search),
//                         fillColor: kWhite,
//                         filled: true,
//                         labelText: 'Search',
//                         labelStyle: kFieldStyle,
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide.none,
//                           borderRadius: BorderRadius.circular(26.r),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 39.h,
//               ),
//               // SizedBox(
//               //   height: 49.h,
//               // ),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (_) => const ChatScreen()));
//                 },
//                 child: Stack(
//                   children: [
//                     SizedBox(
//                       width: 318.w,
//                       height: 60.h,
//                       child: Row(
//                         children: [
//                           Container(
//                             height: 51.h,
//                             width: 51.h,
//                             decoration: BoxDecoration(
//                                 image: const DecorationImage(
//                                     image:
//                                         AssetImage('assets/image/peson1.png'),
//                                     fit: BoxFit.fill),
//                                 borderRadius: BorderRadius.circular(20.r)),
//                           ),
//                           SizedBox(
//                             width: 20.w,
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   Text(
//                                     'Alex Andrew',
//                                     style: GoogleFonts.manrope(
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 16.sp,
//                                         color: kSecondaryColor),
//                                   ),
//                                   SizedBox(
//                                     width: 100.w,
//                                   ),
//                                   Text(
//                                     '2m ago',
//                                     style: GoogleFonts.manrope(
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 10.sp,
//                                       color: kSupportiveGrey,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 4.h,
//                               ),
//                               Row(
//                                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     'Hey what is up klnsd sdkn dslv',
//                                     style: GoogleFonts.manrope(
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 11.sp,
//                                         color: kSupportiveGrey),
//                                   ),
//                                   SizedBox(
//                                     width: 50.w,
//                                   ),
//                                   const Icon(
//                                     Icons.check_outlined,
//                                     color: kPrimaryColor,
//                                   )
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     Positioned(
//                       top: 5.h,
//                       left: 30.0,
//                       child: Container(
//                         height: 17.h,
//                         width: 17.w,
//                         decoration: BoxDecoration(
//                           color: kPrimaryColor,
//                           borderRadius: BorderRadius.circular(17.r),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 49.h,
//               ),
//               Stack(
//                 children: [
//                   SizedBox(
//                     width: 318.w,
//                     height: 60.h,
//                     child: Row(
//                       children: [
//                         Container(
//                           height: 51.h,
//                           width: 51.h,
//                           decoration: BoxDecoration(
//                               image: const DecorationImage(
//                                   image: AssetImage('assets/image/person2.png'),
//                                   fit: BoxFit.fill),
//                               borderRadius: BorderRadius.circular(20.r)),
//                         ),
//                         SizedBox(
//                           width: 20.w,
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Text(
//                                   'Adams Bills 1',
//                                   style: GoogleFonts.manrope(
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 16.sp,
//                                       color: kSecondaryColor),
//                                 ),
//                                 SizedBox(
//                                   width: 100.w,
//                                 ),
//                                 Text(
//                                   '2m ago',
//                                   style: GoogleFonts.manrope(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 10.sp,
//                                     color: kSupportiveGrey,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 4.h,
//                             ),
//                             Row(
//                               children: [
//                                 Text(
//                                   'let’s meetup at centre point corner',
//                                   style: GoogleFonts.manrope(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 11.sp,
//                                       color: kSupportiveGrey),
//                                 ),
//                                 SizedBox(
//                                   width: 30.w,
//                                 ),
//                                 CircleAvatar(
//                                   radius: 16.r,
//                                   backgroundColor:
//                                       kPrimaryColor.withOpacity(0.12),
//                                   child: Text(
//                                     '1',
//                                     style: GoogleFonts.montserrat(
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 10.sp,
//                                         color: kPrimaryColor),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   // Positioned(
//                   //   top: 5.h,
//                   //   left: 30.0,
//                   //   child: Container(
//                   //     height: 17.h,
//                   //     width: 17.w,
//                   //     decoration: BoxDecoration(
//                   //       color: const Color(0xff54D969),
//                   //       borderRadius: BorderRadius.circular(17.r),
//                   //     ),
//                   //   ),
//                   // ),
//                 ],
//               ),
//               SizedBox(
//                 height: 49.h,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growit/constant.dart';

import 'messageScreen.dart';

class ConversationListScreens extends StatefulWidget {
  @override
  State<ConversationListScreens> createState() =>
      _ConversationListScreensState();
}

class _ConversationListScreensState extends State<ConversationListScreens>
    with WidgetsBindingObserver {
  TextEditingController searchConroller = TextEditingController();
  var myUsername, myProfile = null;
  bool isSearch = false;
  // bool? isUserOnline = true;
  // bool isUserOnline2 = true;
  // bool? getStatus(var ds) {
  //   FirebaseFirestore.instance
  //       .collection('userActivity')
  //       .doc(ds)
  //       .get()
  //       .then((value) {
  //     // setState(() {
  //     isUserOnline = value.data()?['isOnline'];
  //     // });
  //   });
  //   return isUserOnline;
  // }

  // isOnline(bool isOnline) async {
  //   await FirebaseFirestore.instance
  //       .collection('userActivity')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .update({'isOnline': isOnline});
  // }

  notificationUpdate() async {
    var user = FirebaseAuth.instance.currentUser!.uid;

    print("Userrrr iddddddd" + user.toString());

    var userData = await FirebaseFirestore.instance
        .collection('userInfo')
        .doc(user)
        .update({
      'chatCount': 0,
    });
    setState(() {});
    return;
  }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.resumed) {
  //     isOnline(true);
  //   } else {
  //     isOnline(false);
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationUpdate();
    // WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('assets/images/chat_background.png'),
          //       fit: BoxFit.fill,
          //     )
          // ),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: 15, left: 30, right: 20, bottom: 10),
                    height: MediaQuery.of(context).size.height * .15,
                    // decoration: BoxDecoration(
                    //     // color: Colors.white54,
                    //     color: Color(0xffFFFFFF),
                    //     borderRadius: BorderRadius.only(
                    //         bottomLeft: Radius.circular(25.r),
                    //         bottomRight: Radius.circular(25.r))),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Chat',
                          style: GoogleFonts.poppins(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff2f2f2f),
                            // height: 22.h
                          ),
                        ),
                        // GestureDetector(
                        //   // Within the `FirstRoute` widget
                        //   onTap: () {
                        //     // Navigator.push(
                        //     //   context,
                        //     //   MaterialPageRoute(
                        //     //       builder: (context) => SmookersList()),
                        //     // );
                        //   },
                        //   child: Container(
                        //     child: Image.asset('assets/images/dots_icon.png'),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 30),
                  //   child: Image.asset(
                  //     'assets/images/Ornament.png',
                  //     width: 155.w,
                  //     height: 60.h,
                  //   ),
                  // ),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 10,
                ),
                child: TextField(
                  onChanged: (val) {
                    if (val.isEmpty) {
                      setState(() {
                        isSearch = false;
                      });
                    } else {
                      setState(() {
                        isSearch = true;
                      });
                    }
                  },
                  controller: searchConroller,
                  style: GoogleFonts.nunitoSans(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000000),
                    // height: 22.h
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: kPrimaryColor,
                      ),
                    ),
                    hintText: '   Search...',
                    hintStyle: GoogleFonts.nunitoSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff6b6b6b),
                      // height: 22.h
                    ),
                    suffixIcon: isSearch
                        ? IconButton(
                            onPressed: () {
                              searchConroller.clear();
                            },
                            icon: Icon(
                              Icons.cancel,
                              color: kGrayColor,
                            ))
                        : IconButton(
                            onPressed: () {}, icon: Icon(Icons.search)),
                  ),
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('userInfo')
                      .where('uid',
                          isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) return const Text("");
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const Text('');
                      default:
                        return Column(
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            myUsername = document['userName'];
                            myProfile = document['photoUrl'];
                            return const SizedBox(
                              height: 0.0,
                            );
                          }).toList(),
                        );
                    }
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('chatRoom')
                    .where('members',
                        arrayContains: FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    if (snapshot.data!.docs.isEmpty) {
                      return Center(child: Text('No Message for now'));
                    } else {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Scrollbar(
                            thickness: 8.w,
                            radius: Radius.circular(10.r),
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot ds =
                                      snapshot.data!.docs[index];
                                  var otherName = 'User';
                                  var otherUid, otherProfile;
                                  List<dynamic> membersName =
                                      ds.get('memberName');
                                  List<dynamic> membersUID = ds.get('members');
                                  List<dynamic> membersImage =
                                      ds.get('memberImage');

                                  if (membersImage[0] == myProfile) {
                                    otherProfile = membersImage[1];
                                    print('otherProfile');
                                    print(otherProfile);
                                  } else {
                                    otherProfile = membersImage[0];
                                    print('otherProfile');
                                    print(otherProfile);
                                  }
                                  if (membersName[0] == myUsername) {
                                    otherName = membersName[1];
                                    // print('otherName');
                                    // print(otherName);
                                  } else {
                                    otherName = membersName[0];
                                    // print('otherName');
                                    // print(otherName);
                                  }
                                  if (membersUID[0] ==
                                      FirebaseAuth.instance.currentUser!.uid) {
                                    otherUid = membersUID[1];
                                    // print('otherUid');
                                    // print(otherUid);
                                  } else {
                                    otherUid = membersUID[0];
                                    // print('otherUid');
                                    // print(otherUid);
                                  }
                                  // isUserOnline2 = getStatus(otherUid)!;
                                  // print('isUserOnline2');
                                  // print(isUserOnline2);
                                  return Column(
                                    children: [
                                      GestureDetector(
                                          child: Stack(
                                            children: [
                                              Container(
                                                height: 100,
                                                // margin: EdgeInsets.only(top: 50),
                                                child: Container(
                                                  child: Card(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10),
                                                    child: Row(
                                                      // mainAxisAlignment:
                                                      //     MainAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          height: 60,
                                                          width: 60,
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 10),
                                                          decoration: otherProfile ==
                                                                  null
                                                              ? BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(20
                                                                              .r),
                                                                  image:
                                                                      DecorationImage(
                                                                    image: AssetImage(
                                                                        'assets/profile_photo_placeholder.png'),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ))
                                                              : BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(20
                                                                              .r),
                                                                  image:
                                                                      DecorationImage(
                                                                    image: NetworkImage(
                                                                        otherProfile),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  )),
                                                        ),
                                                        Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 10,
                                                                  right: 10),
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              .72,
                                                          margin:
                                                              EdgeInsets.only(
                                                            top: 10,
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            25),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      otherName ??
                                                                          'User',
                                                                      style: GoogleFonts
                                                                          .nunitoSans(
                                                                        fontSize:
                                                                            16.sp,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        color: Color(
                                                                            0xff000000),
                                                                        // height: 22.h
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      '2m ago',
                                                                      style: GoogleFonts
                                                                          .nunitoSans(
                                                                        fontSize:
                                                                            12.sp,
                                                                        fontWeight:
                                                                            FontWeight.w400,
                                                                        color: Color(
                                                                            0xff898A8D),
                                                                        // height: 22.h
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        top: 5,
                                                                        right:
                                                                            20),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        ds.get('lastMessage').toString().length >
                                                                                25
                                                                            ? Text(
                                                                                '${ds.get('lastMessage').toString().substring(0, 26)}...',
                                                                                style: GoogleFonts.nunitoSans(
                                                                                  fontSize: 12.sp,
                                                                                  fontWeight: FontWeight.w400,
                                                                                  color: Color(0xff000000),
                                                                                  // height: 22.h
                                                                                ),
                                                                              )
                                                                            : Text(
                                                                                ds.get('lastMessage').toString(),
                                                                                style: GoogleFonts.nunitoSans(
                                                                                  fontSize: 12.sp,
                                                                                  fontWeight: FontWeight.w400,
                                                                                  color: Color(0xff000000),
                                                                                  // height: 22.h
                                                                                ),
                                                                              ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              // Positioned(
                                              //   top: 70,
                                              //   left: 18,
                                              //   child: Container(
                                              //     height: 18,
                                              //     width: 18,
                                              //     decoration: BoxDecoration(
                                              //         color: ds.get('isOnline')
                                              //             ? Colors.green
                                              //             : Colors.grey,
                                              //         borderRadius:
                                              //             BorderRadius.circular(
                                              //                 20.r)),
                                              //   ),
                                              // ),
                                            ],
                                          ),

                                          // Within the `FirstRoute` widget
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MessageScreen(
                                                        otherProfile,
                                                        otherUid,
                                                        otherName,
                                                        myUsername,
                                                      )),
                                            );
                                          }),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        ),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
