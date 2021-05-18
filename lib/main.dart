import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neet_guidance/screens/sign_up.dart';
import 'models/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get.dart';
import 'package:neet_guidance/services/auth_service.dart';
import 'package:neet_guidance/widgets/provider_widget.dart';
import 'package:neet_guidance/screens/student/homescreen.dart';
final firestoreInstance = FirebaseFirestore.instance;
final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth:AuthService(),
      child: MaterialApp(
        title: 'Neet Guidance App',
        theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.greenAccent,

        ),
        home: SignUpView(),
        routes: {
          'signupview' : (BuildContext context) => SignUpView(authFormType:AuthFormType.signUp),
          'HomeScreen': (ctx) => HomeController(),
        },
      ),
    );
  }
}

class HomeController extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? HomeScreen(): SignUpView(authFormType:AuthFormType.signUp);
        }
        return CircularProgressIndicator();
      },
    );
  }
}






