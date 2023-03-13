import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moji_appmb/confirmorder/confrimorder.dart';
import 'package:moji_appmb/controller/address_controller.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class EditAddress extends StatefulWidget {
  const EditAddress({
    Key? key,
  }) : super(key: key);

  @override
  State<EditAddress> createState() => _EditAddressState();
}

class _EditAddressState extends State<EditAddress> {
  TextEditingController villege = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController province = TextEditingController();
  TextEditingController districk = TextEditingController();
  Addresscontroller address_controller = Get.put(Addresscontroller());

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
                      primary: Color.fromARGB(255, 50, 83, 89)),
                  child: const Text('ບັນທຶກ',
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFFFFFFFF),
                          fontFamily: 'noto_me')),
                  onPressed: () {
                    address_controller.addItem(1, villege.text, note.text,
                        province.text, districk.text);
                    print(address_controller.items.length);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConfirmOrder(
                                  productbuynowl: [],
                                )));
                  },
                ),
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Column(
                children: [
                  // SizedBox(height: screen1*0.35),
                  Row(
                    children: [
                      Text('ບ້ານ',
                          style: TextStyle(
                              color: Color(0xFFB1B1B1),
                              fontSize: 15,
                              fontFamily: 'noto_regular')),
                    ],
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 20),
                    width: screen,
                    height: 43,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(width: 1, color: Color(0xFFEBEBEB))),
                    child: Container(
                      width: screen,
                      child: TextFormField(
                        controller: villege,
                        keyboardType: TextInputType.emailAddress,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                        decoration: const InputDecoration(
                            hintText: 'ບ້ານ',
                            hintStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontFamily: 'noto_semi'),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: const [
                      Text('ເມືອງ',
                          style: TextStyle(
                              color: Color(0xFFB1B1B1),
                              fontSize: 15,
                              fontFamily: 'noto_regular')),
                    ],
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 20),
                    width: screen,
                    height: 43,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(width: 1, color: Color(0xFFEBEBEB))),
                    child: Container(
                      width: screen,
                      child: TextFormField(
                        controller: districk,
                        keyboardType: TextInputType.emailAddress,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                        decoration: const InputDecoration(
                            hintText: 'ເມືອງ',
                            hintStyle: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF5D5D5D),
                                fontFamily: 'noto_semi'),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: const [
                      Text('ເເຂວງ',
                          style: TextStyle(
                              color: Color(0xFFB1B1B1),
                              fontSize: 15,
                              fontFamily: 'noto_regular')),
                    ],
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 20),
                    width: screen,
                    height: 43,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(width: 1, color: Color(0xFFEBEBEB))),
                    child: Container(
                      width: screen,
                      child: TextFormField(
                        controller: province,
                        keyboardType: TextInputType.emailAddress,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                        decoration: const InputDecoration(
                            hintText: 'ເເຂວງ',
                            hintStyle: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF5D5D5D),
                                fontFamily: 'noto_semi'),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: const [
                      Text('ປ້ອນຂໍ້ມູນເພີ່ມເຕີມ',
                          style: TextStyle(
                              color: Color(0xFFB1B1B1),
                              fontSize: 15,
                              fontFamily: 'noto_regular')),
                    ],
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: screen,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(width: 1, color: Color(0xFFEBEBEB))),
                    child: TextField(
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      controller: note,
                      keyboardType: TextInputType.streetAddress,
                      maxLines: 8,
                      decoration: InputDecoration(
                          hintText: 'ປ້ອນຂໍ້ມູນເພີ່ມເຕີມ',
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF5D5D5D),
                              fontFamily: 'noto_regular'),
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ));
  }
}
