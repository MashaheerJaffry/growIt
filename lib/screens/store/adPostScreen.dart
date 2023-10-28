import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image/image.dart' as Im;
import 'package:image_picker/image_picker.dart';

import '../../constant.dart';
import '../../widgets/bottomNavStore.dart';
import '../../widgets/getCTAButton.dart';
import '../../widgets/showToast.dart';

class AdPost extends StatefulWidget {
  const AdPost({Key? key}) : super(key: key);

  @override
  State<AdPost> createState() => _AdPostState();
}

class _AdPostState extends State<AdPost> {
  final List<String> items = [
    'Gardening',
    'Flowers',
    'Seeds',
    'Equipments',
  ];

  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

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
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descController = TextEditingController();

  final GlobalKey<ScaffoldState> _key = GlobalKey();
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
          'Post Ad',
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
                DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: Text(
                      'Choose Category',
                      style: kFieldStyle,
                    ),
                    items: items
                        .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(item, style: kFieldStyle),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    buttonStyleData: ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.85,
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 200,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                    ),
                    dropdownSearchData: DropdownSearchData(
                      searchController: textEditingController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 50,
                        padding: const EdgeInsets.only(
                          top: 8,
                          bottom: 4,
                          right: 8,
                          left: 8,
                        ),
                        child: TextFormField(
                          expands: true,
                          maxLines: null,
                          controller: textEditingController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            hintText: 'Search for an item...',
                            hintStyle: const TextStyle(fontSize: 12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return item.value.toString().contains(searchValue);
                      },
                    ),
                    //This to clear the search value when you close the menu
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        textEditingController.clear();
                      }
                    },
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
                    controller: titleController,
                    decoration: InputDecoration(
                      hintText: 'Add Title',
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
                      'Location*',
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
                    controller: locationController,
                    decoration: InputDecoration(
                      hintText: 'Add Location',
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
                    controller: priceController,
                    decoration: InputDecoration(
                      hintText: 'Add Price',
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
                    controller: descController,
                    decoration: InputDecoration(
                      hintText: 'Tell us something about you Ad',
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
                getCtaButton(
                  text: 'POST',
                  color: kPrimaryColor,
                  onPress: () {
                    if (selectedValue!.isEmpty ||
                        titleController.text.isEmpty ||
                        priceController.text.isEmpty ||
                        descController.text.isEmpty ||
                        _image == null) {
                      showToastShort('Please fill all fields', kRed);
                    } else {
                      uploadImageAndSaveItemInfo();
                    }
                  },
                ),
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
        storage.ref().child('ad/${DateTime.now().millisecondsSinceEpoch}.png');

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
    print('downloadUrl');
    print(downloadUrl);
    FirebaseFirestore.instance.collection('ads').doc(ds).set({
      "image": downloadUrl,
      "title": titleController.text,
      "category": selectedValue,
      "price": priceController.text,
      "location": locationController.text,
      "description": descController.text,
      'uid': FirebaseAuth.instance.currentUser!.uid,
      'date': ds.substring(0, 10),
      'likes': 0,
      'ds': ds,

      // "avatarUrl": avtarDownloadUrl,
    }).whenComplete(() {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => bottomNavigationBarStore()));
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
