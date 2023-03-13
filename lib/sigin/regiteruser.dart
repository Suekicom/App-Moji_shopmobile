

import 'package:flutter/material.dart';
import 'package:moji_appmb/sigin/sigin.dart';
class regiter_user extends StatefulWidget {
  const regiter_user({super.key});

  @override
  State<regiter_user> createState() => _regiter_userState();
}

class _regiter_userState extends State<regiter_user> {
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
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      label: Text('User Name',
                          style: TextStyle(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 65,
                  child: TextFormField(
                    keyboardType:TextInputType.emailAddress,
                    decoration: InputDecoration(
                      label: Text('Email_Adress',
                          style: TextStyle(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                    ),
                  ),
                ),
                 SizedBox(height: 10),
                Container(
                  height: 65,
                  child: TextFormField(
                    keyboardType:TextInputType.number,
                    decoration: InputDecoration(
                      label: Text('Password',
                          style: TextStyle(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                    ),
                  ),
                ), SizedBox(height: 10),
                Container(
                  height: 65,
                  child: TextFormField(
                    keyboardType:TextInputType.number,
                    decoration: InputDecoration(
                      label: Text('Confrime_assword',
                          style: TextStyle(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(),
                    ),
                  ),
                ),
                 SizedBox(height: 40),
                GestureDetector(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(child: Text('Register')),
                  ),
                  onTap: () {
                    print('user');
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(''),
                    GestureDetector(
                      child: Text('Login User password !',
                          style: TextStyle(color: Colors.green, fontSize: 12)),
                      onTap: () {
                        print('register');
                           Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Loginuser()));
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
