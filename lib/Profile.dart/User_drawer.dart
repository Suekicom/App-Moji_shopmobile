import 'package:flutter/material.dart';
import 'package:moji_appmb/Chang_money/edit_money.dart';
import 'package:moji_appmb/Profile.dart/user.dart';
import 'package:moji_appmb/address/address.dart';
import 'package:moji_appmb/homscreen/Homescreen.dart';
import 'package:moji_appmb/homscreen/orderproducts.dart';
import 'package:moji_appmb/sigin/regiteruser.dart';
import 'package:moji_appmb/sigin/sigin.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    double screen = MediaQuery.of(context).size.width;
    double screen1 = MediaQuery.of(context).size.height;
    return Drawer(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), bottomRight: Radius.circular(30))),
      child: SafeArea(
          top: false,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(25),
                    width: 500,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(30)),
                      color: Color(0xFFE5EFF6),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        Icon(Icons.person,
                            size: 89, color: Color.fromARGB(255, 50, 83, 89)),
                        SizedBox(height: 20),
                        Container(
                          alignment: Alignment.center,
                          width: 176,
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Color.fromARGB(255, 50, 83, 89),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Loginuser()));
                                  },
                                  child: Text('ເຂົ້າສູ່ລະບົບ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'noto_me',
                                          fontSize: 15))),
                              const Text('/',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'noto_me')),
                              TextButton(
                                  onPressed: () {
                                     Navigator.push(context, MaterialPageRoute(builder: (context)=>regiter_user()));
                                  },
                                  child: Text(
                                    'ສ້າງບັນຊີ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'noto_me',
                                        fontSize: 15),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: screen,
                    height: 46,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, elevation: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 5),
                          Container(
                              width: 30,
                              padding: EdgeInsets.all(6),
                              child: Icon(Icons.history,
                                  size: 35,
                                  color: Color.fromARGB(255, 50, 83, 89))),
                          SizedBox(width: 25),
                          const Text('ປະຫວັດການສັ່ງຊື້',
                              style: TextStyle(
                                  color: Color(0xFF5D5D5D),
                                  fontFamily: 'noto_regular',
                                  fontSize: 15)),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => orderproducts()));
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: screen,
                    height: 46,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, elevation: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 5),
                          Container(
                              width: 30,
                              padding: EdgeInsets.all(6),
                              child: Icon(Icons.person,
                                  size: 35,
                                  color: Color.fromARGB(255, 50, 83, 89))),
                          SizedBox(width: 25),
                          Text('ໂປຣໄຟລ',
                              style: TextStyle(
                                  color: Color(0xFF5D5D5D),
                                  fontFamily: 'noto_regular',
                                  fontSize: 15)),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => user()));
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: screen,
                    height: 46,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, elevation: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 5),
                          Container(
                              width: 30,
                              padding: EdgeInsets.all(7),
                              child: Icon(Icons.location_city,
                                  size: 35,
                                  color: Color.fromARGB(255, 50, 83, 89))),
                          SizedBox(width: 25),
                          Text('ທີ່ຢູ່ຈັດສົ່ງ',
                              style: TextStyle(
                                  color: Color(0xFF5D5D5D),
                                  fontFamily: 'noto_regular',
                                  fontSize: 15)),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Address()));
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: screen,
                    height: 46,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, elevation: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 5),
                          Container(
                              width: 30,
                              padding: EdgeInsets.all(6),
                              child: Icon(Icons.payment,
                                  size: 25,
                                  color: Color.fromARGB(255, 50, 83, 89))),
                          SizedBox(width: 25),
                          Text('ຊ່ອງທາງການຈ່າຍເງິນ',
                              style: TextStyle(
                                  color: Color(0xFF5D5D5D),
                                  fontFamily: 'noto_regular',
                                  fontSize: 15)),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ditMoney()));
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: screen,
                    height: 46,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, elevation: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 5),
                          Container(
                              width: 30,
                              padding: EdgeInsets.all(6),
                              child: Icon(
                                Icons.settings,
                                size: 35,
                                color: Color.fromARGB(255, 50, 83, 89),
                              )),
                          SizedBox(width: 25),
                          Text('ຕັ້ງຄ່າ',
                              style: TextStyle(
                                  color: Color(0xFF5D5D5D),
                                  fontFamily: 'noto_regular',
                                  fontSize: 15)),
                        ],
                      ),
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> language()));
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 30,
                child: Container(
                  width: screen,
                  height: 46,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 50, 83, 89), elevation: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 5),
                        Container(
                            width: 30,
                            padding: EdgeInsets.all(6),
                            child: Icon(
                              Icons.logout,
                              size: 25,
                            )),
                        SizedBox(width: 15),
                        Text('ອອກຈາກລະບົບ',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'noto_regular',
                                fontSize: 15)),
                      ],
                    ),
                    onPressed: () {
                       Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>  homepage()));
                    
                    },
                  ),
                ),
              )
            ],
          )),
    );
  }
}
