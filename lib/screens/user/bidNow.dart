import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growit/widgets/getCTAButton.dart';
import 'package:growit/widgets/showToast.dart';

import '../../constant.dart';
import '../../widgets/textFieldWidget.dart';

class BidNow extends StatefulWidget {
  var ds;
  BidNow(this.ds);

  @override
  State<BidNow> createState() => _BidNowState();
}

class _BidNowState extends State<BidNow> {
  TextEditingController expectedPriceC = TextEditingController();
  TextEditingController locationC = TextEditingController();
  TextEditingController descriptionC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBG,
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: kBG,
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
          'Bid Now',
          style: kAppbarStyle.copyWith(color: kSecondaryColor),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                // Container(
                //   height: 200.h,
                //   width: 329.w,
                //   decoration: BoxDecoration(
                //       color: kWhite, borderRadius: BorderRadius.circular(10.0)),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Icon(Icons.camera_alt_outlined),
                //       SizedBox(
                //         width: 10.w,
                //       ),
                //       Text(
                //         'Add Image',
                //         style: kFieldStyle,
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 10.h,
                ),
                // textFieldWidget('Title'),
                textFieldWidget('Expected Price', expectedPriceC),
                textFieldWidget('Location', locationC),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 10, bottom: 10),
                  // padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: descriptionC,
                    minLines: 6,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: kFieldStyle,
                    decoration: InputDecoration(
                      hintText: 'Tell something about the product',
                      hintStyle: kFieldStyle,
                      fillColor: kWhite,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      // focusedBorder: InputBorder.none,
                      // enabledBorder: InputBorder.none,
                      // errorBorder: InputBorder.none,
                      // disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        height: 90.0,
        color: kBG,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getCtaButton(
                  onPress: () {
                    if (locationC.text.isEmpty ||
                        expectedPriceC.text.isEmpty ||
                        descriptionC.text.isEmpty) {
                      showToastShort('Fill all fields', kRedColor);
                    } else {
                      var repliesDs = DateTime.now().toString();
                      FirebaseFirestore.instance
                          .collection('bids')
                          .doc(widget.ds)
                          .collection('replies')
                          .doc(repliesDs)
                          .set({
                        'expectedPrice': expectedPriceC.text,
                        'location': locationC.text,
                        'replyByUid':
                            FirebaseAuth.instance.currentUser!.uid.toString(),
                        'replyFor': widget.ds,
                        'time': DateTime.now().toString(),
                        'productDescription': descriptionC.text,
                      }).whenComplete(() {
                        showToastShort(
                            'Reply Registered Successfully', kPrimaryColor);
                        Navigator.pop(context);
                      });
                    }
                  },
                  color: kSecondaryColor,
                  text: 'BID NOW')
            ],
          ),
        ),
      ),
    );
  }
}
