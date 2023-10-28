import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant.dart';
import '../../widgets/bottomNavStore.dart';
import '../../widgets/getCTAButton.dart';

class EditAdPost extends StatefulWidget {
  const EditAdPost({Key? key}) : super(key: key);

  @override
  State<EditAdPost> createState() => _EditAdPostState();
}

class _EditAdPostState extends State<EditAdPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: kBG,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBG,
        centerTitle: true,
        title: Text(
          'Edit Ad',
          style: kAppbarStyle.copyWith(color: kSecondaryColor),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kSecondaryColor,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => bottomNavigationBarStore()));
          },
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Attach Image*',
                      style: kSubTitleStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  width: 300,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        size: 40.0,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Title*',
                      style: kSubTitleStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 23.h,
                ),
                Container(
                  child: TextField(
                    style: kFieldStyle,
                    decoration: InputDecoration(
                      hintText: 'Flowers for sale',
                      hintStyle: kFieldStyle,
                      filled: true,
                      fillColor: kWhite,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Category*',
                      style: kSubTitleStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 23.h,
                ),
                Container(
                  child: TextField(
                    style: kFieldStyle,
                    decoration: InputDecoration(
                      hintText: 'Add Category',
                      hintStyle: kFieldStyle,
                      filled: true,
                      fillColor: kWhite,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Price*',
                      style: kSubTitleStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 23.h,
                ),
                Container(
                  child: TextField(
                    style: kFieldStyle,
                    decoration: InputDecoration(
                      hintText: '\$ 1,000',
                      hintStyle: kFieldStyle,
                      filled: true,
                      fillColor: kWhite,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Description', style: kSubTitleStyle),
                  ],
                ),
                SizedBox(
                  height: 23.h,
                ),
                Container(
                  child: TextField(
                    maxLines: 5,
                    style: kFieldStyle,
                    decoration: InputDecoration(
                      hintText:
                          'Only serious buyers inbox me for negotiations.',
                      hintStyle: kFieldStyle,
                      filled: true,
                      fillColor: kWhite,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                getCtaButton(text: 'POST', color: kGreenColor, onPress: () {}),
                SizedBox(
                  height: 25.h,
                ),
                getCtaButton(
                    text: 'Delete Ad', color: kPrimaryColor, onPress: () {}),
                SizedBox(
                  height: 100.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
