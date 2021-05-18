import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
FirebaseUser loggedInUser;
class HomeScreen extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String userMail = " ";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuser_details();
  }

  void getuser_details() async{
    final user = await _auth.currentUser;
    if (user != null) {
      loggedInUser = user as FirebaseUser;
      userMail=loggedInUser.email;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),

        title: Text(
          'Alerts and Announcements',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Architects',
            fontWeight: FontWeight.w700,
          ),
        ),

      ),
    );
  }
}
