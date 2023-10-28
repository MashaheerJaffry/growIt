import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growit/screens/user/bidDetails.dart';

import '../../constant.dart';
import '../../widgets/bidTile.dart';
import 'createBid.dart';

class BiddingScreen extends StatefulWidget {
  const BiddingScreen({Key? key}) : super(key: key);

  @override
  State<BiddingScreen> createState() => _BiddingScreenState();
}

class _BiddingScreenState extends State<BiddingScreen> {
  TextEditingController searchController = TextEditingController();
  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBG,
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: kBG,
        title: Text(
          'Open Bidding',
          style: kAppbarStyle.copyWith(color: kSecondaryColor),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => CreateBid()));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: CircleAvatar(
                  backgroundColor: kPrimaryColor,
                  child: Icon(
                    Icons.add,
                    color: kWhite,
                  )),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
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
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.35,
                            color: kPrimaryColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 35),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                document['photoUrl'] == null
                                    ? const CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: AssetImage(
                                            'assets/image/peson1.png'),
                                      )
                                    : CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage:
                                            NetworkImage(document['photoUrl']),
                                      ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  document['userName'],
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
                                  document['profession'] ?? 'Profession',
                                  style: GoogleFonts.manrope(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      );
                  }
                }),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                children: [
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
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        isSearch = true;
                      });
                    } else {
                      setState(() {
                        isSearch = false;
                      });
                    }
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
                                  isGreaterThanOrEqualTo: searchController.text)
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
                                                  builder: (_) => BidDetails(
                                                      document, false)));
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
                                                  builder: (_) => BidDetails(
                                                      document, false)));
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

              // bidTile(() {}, 'Open Bidding for Black Rose', 'USA', '\$ 20.00',
              //     kWhite, kPrimaryColor, kSupportiveGrey, kGreenColor),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
