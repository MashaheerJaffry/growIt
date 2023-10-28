import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';
import '../../widgets/adTile.dart';
import '../user/adDetails.dart';

class AdViewAdmin extends StatefulWidget {
  const AdViewAdmin({Key? key}) : super(key: key);

  @override
  State<AdViewAdmin> createState() => _AdViewAdminState();
}

class _AdViewAdminState extends State<AdViewAdmin> {
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
          "Ads",
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
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
                StreamBuilder<QuerySnapshot>(
                  stream:
                      FirebaseFirestore.instance.collection('ads').snapshots(),
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
                                            'No Ads yet',
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
                                        adTile(() {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      AdDetails(ds, true)));
                                        },
                                            ds.get('title'),
                                            ds.get('location'),
                                            '\$ ${ds.get('price')}',
                                            kWhite,
                                            kPrimaryColor,
                                            kSupportiveGrey,
                                            kSecondaryColor,
                                            ds.get('image')),
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
          ),
        ],
      ),
    );
  }
}
