import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';
import '../../widgets/adTile.dart';
import '../user/otherUserProfile.dart';

class UserViewAdmin extends StatefulWidget {
  const UserViewAdmin({Key? key}) : super(key: key);

  @override
  State<UserViewAdmin> createState() => _UserViewAdminState();
}

class _UserViewAdminState extends State<UserViewAdmin> {
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
            Column(
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
                      .collection('userInfo')
                      .where('isStore', isEqualTo: false)
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
                                            'No Users yet',
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
                                        userTile(() {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      OtherUserProfile(
                                                          ds, true)));
                                        },
                                            ds.get('userName'),
                                            ds.get('address') ?? 'Address',
                                            kWhite,
                                            kPrimaryColor,
                                            kSupportiveGrey,
                                            kSecondaryColor,
                                            ds.get('photoUrl') ??
                                                'https://firebasestorage.googleapis.com/v0/b/flora-ce7c4.appspot.com/o/worker_ic.png?alt=media&token=e18011ad-4078-4828-a629-73bc49c5e60b',
                                            ds.get('userEmail')),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                      ],
                                    );
                            },
                            itemCount: dataSnapShot.data!.docs.length,
                          );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
