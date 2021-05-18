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
          'DashBoard',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Architects',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: StreamBuilder(
        // ignore: deprecated_member_use
        stream: Firestore.instance.collection("CoachingCenter").snapshots(),
        builder: (context, snapshot){
          if(snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot data = snapshot.data.documents[index];
                return Card(
                  child: ExpansionTile(
                    title: Text(
                      data['Name'],
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w700),
                    ),
                    children: <Widget>[

                      ListTile(
                        title: Text('Register Deadline : ' +
                            data['Time'],
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ), ListTile(
                        title: Text('Fees : ' +
                            data['Fees'],
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ),

                      ListTile(
                        title: Text('Contact : ' +
                            data['Number'],
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }else{
            return Center(child: Text('Loading ...'));
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child:
              Center(
                child: Text('Hello '+ userMail,style: TextStyle(
                  fontSize:20.0,
                ),),
              ),

            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Profile', style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,

              ),),
              onTap: (){
                //Navigator.push(context,MaterialPageRoute(builder: (context) => Getotherdetails(userdetails: newUser,)),);
              },
            ),
            ListTile(
                leading: Icon(Icons.person_outline_rounded),
                title: Text('My Profile',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                ),

                onTap: () {
                  //Navigator.pushNamed(context,'Displayuserdetails');
                }
            ),
            ListTile(
                leading: Icon(Icons.playlist_add_check_rounded),
                title: Text('IOT',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                ),

                onTap: () {
                  Navigator.pushNamed(context, 'topics3');
                }
            ),
            ListTile(
                leading: Icon(Icons.psychology_outlined),
                title: Text('Quiz',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                ),

                onTap: () {
                //  Navigator.pushNamed(context, 'splash');
                }
            ),
            ListTile(
                leading: Icon(Icons.insert_chart_outlined),
                title: Text('Latest Technologies',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                ),

                onTap: () {
                //  Navigator.pushNamed(context, 'technology');
                }
            ),
            ListTile(
                leading: Icon(Icons.question_answer_sharp),
                title: Text('Chatbot',style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
                ),

                onTap: () {
                 // Navigator.pushNamed(context, 'Chatbot');
                }
            ),

            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out',style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontFamily: 'Architects',

              ),),
              onTap: () {
                _auth.signOut();
                Navigator.pushNamedAndRemoveUntil(context, 'Welcome', (route) => false);
              },
            ),

          ],
        ),
      ),
    );
  }
}
