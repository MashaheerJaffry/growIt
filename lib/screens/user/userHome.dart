import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growit/constant.dart';
import 'package:growit/screens/user/conversationScreen.dart';

import '../../widgets/adTile.dart';
import 'adDetails.dart';

class UserHome extends StatefulWidget {
  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  String _selectedCategory = 'Flowers';
  TextEditingController searchController = TextEditingController();
  List<String> _categories = [];
  int selectedIndex = 0;
  int totalAds = 0;
  bool isSearch = false;
  bool showCategory = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  int _current = 0;
  List carouselData = [
    "assets/banner.png",
    "assets/banner.png",
    "assets/ad_main_img.png",
    "assets/banner.png",
    "assets/ad_main_img.png",
  ];
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  int index = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        key: _key,

        ///drawer
        // drawer: Drawer(
        //   child: Column(
        //     children: [
        //       StreamBuilder<QuerySnapshot>(
        //           stream: FirebaseFirestore.instance
        //               .collection('userInfo')
        //               .where('uid',
        //                   isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        //               .snapshots(),
        //           builder: (BuildContext context,
        //               AsyncSnapshot<QuerySnapshot> snapshot) {
        //             if (snapshot.hasError) return Text("");
        //             switch (snapshot.connectionState) {
        //               case ConnectionState.waiting:
        //                 return CircularProgressIndicator();
        //               default:
        //                 return new Column(
        //                   children: snapshot.data!.docs
        //                       .map((DocumentSnapshot document) {
        //                     return Container(
        //                       width: MediaQuery.of(context).size.width,
        //                       height: MediaQuery.of(context).size.height * 0.35,
        //                       color: kPrimaryColor,
        //                       padding: const EdgeInsets.symmetric(
        //                           horizontal: 20, vertical: 35),
        //                       child: Column(
        //                         mainAxisAlignment:
        //                             MainAxisAlignment.spaceEvenly,
        //                         children: [
        //                           document['photoUrl'] == null
        //                               ? const CircleAvatar(
        //                                   radius: 50,
        //                                   backgroundColor: Colors.transparent,
        //                                   backgroundImage: AssetImage(
        //                                       'assets/image/peson1.png'),
        //                                 )
        //                               : CircleAvatar(
        //                                   radius: 50,
        //                                   backgroundColor: Colors.transparent,
        //                                   backgroundImage: NetworkImage(
        //                                       document['photoUrl']),
        //                                 ),
        //                           const SizedBox(
        //                             height: 5,
        //                           ),
        //                           Text(
        //                             document['userName'],
        //                             style: GoogleFonts.manrope(
        //                               fontWeight: FontWeight.w600,
        //                               fontSize: 20.sp,
        //                               color: kWhite,
        //                             ),
        //                           ),
        //                           const SizedBox(
        //                             height: 5.0,
        //                           ),
        //                           Text(
        //                             document['profession'] ?? 'Profession',
        //                             style: GoogleFonts.manrope(
        //                               fontWeight: FontWeight.bold,
        //                               fontSize: 15.sp,
        //                               color: Colors.white.withOpacity(0.7),
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                     );
        //                   }).toList(),
        //                 );
        //             }
        //           }),
        //       Container(
        //         width: MediaQuery.of(context).size.width,
        //         height: MediaQuery.of(context).size.height * 0.5,
        //         padding: const EdgeInsets.symmetric(vertical: 15),
        //         child: Column(
        //           children: [
        //             const SizedBox(
        //               height: 15.0,
        //             ),
        //             GestureDetector(
        //               onTap: () {
        //                 // Navigator.push(
        //                 //     context,
        //                 //     MaterialPageRoute(
        //                 //         builder: (_) =>
        //                 //             EditProfileUser(widget.userID)));
        //                 // Navigator.push(
        //                 //     context,
        //                 //     MaterialPageRoute(
        //                 //         builder: (_) => EditProfileUser(widget.userID)));
        //               },
        //               child: Container(
        //                 width: MediaQuery.of(context).size.width,
        //                 height: MediaQuery.of(context).size.height * 0.06,
        //                 padding: const EdgeInsets.symmetric(horizontal: 15),
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.start,
        //                   children: [
        //                     Icon(
        //                       Icons.settings,
        //                       size: 30.sp,
        //                       color: kGreen,
        //                     ),
        //                     const SizedBox(width: 10),
        //                     Text(
        //                       'Settings', //Settings
        //                       style: GoogleFonts.manrope(
        //                           fontSize: 16, fontWeight: FontWeight.w600),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //             const SizedBox(
        //               height: 15.0,
        //             ),
        //             GestureDetector(
        //               onTap: () {
        //                 // FirebaseAuth.instance.signOut();
        //                 // Navigator.pushAndRemoveUntil(
        //                 //     context,
        //                 //     MaterialPageRoute(
        //                 //         builder: (_) => UpdatedHomeGuest()),
        //                 //     (route) => false);
        //               },
        //               child: Container(
        //                 width: MediaQuery.of(context).size.width,
        //                 height: MediaQuery.of(context).size.height * 0.06,
        //                 padding: const EdgeInsets.symmetric(horizontal: 15),
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.start,
        //                   children: [
        //                     Icon(
        //                       Icons.logout_outlined,
        //                       size: 30.sp,
        //                       color: kGreen,
        //                     ),
        //                     const SizedBox(width: 10),
        //                     Text(
        //                       'Logout', //Logout
        //                       style: GoogleFonts.manrope(
        //                           fontSize: 16, fontWeight: FontWeight.w600),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        backgroundColor: kBG,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kBG,
          // leading: IconButton(
          //   onPressed: () {
          //     _key.currentState!.openDrawer();
          //   },
          //   icon: const Icon(
          //     Icons.menu_open_rounded,
          //     size: 30,
          //     color: kSupportiveGrey,
          //   ),
          // ),
          title: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('userInfo')
                  .where('uid',
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) return Text("");
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return CircularProgressIndicator();
                  default:
                    return new Column(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        return Text(
                          'Hi ${document['userName']}',
                          style: kAppbarStyle,
                        );
                      }).toList(),
                    );
                }
              }),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.mode_comment,
                color: kSupportiveGrey,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ConversationListScreens()));
              },
            ),
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50.0,
                  width: 327.0,
                  child: TextFormField(
                    // obscureText: obsecureText,
                    controller: searchController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    style: kFieldStyle,
                    decoration: InputDecoration(
                      // enabled: isEnable!,
                      suffixIcon: const Icon(Icons.search),
                      fillColor: kWhite,
                      filled: true,
                      hintText: 'Search Here',
                      hintStyle: kFieldStyle,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('categories')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    for (var doc in snapshot.data!.docs) {
                      String category = doc['title'];
                      if (!_categories.contains(category)) {
                        _categories.add(category);
                      }
                    }

                    return Column(
                      children: [
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              String category = _categories[index];

                              return GestureDetector(
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        category,
                                        style: GoogleFonts.manrope(
                                            color: selectedIndex == index
                                                ? kPrimaryColor
                                                : Color(0xff9A9A9D),
                                            fontSize: 17.sp),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      selectedIndex == index
                                          ? Container(
                                              width: 50.w,
                                              height: 3.h,
                                              decoration: BoxDecoration(
                                                  color: kPrimaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50.0)),
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    _selectedCategory = category;
                                    selectedIndex = index;
                                    print('selectedIndex');
                                    print(selectedIndex);
                                  });
                                },
                              );
                            },
                          ),
                        ),
                        showCategory
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${totalAds.toString()} Ads Available',
                                      style: GoogleFonts.manrope(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w800,
                                        color: kSecondaryColor,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        if (showCategory == false) {
                                          setState(() {
                                            showCategory = true;
                                          });
                                        } else {
                                          setState(() {
                                            showCategory = false;
                                          });
                                        }
                                      },
                                      child: const CircleAvatar(
                                        backgroundColor: kWhite,
                                        child: Icon(
                                          Icons.filter_alt_outlined,
                                          color: kSupportiveGrey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : SizedBox(),
                        SizedBox(
                          height: 10.0,
                        ),
                        isSearch
                            ? SizedBox(
                                height:
                                    MediaQuery.of(context).size.height - 400,
                                // width: MediaQuery.of(context).size.width,
                                child: StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('ads')
                                      .where('title',
                                          isGreaterThanOrEqualTo:
                                              searchController.text)
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
                                        List<dynamic> image = ds.get('image');
                                        return Column(
                                          children: [
                                            adTile(() {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) => AdDetails(
                                                          ds, false)));
                                            },
                                                ds.get('title'),
                                                ds.get('location'),
                                                '\$ ${ds.get('price')}',
                                                kWhite,
                                                kPrimaryColor,
                                                kSupportiveGrey,
                                                kSecondaryColor,
                                                image),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        );
                                      },
                                      itemCount: dataSnapShot.data!.docs.length,
                                    );
                                  },
                                ))
                            : SizedBox(
                                height:
                                    MediaQuery.of(context).size.height - 400,
                                // width: MediaQuery.of(context).size.width,
                                child: StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('ads')
                                      .where('category',
                                          isEqualTo: _selectedCategory)
                                      .snapshots(),
                                  builder: (context, dataSnapShot) {
                                    return !dataSnapShot.hasData
                                        ? Center(
                                            child: Column(
                                              children: [
                                                Text(
                                                  'No Ads found',
                                                  style: GoogleFonts.nunitoSans(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        const Color(0xff000000),
                                                    // height: 22.h
                                                  ),
                                                ),
                                              ],
                                            ), //No data Found
                                          )
                                        : ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              totalAds = dataSnapShot
                                                  .data!.docs.length;
                                              DocumentSnapshot ds = dataSnapShot
                                                  .data!.docs[index];
                                              final image = ds.get('image');
                                              print('image');
                                              print(image);
                                              return Column(
                                                children: [
                                                  adTile(() {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (_) =>
                                                                AdDetails(ds,
                                                                    false)));
                                                  },
                                                      ds.get('title'),
                                                      ds.get('location'),
                                                      '\$ ${ds.get('price')}',
                                                      kWhite,
                                                      kPrimaryColor,
                                                      kSupportiveGrey,
                                                      kSecondaryColor,
                                                      image),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                ],
                                              );
                                            },
                                            itemCount:
                                                dataSnapShot.data!.docs.length,
                                          );
                                  },
                                )),
                        SizedBox(
                          height: 50.0,
                        )
                      ],
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

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
