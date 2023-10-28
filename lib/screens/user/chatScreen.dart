import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: kBG,
          ),
          child: Column(
            children: [
              Container(
                height: 137.h,
                width: 390.w,
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(35.r),
                    bottomLeft: Radius.circular(35.r),
                  ),
                  boxShadow: [
                    BoxShadow(blurRadius: 1.0, color: Colors.grey.shade400),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 32.w, right: 30.w),
                      child: Row(
                        children: [
                          IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: kSecondaryColor,
                              ),
                              // Within the `FirstRoute` widget
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                          SizedBox(
                            width: 27.w,
                          ),
                          Image.asset(
                            'assets/image/alex_icon.png',
                            width: 52.w,
                            height: 52.h,
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Alex Jhons',
                                style: GoogleFonts.manrope(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                  color: kSecondaryColor,
                                ),
                              ),
                              // Text(
                              //   'Online - Last seen, 2.02pm',
                              //   style: GoogleFonts.manrope(
                              //     fontSize: 13.sp,
                              //     fontWeight: FontWeight.w400,
                              //     color: kSecondaryColor,
                              //   ),
                              // ),
                            ],
                          ),
                          SizedBox(
                            width: 70.w,
                          ),
                          Image.asset(
                            'assets/image/doted_icon.png',
                            width: 5.w,
                            height: 17.h,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 35.w),
                              height: 43.h,
                              width: 139.w,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Hey There!',
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: kWhite,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        // Row(
                        //   children: [
                        //     Container(
                        //       margin: EdgeInsets.only(left: 25.w),
                        //       height: 10.h,
                        //       width: 10.w,
                        //       decoration: BoxDecoration(
                        //           color: kPrimaryColor,
                        //           borderRadius: BorderRadius.circular(10.r)),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 35.w),
                              height: 45.h,
                              width: 161.w,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'How are you?',
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: kWhite,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        // Row(
                        //   children: [
                        //     Container(
                        //       margin: EdgeInsets.only(left: 25.w),
                        //       height: 10.h,
                        //       width: 10.w,
                        //       decoration: BoxDecoration(
                        //           color: kPrimaryColor,
                        //           borderRadius: BorderRadius.circular(10.r)),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 35.w),
                              height: 45.h,
                              width: 202.w,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'How was your day?',
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: kWhite,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        // Row(
                        //   children: [
                        //     Container(
                        //       margin: EdgeInsets.only(left: 25.w),
                        //       height: 10.h,
                        //       width: 10.w,
                        //       decoration: BoxDecoration(
                        //           color: kPrimaryColor,
                        //           borderRadius: BorderRadius.circular(10.r)),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 43.w),
                              child: Text(
                                'Today, 8.30pm',
                                style: GoogleFonts.manrope(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: kSecondaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 31.w),
                              height: 40.h,
                              width: 94.w,
                              decoration: BoxDecoration(
                                color: kWhite,
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Hello!',
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: kSecondaryColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     Container(
                        //       margin: EdgeInsets.only(right: 20.w),
                        //       height: 10.h,
                        //       width: 10.w,
                        //       decoration: BoxDecoration(
                        //           color: kPrimaryColor,
                        //           borderRadius: BorderRadius.circular(10.r)),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 30.w),
                              child: Text(
                                'Today, 8.30pm',
                                style: GoogleFonts.manrope(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: kSecondaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 9.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 31.w),
                              height: 40.h,
                              width: 280.w,
                              decoration: BoxDecoration(
                                color: kWhite,
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'I am fine and how are you?',
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: kSecondaryColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     Container(
                        //       margin: EdgeInsets.only(right: 20.w),
                        //       height: 10.h,
                        //       width: 10.w,
                        //       decoration: BoxDecoration(
                        //           color: kPrimaryColor,
                        //           borderRadius: BorderRadius.circular(10.r)),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 31.w),
                              height: 40.h,
                              width: 205.w,
                              decoration: BoxDecoration(
                                color: kWhite,
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Today was great!!!',
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: kSecondaryColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     Container(
                        //       margin: EdgeInsets.only(right: 20.w),
                        //       height: 10.h,
                        //       width: 10.w,
                        //       decoration: BoxDecoration(
                        //           color: kPrimaryColor,
                        //           borderRadius: BorderRadius.circular(10.r)),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 30.w),
                              child: Text(
                                'Today, 8.30pm',
                                style: GoogleFonts.manrope(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: kSecondaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 19.h,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 35.w),
                              height: 71.h,
                              width: 305.w,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Text(
                                    'I am doing well, Can we meet \n tomorrow?',
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: kWhite,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        // Row(
                        //   children: [
                        //     Container(
                        //       margin: EdgeInsets.only(left: 25.w),
                        //       height: 10.h,
                        //       width: 10.w,
                        //       decoration: BoxDecoration(
                        //           color: kPrimaryColor,
                        //           borderRadius: BorderRadius.circular(10.r)),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 42.w),
                              child: Text(
                                'Today, 8.30pm',
                                style: GoogleFonts.manrope(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: kSecondaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 31.w),
                              height: 40.h,
                              width: 121.w,
                              decoration: BoxDecoration(
                                color: kWhite,
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Yes Sure!',
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: kSecondaryColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     Container(
                        //       margin: EdgeInsets.only(right: 20.w),
                        //       height: 10.h,
                        //       width: 10.w,
                        //       decoration: BoxDecoration(
                        //           color: kPrimaryColor,
                        //           borderRadius: BorderRadius.circular(10.r)),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 31.w),
                              height: 40.h,
                              width: 162.w,
                              decoration: BoxDecoration(
                                color: kWhite,
                                borderRadius: BorderRadius.circular(25.r),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'At what time?',
                                    style: GoogleFonts.manrope(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: kSecondaryColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 20.w),
                              height: 10.h,
                              width: 10.w,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(10.r)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 30.w),
                              child: Text(
                                'Today, 8.30pm',
                                style: GoogleFonts.manrope(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: kSecondaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 100.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          color: kBG,
          height: 75.h,
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 32.w),
                    width: 281.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(25.r),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 1.0, color: Colors.grey.shade300),
                        ]),
                    child: TextField(
                      // style: GoogleFonts.manrope(
                      // fontWeight: FontWeight.w400,
                      // fontSize: 12.sp,
                      // ),

                      textInputAction: TextInputAction.send,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16.0),
                        hintStyle: GoogleFonts.manrope(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        ),
                        enabledBorder: InputBorder.none,
                        // suffixIcon: const Icon(
                        //   Icons.camera_alt_outlined,
                        //   color: kSupportiveGrey,
                        // ),
                        hintText: '      Type your message here...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 13.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      messageController.clear();
                    },
                    child: Container(
                      height: 39.h,
                      width: 39.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: kPrimaryColor,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.send_sharp,
                          color: kWhite,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
