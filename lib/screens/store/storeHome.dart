import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growit/constant.dart';
import 'package:growit/screens/user/conversationScreen.dart';

// import '../../widgets/adTile
import '../../widgets/adTile.dart';
import '../user/adDetails.dart';
// import 'adDetails.dart';.dart';

class StoreHome extends StatefulWidget {
  @override
  _StoreHomeState createState() => _StoreHomeState();
}

class _StoreHomeState extends State<StoreHome> {
  String _selectedCategory = 'Flowers';
  TextEditingController searchController = TextEditingController();
  List<String> _categories = [];
  int selectedIndex = 0;
  bool isSearch = false;
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
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.35,
                color: kPrimaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                // child: StreamBuilder<QuerySnapshot>(
                //   stream: FirebaseFirestore.instance
                //       .collection('User')
                //       .where('uid', isEqualTo: widget.userID)
                //       .snapshots(),
                //   builder: (context, dataSnapShot) {
                //     return !dataSnapShot.hasData
                //         ? Center(
                //             child: CircularProgressIndicator(),
                //           )
                //         : StaggeredGridView.countBuilder(
                //             scrollDirection: Axis.vertical,
                //             shrinkWrap: true,
                //             physics: ScrollPhysics(), // new
                //             crossAxisCount: 1,
                //             staggeredTileBuilder: (c) => StaggeredTile.fit(1),
                //             itemBuilder: (context, index) {
                //               // DocumentSnapshot ds =
                //               //     dataSnapShot.data.docs[index];
                //               WorkerAdModel userModel = WorkerAdModel.fromJson(
                //                   dataSnapShot.data.docs[index].data());
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
                //                     backgroundImage:
                //                         NetworkImage(userModel.userImage),
                //                   ),
                //                   SizedBox(
                //                     height: 10.0,
                //                   ),
                //                   Text(
                //                     userModel.userName,
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
                //                     userModel.userProfession,
                //                     style: GoogleFonts.manrope(
                //                       fontWeight: FontWeight.bold,
                //                       fontSize: 15,
                //                       color: Colors.white.withOpacity(0.9),
                //                     ),
                //                   ),
                //                 ],
                //               );
                //             },
                //             itemCount: dataSnapShot.data.docs.length,
                //           );
                //   },
                // ),
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
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/image/peson1.png'),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Adam Aslam',
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                        color: kWhite,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      'Developer/ UI Designer',
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(context,
                    //         MaterialPageRoute(builder: (_) => ChatBootUser()));
                    //   },
                    //   child: Container(
                    //     width: MediaQuery.of(context).size.width,
                    //     height: MediaQuery.of(context).size.height * 0.06,
                    //     padding: EdgeInsets.symmetric(horizontal: 15),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.end,
                    //       children: [
                    //         Text(
                    //           "Chat",
                    //           style: GoogleFonts.manrope(
                    //               fontSize: 16, fontWeight: FontWeight.w600),
                    //         ),
                    //         SizedBox(width: 10),
                    //         Icon(
                    //           Icons.message,
                    //           size: 30.0,
                    //           color: kGreen,
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (_) =>
                        //             EditProfileUser(widget.userID)));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (_) => EditProfileUser(widget.userID)));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.06,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.settings,
                              size: 30.sp,
                              color: kGreen,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Settings', //Settings
                              style: GoogleFonts.manrope(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        // FirebaseAuth.instance.signOut();
                        // Navigator.pushAndRemoveUntil(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (_) => UpdatedHomeGuest()),
                        //     (route) => false);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.06,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.logout_outlined,
                              size: 30.sp,
                              color: kGreen,
                            ),
                            const SizedBox(width: 10),
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
        // bottomNavigationBar: BottomAppBar(
        //   child: SizedBox(
        //     height: 60,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         MaterialButton(
        //           onPressed: () {
        //             Navigator.pushReplacement(context,
        //                 MaterialPageRoute(builder: (_) => UserProfile()));
        //             setState(() {
        //               index = 1;
        //             });
        //           },
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Icon(
        //                 index == 0
        //                     ? Icons.account_circle
        //                     : Icons.account_circle_outlined,
        //                 color: index == 1 ? kGreen : Colors.grey,
        //               ),
        //               Text(
        //                 'Profile', //Profile
        //                 style: GoogleFonts.manrope(
        //                   color: index == 1 ? kGreen : Colors.grey,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ),
        //         Row(
        //           children: [
        //             MaterialButton(
        //               onPressed: () {
        //                 setState(() {
        //                   index = 0;
        //                 });
        //               },
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   Icon(
        //                     index == 1
        //                         ? CupertinoIcons.home
        //                         : CupertinoIcons.home,
        //                     color: index == 1 ? Colors.grey : kGreen,
        //                   ),
        //                   Text(
        //                     'Home', //Home
        //                     style: GoogleFonts.manrope(
        //                       color: index == 0 ? kGreen : Colors.grey,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        backgroundColor: kBG,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kBG,
          leading: IconButton(
            onPressed: () {
              _key.currentState!.openDrawer();
            },
            icon: const Icon(
              Icons.menu_open_rounded,
              size: 30,
              color: kSupportiveGrey,
            ),
          ),
          title: Text(
            'Hi User',
            style: kAppbarStyle,
          ),
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
                    // controller: controller,
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
                        isSearch
                            ? SizedBox(
                                height:
                                    MediaQuery.of(context).size.height - 400,
                                // width: MediaQuery.of(context).size.width,
                                child: StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('ads')
                                      // .where('category',
                                      //     isEqualTo: _selectedCategory)
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
                                                'Lahore',
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
                                                      '\$ 10.00',
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '96 Ads Available',
                        style: GoogleFonts.manrope(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w800,
                          color: kSecondaryColor,
                        ),
                      ),
                      const CircleAvatar(
                        backgroundColor: kWhite,
                        child: Icon(
                          Icons.filter_alt_outlined,
                          color: kSupportiveGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // adTile(() {
                //   Navigator.push(
                //       context, MaterialPageRoute(builder: (_) => AdDetails()));
                // }, 'Flowers', 'Lahore', '\$ 10.00', kWhite, kPrimaryColor,
                //     kSupportiveGrey, kSecondaryColor),
                // const SizedBox(
                //   height: 10,
                // ),
                // adTile(() {}, 'Flowers', 'Lahore', '\$ 10.00', kWhite,
                //     kPrimaryColor, kSupportiveGrey, kSecondaryColor),
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
