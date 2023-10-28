import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';
import '../../widgets/bidTile.dart';
import '../user/bidDetails.dart';

class BidViewAdmin extends StatefulWidget {
  const BidViewAdmin({Key? key}) : super(key: key);

  @override
  State<BidViewAdmin> createState() => _BidViewAdminState();
}

class _BidViewAdminState extends State<BidViewAdmin> {
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
          "Users",
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SingleChildScrollView(
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
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.02,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         '96 Ads Available',
                  //         style: GoogleFonts.manrope(
                  //           fontSize: 20.sp,
                  //           fontWeight: FontWeight.w800,
                  //           color: kSecondaryColor,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isSearch
                            ? StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('bids')
                                    .where('title',
                                        isGreaterThanOrEqualTo:
                                            searchController.text)
                                    .snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.hasError) return Text("");
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.waiting:
                                      return CircularProgressIndicator();
                                    default:
                                      // return new Column(
                                      //   children: snapshot.data!.docs
                                      //       .map((DocumentSnapshot document) {
                                      return Text(
                                        '${snapshot.data!.docs.length} Bids Found',
                                        style: GoogleFonts.manrope(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w800,
                                          color: kSecondaryColor,
                                        ),
                                        //   );
                                        // }).toList(),
                                      );
                                  }
                                })
                            : StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('bids')
                                    // .where('uid',
                                    // isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                                    .snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.hasError) return Text("");
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.waiting:
                                      return CircularProgressIndicator();
                                    default:
                                      // return new Column(
                                      //   children: snapshot.data!.docs
                                      //       .map((DocumentSnapshot document) {
                                      return Text(
                                        '${snapshot.data!.docs.length} Bids Found',
                                        style: GoogleFonts.manrope(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w800,
                                          color: kSecondaryColor,
                                        ),
                                        //   );
                                        // }).toList(),
                                      );
                                  }
                                }),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      isSearch
                          ? StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('bids')
                                  .where('title',
                                      isGreaterThanOrEqualTo:
                                          searchController.text)
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasError) return Text("");
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting:
                                    return CircularProgressIndicator();
                                  default:
                                    return new Column(
                                      children: snapshot.data!.docs
                                          .map((DocumentSnapshot document) {
                                        return Column(
                                          children: [
                                            bidTile(() {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          BidDetails(
                                                              document, true)));
                                            },
                                                document['title'],
                                                document['location'],
                                                '\$ ${document['price']}.00',
                                                document['image'],
                                                kWhite,
                                                kPrimaryColor,
                                                kSupportiveGrey,
                                                kGreenColor),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        );
                                      }).toList(),
                                    );
                                }
                              })
                          : StreamBuilder<QuerySnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('bids')
                                  // .where('uid',
                                  // isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasError) return Text("");
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting:
                                    return CircularProgressIndicator();
                                  default:
                                    return new Column(
                                      children: snapshot.data!.docs
                                          .map((DocumentSnapshot document) {
                                        return Column(
                                          children: [
                                            bidTile(() {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          BidDetails(
                                                              document, true)));
                                            },
                                                document['title'],
                                                document['location'],
                                                '\$ ${document['price']}.00',
                                                document['image'],
                                                kWhite,
                                                kPrimaryColor,
                                                kSupportiveGrey,
                                                kGreenColor),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        );
                                      }).toList(),
                                    );
                                }
                              }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
