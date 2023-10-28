import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growit/widgets/getCTAButton.dart';
import 'package:image/image.dart' as Im;
import 'package:image_picker/image_picker.dart';

import '../../constant.dart';
import '../../widgets/showToast.dart';
import '../../widgets/textFieldWidget.dart';

class CreateBid extends StatefulWidget {
  const CreateBid({Key? key}) : super(key: key);

  @override
  State<CreateBid> createState() => _CreateBidState();
}

class _CreateBidState extends State<CreateBid> {
  TextEditingController titleC = TextEditingController();
  TextEditingController priceC = TextEditingController();
  TextEditingController locationC = TextEditingController();
  TextEditingController descC = TextEditingController();

  ///update image
  File? imageFile;
  final picker = ImagePicker();
  bool isLoadingImage = false;
  bool obscureText = true;
  String productId = DateTime.now().millisecondsSinceEpoch.toString();
  File? file;
  bool uploading = false;
  String? imageUrl;
  File? _image;
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
          'Post Bid',
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
                  height: 15.h,
                ),
                Center(
                  child: SizedBox(
                    width: 320.w,
                    height: 221.h,
                    child: GestureDetector(
                      onTap: () {
                        takeImage(context);
                      },
                      child: _image == null
                          ? Container(
                              width: 320.w,
                              height: 220.h,
                              decoration: BoxDecoration(
                                color: kWhite,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.camera_alt),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    'Select Image',
                                    style: GoogleFonts.manrope(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w400,
                                        color: kSupportiveGrey),
                                  ),
                                ],
                              ),
                            )
                          : Stack(
                              children: [
                                InkWell(
                                  onTap: () => takeImage(context),
                                  child: Container(
                                    width: 320.w,
                                    height: 220.h,
                                    margin: const EdgeInsets.only(
                                        bottom: 20, left: 4.0),
                                    child: Center(
                                      child: AspectRatio(
                                        aspectRatio: 16 / 9,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                alignment: Alignment.center,
                                                image: FileImage(_image!,
                                                    scale: 2.0),
                                                fit: BoxFit.cover),
                                            borderRadius:
                                                BorderRadius.circular(55.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                textFieldWidget('Title', titleC),
                textFieldWidget('Price', priceC),
                textFieldWidget('Location', locationC),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 10, bottom: 10),
                  // padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: descC,
                    minLines: 6,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: kFieldStyle,
                    decoration: InputDecoration(
                      hintText: 'Description Here',
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
                        titleC.text.isEmpty ||
                        priceC.text.isEmpty ||
                        descC.text.isEmpty ||
                        _image == null) {
                      showToastShort('Please fill all fields', kRed);
                    } else {
                      uploadImageAndSaveItemInfo();
                    }
                  },
                  color: kPrimaryColor,
                  text: 'Post')
            ],
          ),
        ),
      ),
    );
  }

  Future<String> uploadCircularImageToFirebase2(
      File imageFile, int size) async {
    // Read the image file into memory
    Uint8List imageBytes = await imageFile.readAsBytes();

    // Decode the image using the `image` library
    Im.Image? image = Im.decodeImage(imageBytes);

    // Resize the image to fit within a square of the specified size
    Im.Image resizedImage = Im.copyResize(image!, width: size, height: size);

    // Crop the image to a circle
    Im.Image circularImage = Im.copyCropCircle(resizedImage);

    // Encode the circular image as a PNG
    Uint8List? circularImageBytes = Im.encodePng(circularImage) as Uint8List?;

    // Get a reference to the Firebase storage bucket
    final FirebaseStorage storage = FirebaseStorage.instance;
    final Reference storageRef =
        storage.ref().child('bid/${DateTime.now().millisecondsSinceEpoch}.png');

    // Upload the circular image to Firebase storage
    await storageRef.putData(circularImageBytes!);

    // Get the download URL of the uploaded circular image
    String downloadURL = await storageRef.getDownloadURL();

    return downloadURL;
  }

  uploadImageAndSaveItemInfo() async {
    // setState(() {
    //   uploading = true;
    // });
    showToastShort('Loading', Colors.red);
    setState(() {
      isLoadingImage = true;
    });
    // String imageDownloadUrl = await uploadResizedImage(_image!);
    // String imageDownloadUrl = await uploadCircularImageToFirebase(_image!);
    // String imageDownloadUrl = await uploadCircularImageToFirebase(_image!);
    String imageDownloadUrl =
        await uploadCircularImageToFirebase2(_image!, 150);
    // String avtarDownloadUrl = await uploadItemImage(_image!);
    print('uploadImageAndSaveItemInfo');
    print(imageDownloadUrl);
    saveStoreInfo(imageDownloadUrl);
  }

  void saveStoreInfo(String downloadUrl) async {
    var ds = DateTime.now().toString();
    List<dynamic> replies = [];
    print('downloadUrl');
    print(downloadUrl);
    FirebaseFirestore.instance.collection('bids').doc(ds).set({
      "image": downloadUrl,
      "title": titleC.text,
      // "category": selectedValue,
      "price": priceC.text,
      "location": locationC.text,
      "description": descC.text,
      'uid': FirebaseAuth.instance.currentUser!.uid,
      'date': ds.substring(0, 10),
      'replies': replies,
      'likes': 0,
      'ds': ds,

      // "avatarUrl": avtarDownloadUrl,
    }).whenComplete(() {
      Navigator.pop(context);
      setState(() {
        isLoadingImage = false;
      });
    });
    // Navigator.pushAndRemoveUntil(
    // context,
    // MaterialPageRoute(builder: (_) => const ()),
    // (route) => false).whenComplete(() {
    setState(() {});
    showToastShort('Ad Uploaded Successfully', Colors.red);

    // });
  }

  pickUImageFromGallery() async {
    Navigator.pop(context);
    // ignore: deprecated_member_use
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  takeImage(mContext) {
    return showDialog(
        context: mContext,
        builder: (con) {
          return SimpleDialog(
            title: Text(
              "Upload Image", //item Image
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                // height: 42.h
              ),
            ),
            children: [
              SimpleDialogOption(
                onPressed: pickUImageFromGallery,
                child: Text(
                  "Gallery", //Select From Gallery
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    // height: 42.h
                  ),
                ),
              ),
              SimpleDialogOption(
                child: Text(
                  "Cancel",
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    // height: 42.h
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }
}
