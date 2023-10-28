import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growit/widgets/getCTAButton.dart';
import 'package:image/image.dart' as Im;
import 'package:image_picker/image_picker.dart';

import '../../constant.dart';
import '../../widgets/showToast.dart';
import '../../widgets/textFieldWidget.dart';

class EditProfileStore extends StatefulWidget {
  const EditProfileStore({Key? key}) : super(key: key);

  @override
  State<EditProfileStore> createState() => _EditProfileStoreState();
}

class _EditProfileStoreState extends State<EditProfileStore> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  // TextEditingController usernameController = TextEditingController();

  File? _imageFile;
  var currentUser = FirebaseAuth.instance.currentUser!.uid;

  getProfile() async {
    var user = await FirebaseFirestore.instance
        .collection('userInfo')
        .doc(currentUser)
        .get();
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: kRedColor,
        title: Text(
          'Edit Profile',
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: isLoadingImage
          ? Center(
              child: const CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : FutureBuilder<dynamic>(
              future: getProfile(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100.h,
                        ),
                        Center(
                          child: Container(
                            height: 150,
                            width: 150,
                            child: GestureDetector(
                              onTap: () {
                                takeImage(context);
                              },
                              child: _image == null
                                  ? Center(
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Positioned(
                                            left: 5,
                                            top: 5,
                                            child: SizedBox(
                                              height: 115,
                                              width: 115,
                                              child: Stack(
                                                clipBehavior: Clip.none,
                                                fit: StackFit.expand,
                                                children: [
                                                  snapshot.data?['photoUrl'] ==
                                                          null
                                                      ? CircleAvatar(
                                                          radius: 50,
                                                          backgroundImage:
                                                              AssetImage(
                                                                  'assets/image/peson1.png'),
                                                        )
                                                      : CircleAvatar(
                                                          radius: 50,
                                                          backgroundImage:
                                                              NetworkImage(snapshot
                                                                      .data?[
                                                                  'photoUrl']),
                                                        ),
                                                  Positioned(
                                                    right: -16,
                                                    bottom: 0,
                                                    child: SizedBox(
                                                      height: 46,
                                                      width: 46,
                                                      child: GestureDetector(
                                                        onTap: () {},
                                                        child: Center(
                                                            child: Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50),
                                                              color:
                                                                  Colors.white),
                                                          child: const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    5.0),
                                                            child: Icon(
                                                              Icons.add_a_photo,
                                                              color:
                                                                  Colors.green,
                                                            ),
                                                          ),
                                                        )),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // Image.asset(
                                            //     'assets/images/profile_pic.png'),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Stack(
                                      children: [
                                        InkWell(
                                          onTap: () => takeImage(context),
                                          child: Container(
                                            height: 184.h,
                                            width: 110.w,
                                            margin: const EdgeInsets.only(
                                                bottom: 20, left: 4.0),
                                            child: Center(
                                              child: AspectRatio(
                                                aspectRatio: 1 / 1,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        alignment:
                                                            Alignment.center,
                                                        image: FileImage(
                                                            _image!,
                                                            scale: 6.0),
                                                        fit: BoxFit.cover),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            55.0),
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
                        textFieldWidget('Edit Username', usernameController),
                        textFieldWidget(
                            'Edit Profession', professionController),
                        textFieldWidget('Edit Address', addressController),
                        SizedBox(
                          height: 10.h,
                        ),
                        getCtaButton(
                            text: 'Edit Profile',
                            onPress: () {
                              if (usernameController.text.isEmpty ||
                                  professionController.text.isEmpty ||
                                  addressController.text.isEmpty ||
                                  _image == null) {
                                showToastShort('Please Fill All Fields', kRed);
                              } else {
                                uploadImageAndSaveItemInfo();
                              }
                            },
                            color: kRed)
                      ],
                    ),
                  );
                } else {
                  return Container(
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              }),
    );
  }

  File? imageFile;
  final picker = ImagePicker();
  bool isLoadingImage = false;
  bool obscureText = true;
  String productId = DateTime.now().millisecondsSinceEpoch.toString();
  File? file;
  bool uploading = false;
  String? imageUrl;
  File? _image;

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
    final Reference storageRef = storage
        .ref()
        .child('Profiles/${DateTime.now().millisecondsSinceEpoch}.png');

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
    print('downloadUrl');
    print(downloadUrl);
    FirebaseFirestore.instance
        .collection('userInfo')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      "photoUrl": downloadUrl,
      'userName': usernameController.text,
      'profession': professionController.text,
      'address': addressController.text,
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
    showToastShort('Information Updated', Colors.red);

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
