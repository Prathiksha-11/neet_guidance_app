import 'package:flutter/material.dart';
import 'package:neet_guidance/screens/admin/add_centers.dart';
import 'package:neet_guidance/screens/welcome.dart';
//import 'package:placement_prep/screens/welcome/admin_technology.dart';
//import '../add_event.dart';
//import '../welcome.dart';
//import 'alumniform.dart';

class AdminHome extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DashBoard"),
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 110),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 100 ),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: new MaterialButton(
                        height: 170.0,
                        minWidth: 170.0,
                        color: Color(0xff453658),
                        textColor: Colors.white,
                        child: Column(
                          children: [
                            Icon(Icons.post_add,color: Colors.black,size: 70,),
                            SizedBox(height: 20,),
                            new Text("Posts"),
                          ],
                        ),

                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AddCenters()),)
                        },
                        splashColor: Colors.redAccent,
                      )),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: new MaterialButton(
                        height: 170.0,
                        minWidth: 170.0,
                        color: Color(0xff453658),
                        textColor: Colors.white,
                        child: Column(
                          children: [
                            Icon(Icons.insert_chart_outlined,color: Colors.black,size: 60,),
                            SizedBox(height: 20,),
                            new Text("Technologies"),
                          ],
                        ),
                        onPressed: () => {
                         // Navigator.push(context, MaterialPageRoute(builder: (context) => Technologyform()),)
                        },
                        splashColor: Colors.redAccent,
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: new MaterialButton(
                        height: 170.0,
                        minWidth: 170.0,
                        color: Color(0xff453658),
                        textColor: Colors.white,
                        child: Column(
                          children: [
                            Icon(Icons.rate_review_outlined,color: Colors.black,size: 60,),
                            SizedBox(height: 20,),
                            new Text("Alumni Reviews"),
                          ],
                        ),
                        onPressed: () => {
                        //  Navigator.push(context, MaterialPageRoute(builder: (context) => Alumniform()),)
                        },
                        splashColor: Colors.redAccent,
                      )),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: new MaterialButton(
                        height: 170.0,
                        minWidth: 170.0,
                        color: Color(0xff453658),
                        textColor: Colors.white,
                        child: Column(
                          children: [
                            Icon(Icons.logout,color: Colors.black,size: 60,),
                            SizedBox(height: 20,),
                            new Text("Logout"),
                          ],
                        ),
                        onPressed: () => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()),)
                        },
                        splashColor: Colors.redAccent,
                      )),
                ],
              ),

            ],
          )),
    );
  }
}

