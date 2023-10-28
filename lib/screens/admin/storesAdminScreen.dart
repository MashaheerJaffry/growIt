import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';
import '../user/othersProfile.dart';

class StoreViewAdmin extends StatefulWidget {
  const StoreViewAdmin({Key? key}) : super(key: key);

  @override
  State<StoreViewAdmin> createState() => _StoreViewAdminState();
}

class _StoreViewAdminState extends State<StoreViewAdmin> {
  TextEditingController searchController = TextEditingController();
  bool isSearch = false;
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kRedColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: kWhite,
          ),
        ),
        title: Text(
          "Stores",
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),

            ///searchbar
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
                onChanged: (value) {
                  if (value.isEmpty) {
                    setState(() {
                      isSearch = false;
                      searchController.clear();
                    });
                  } else {
                    setState(() {
                      isSearch = true;
                    });
                  }
                },
                decoration: InputDecoration(
                  // enabled: isEnable!,
                  suffixIcon: isSearch
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              isSearch = false;
                              searchController.clear();
                            });
                          },
                          icon: Icon(
                            Icons.cancel_outlined,
                            color: Colors.grey,
                          ))
                      : Icon(Icons.search),
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            isSearch
                ? Container(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('userInfo')
                          // .where('isStore', isGreaterThanOrEqualTo: true)
                          .where('userName', isEqualTo: searchController.text)
                          .snapshots(),
                      builder: (context, dataSnapShot) {
                        return !dataSnapShot.hasData
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: kRedColor,
                                ), //No data Found
                              )
                            : StaggeredGridView.countBuilder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                physics: const ScrollPhysics(), // new
                                crossAxisCount: 1,
                                staggeredTileBuilder: (c) =>
                                    const StaggeredTile.fit(1),
                                itemBuilder: (context, index) {
                                  DocumentSnapshot ds =
                                      dataSnapShot.data!.docs[index];
                                  return dataSnapShot.data!.docs.isEmpty
                                      ? Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                'No Stores yet',
                                                style: GoogleFonts.nunitoSans(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                  // height: 22.h
                                                ),
                                              ),
                                            ],
                                          ), //No data Found
                                        )
                                      : Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            OtherProfileStoreView(
                                                                ds, true)));
                                              },
                                              child: Center(
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.9,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.32,
                                                  // padding: EdgeInsets.symmetric(horizontal: 15),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.16,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          child: Image(
                                                            image: AssetImage(
                                                                "assets/store_header_green.png"),
                                                            fit: BoxFit
                                                                .fitHeight,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.15,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    10.0),
                                                        child: Row(
                                                          // mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            ds.get('photoUrl') ==
                                                                    null
                                                                ? Container(
                                                                    width: 60,
                                                                    height: 60,
                                                                    child:
                                                                        CircleAvatar(
                                                                      radius:
                                                                          35,
                                                                      backgroundImage:
                                                                          AssetImage(
                                                                              'assets/store_detail_header@2x.png'),
                                                                    ),
                                                                  )
                                                                : Container(
                                                                    width: 60,
                                                                    height: 60,
                                                                    child:
                                                                        CircleAvatar(
                                                                      radius:
                                                                          35,
                                                                      backgroundImage:
                                                                          NetworkImage(
                                                                              ds.get('photoUrl')),
                                                                    ),
                                                                  ),
                                                            SizedBox(
                                                              width: 10.w,
                                                            ),
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  ds.get(
                                                                      'userName'),
                                                                  style: GoogleFonts.manrope(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Row(
                                                                  // mainAxisAlignment:
                                                                  //     MainAxisAlignment
                                                                  //         .center,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .location_on,
                                                                      color: Colors
                                                                          .grey,
                                                                    ),
                                                                    Text(
                                                                      ds.get(
                                                                          'address'),
                                                                      style: GoogleFonts.manrope(
                                                                          color:
                                                                              Colors.grey),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                            ),
                                          ],
                                        );
                                },
                                itemCount: dataSnapShot.data!.docs.length,
                              );
                      },
                    ),
                  )
                : Container(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('userInfo')
                          .where('isStore', isEqualTo: true)
                          .snapshots(),
                      builder: (context, dataSnapShot) {
                        return !dataSnapShot.hasData
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ), //No data Found
                              )
                            : StaggeredGridView.countBuilder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                physics: const ScrollPhysics(), // new
                                crossAxisCount: 1,
                                staggeredTileBuilder: (c) =>
                                    const StaggeredTile.fit(1),
                                itemBuilder: (context, index) {
                                  DocumentSnapshot ds =
                                      dataSnapShot.data!.docs[index];
                                  return dataSnapShot.data!.docs.isEmpty
                                      ? Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                'No Stores yet',
                                                style: GoogleFonts.nunitoSans(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                  // height: 22.h
                                                ),
                                              ),
                                            ],
                                          ), //No data Found
                                        )
                                      : Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            OtherProfileStoreView(
                                                                ds, true)));
                                              },
                                              child: Center(
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.9,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.32,
                                                  // padding: EdgeInsets.symmetric(horizontal: 15),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.16,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          child: Image(
                                                            image: AssetImage(
                                                                "assets/store_header_green.png"),
                                                            fit: BoxFit
                                                                .fitHeight,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.9,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.15,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    10.0),
                                                        child: Row(
                                                          // mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            ds.get('photoUrl') ==
                                                                    null
                                                                ? Container(
                                                                    width: 60,
                                                                    height: 60,
                                                                    child:
                                                                        CircleAvatar(
                                                                      radius:
                                                                          35,
                                                                      backgroundImage:
                                                                          AssetImage(
                                                                              'assets/store_detail_header@2x.png'),
                                                                    ),
                                                                  )
                                                                : Container(
                                                                    width: 60,
                                                                    height: 60,
                                                                    child:
                                                                        CircleAvatar(
                                                                      radius:
                                                                          35,
                                                                      backgroundImage:
                                                                          NetworkImage(
                                                                              ds.get('photoUrl')),
                                                                    ),
                                                                  ),
                                                            SizedBox(
                                                              width: 10.w,
                                                            ),
                                                            Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  ds.get(
                                                                      'userName'),
                                                                  style: GoogleFonts.manrope(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                Row(
                                                                  // mainAxisAlignment:
                                                                  //     MainAxisAlignment
                                                                  //         .center,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .location_on,
                                                                      color: Colors
                                                                          .grey,
                                                                    ),
                                                                    Text(
                                                                      ds.get(
                                                                          'address'),
                                                                      style: GoogleFonts.manrope(
                                                                          color:
                                                                              Colors.grey),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.01,
                                            ),
                                          ],
                                        );
                                },
                                itemCount: dataSnapShot.data!.docs.length,
                              );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
