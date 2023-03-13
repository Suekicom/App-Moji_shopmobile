import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moji_appmb/address/editAddress.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    double screen = MediaQuery.of(context).size.width;
    double screen1 = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 75,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Container(
          margin: const EdgeInsets.only(left: 22),
          child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xff717171),
              )),
        ),
        title: const Text('ທີ່ຢູ່ຈັດສົ່ງ',
            style: TextStyle(
                color: Color.fromARGB(255, 50, 83, 89),
                fontSize: 18,
                fontFamily: 'noto_semi')),
        centerTitle: true,
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 24, right: 24, bottom: 18),
          height: 60,
          child: Container(
            margin: EdgeInsets.only(top: 10),
            width: screen,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 50, 83, 89),
                ),
                child: Text('ເພີ່ມທີ່ຢູ່',
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFFFFFFFF),
                        fontFamily: 'noto_me')),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditAddress()));
                },
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 100),
          Center(
            child: Text('ທ່ານຍັງບໍ່ມີທີ່ຢູ່',
                style: TextStyle(
                    color: Color.fromARGB(255, 50, 83, 89),
                    fontSize: 16,
                    fontFamily: 'noto_regular')),
          )
        ],
      )),
    );
  }
}
