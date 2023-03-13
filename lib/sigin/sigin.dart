

import 'package:flutter/material.dart';
import 'package:moji_appmb/sigin/regiteruser.dart';

class Loginuser extends StatefulWidget {
  const Loginuser({super.key});

  @override
  State<Loginuser> createState() => _LoginuserState();
}

class _LoginuserState extends State<Loginuser> {
  @override
  Widget build(BuildContext context) {
    double screen = MediaQuery.of(context).size.width;
    double screen1 = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 50, 83, 89),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 80,right: 10,left: 10),
          
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person, size: 120, color: Colors.white),
                SizedBox(height: 40),
                Container(
                  height: 65,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      label: Text('Email_Address',
                          style: TextStyle(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 65,
                  child: TextFormField(
                    keyboardType:TextInputType.number,
                    decoration: InputDecoration(
                      label: Text('User_Password',
                          style: TextStyle(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                    ),
                  ),
                ),
                 SizedBox(height: 30 ),

                 Text('Forgot Password ?.',style: TextStyle(color: Colors.yellow, fontSize: 12)),
                SizedBox(height: 30),
                GestureDetector(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(child: Text('LOGIN')),
                  ),
                  onTap: () {
                    print('user');
                  },
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(''),
                    GestureDetector(
                      child: Text('Create Account & Register User',
                          style: TextStyle(color: Colors.green, fontSize: 12)),
                      onTap: () {
                        print('register');
                           Navigator.push(context,
                          MaterialPageRoute(builder: (context) => regiter_user()));
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
