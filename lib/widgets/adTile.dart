import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';

Widget adTile(
    VoidCallback onTap,
    var title,
    var location,
    var price,
    Color color,
    Color titleColor,
    Color subTitleColor,
    Color priceColor,
    var image) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 90.h,
      width: 329.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 10.0,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              image,
              width: 60,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.manrope(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w800,
                      color: titleColor),
                ),
                const SizedBox(
                  height: 3.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: kSupportiveGrey,
                      size: 12,
                    ),
                    Text(
                      location,
                      style: GoogleFonts.manrope(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: subTitleColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  price,
                  style: GoogleFonts.manrope(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                      color: priceColor),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget userTile(
    VoidCallback onTap,
    var title,
    var location,
    Color color,
    Color titleColor,
    Color subTitleColor,
    Color priceColor,
    var image,
    var email) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 90.h,
      width: 329.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 10.0,
          ),
          CircleAvatar(
            backgroundColor: kWhite,
            child: Image.network(
              image,
              width: 80,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.manrope(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w800,
                      color: titleColor),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  email,
                  style: GoogleFonts.manrope(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: subTitleColor),
                ),
                const SizedBox(
                  height: 3.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: kSupportiveGrey,
                      size: 12,
                    ),
                    Text(
                      location,
                      style: GoogleFonts.manrope(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: subTitleColor),
                    ),
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

Widget EditadTile(
    VoidCallback onTap,
    var title,
    var location,
    var price,
    Color color,
    Color titleColor,
    Color subTitleColor,
    Color priceColor,
    VoidCallback editTap,
    var image) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 90.h,
      width: 329.w,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 10.0,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              image,
              width: 60,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.manrope(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w800,
                          color: titleColor),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    GestureDetector(
                      onTap: editTap,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: kPrimaryColor,
                        child: Icon(
                          Icons.edit,
                          size: 13,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 3.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: kSupportiveGrey,
                      size: 12,
                    ),
                    Text(
                      location,
                      style: GoogleFonts.manrope(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: subTitleColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  price,
                  style: GoogleFonts.manrope(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                      color: priceColor),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
