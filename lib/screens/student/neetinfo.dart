import 'dart:ui';
import 'package:flutter/material.dart';

class NeetInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Neet Information',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Architects',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      backgroundColor: Colors.white,

      body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    top: 30.0, left: 20.0, right: 20.0, bottom: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'NEET (UG) is one of the toughest medical entrance examinations conducted in India. National Eligibility cum Entrance Test is conducted by the National Testing Agency (NTA) '
                          'for admission to undergraduate (MBBS/BDS/Ayush Courses) every year. As per Government of India, it is a mandated requirement to qualify NEET Exam to study medical'
                          ' courses in India and abroad. NTA NEET2021 Exam will be conducted on 1st week of May 2021. Before Start NEET 2021 Preparation. Aspirants Need to Know the Complete'
                          ' process & important Exam Date or Application form of NEET 2021',
                      //textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Image.asset("images/medical.jpg",height: 250,),
                    SizedBox(height: 20,),
                    Text('Official website : www.nta.ac.in ',
                      //textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
