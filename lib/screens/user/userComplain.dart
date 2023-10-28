import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:growit/widgets/showToast.dart';

import '../../constant.dart';

class UserComplains extends StatefulWidget {
  var ds;
  UserComplains(this.ds);
  @override
  _UserComplainsState createState() => _UserComplainsState();
}

class _UserComplainsState extends State<UserComplains> {
  TextEditingController complaintConstroller = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kGrayColor,
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter your complaint',
              style: TextStyle(color: kGreenColor, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: TextFormField(
                        // textDirection: TextDirection.rtl,
                        controller: userNameController,
                        decoration: InputDecoration(
                            // hintTextDirection: TextDirection.rtl,
                            hintText: 'Username'), //User Name
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        // textDirection: TextDirection.rtl,
                        controller: complaintConstroller,
                        maxLines: 5,
                        decoration: InputDecoration(
                            // hintTextDirection: TextDirection.rtl,
                            hintText: 'Enter Complain'), //Enter your Complain
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: kGreenColor,
                      ),
                      // ignore: deprecated_member_use
                      child: TextButton(
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection('Complains')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .set({
                            'complainerUid':
                                FirebaseAuth.instance.currentUser!.uid,
                            'complainBy': userNameController.text.toString(),
                            'complain': complaintConstroller.text.toString(),
                            'ad': widget.ds,
                            'ComplainFor': 'widget.workerAdModel.userUID',
                          });
                          Navigator.pop(context);
                          showToastShort('Your Complain is being registered',
                              kGreenColor); //Your Complain is being registered
                        },
                        child: Center(
                          child: Text('Continue',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
