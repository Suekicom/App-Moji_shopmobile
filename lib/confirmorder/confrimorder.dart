import 'dart:math';
import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:moji_appmb/formate/formate.dart';
import 'package:moji_appmb/Chang_money/edit_money.dart';
import 'package:moji_appmb/address/editAddress.dart';
import 'package:moji_appmb/controller/address_controller.dart';
import 'package:moji_appmb/controller/cart_controller.dart';
import 'package:moji_appmb/controller/order_controller.dart';
import 'package:moji_appmb/formate/formate.dart';
import 'package:moji_appmb/homscreen/Homescreen.dart';
import 'package:moji_appmb/model/buynow_model.dart';
import 'package:moji_appmb/controller/payment_controller.dart';

class ConfirmOrder extends StatefulWidget {
  final List<BuynowItem> productbuynowl;
  const ConfirmOrder({Key? key, required this.productbuynowl})
      : super(key: key);

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  CartController cartController = Get.put(CartController());
  PaymentController paymentController = Get.put(PaymentController());
  OrderController orderController = Get.put(OrderController());
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
          title: const Text('ຢືນຢັນການສັ່ງຊື້',
              style: TextStyle(
                  color: Color.fromARGB(255, 50, 83, 89),
                  fontSize: 18,
                  fontFamily: 'noto_semi')),
          centerTitle: true,
        ),
        bottomNavigationBar: SafeArea(
            top: false,
            child: Container(
              margin: EdgeInsets.only(bottom: 18),
              padding: const EdgeInsets.only(left: 24, right: 24),
              width: screen,
              height: 200,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    child: widget.productbuynowl.isEmpty
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: List.generate(
                                cartController.items.length,
                                (index) => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // ignore: prefer_interpolation_to_compose_strings
                                        Text(
                                            cartController.items.values
                                                    .toList()[index]
                                                    .name +
                                                ' ' +
                                                cartController.items.values
                                                    .toList()[index]
                                                    .size +
                                                ' ' +
                                                '(x${cartController.items.values.toList()[index].quantity})',
                                            style: const TextStyle(
                                                color: Color(0xFF5D5D5D),
                                                fontSize: 15,
                                                fontFamily: 'noto_regular')),
                                        Text(
                                            nFormat(cartController.items.values
                                                        .toList()[index]
                                                        .price *
                                                    cartController.items.values
                                                        .toList()[index]
                                                        .quantity) +
                                                '  ฿',
                                            style: TextStyle(
                                                color: Color(0xFF5D5D5D),
                                                fontSize: 15,
                                                fontFamily: 'noto_regular')),
                                      ],
                                    )),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // ignore: prefer_interpolation_to_compose_strings
                                  Text(
                                      widget.productbuynowl[0].name +
                                          '  ' +
                                          widget.productbuynowl[0].size +
                                          ' ' +
                                          '(x${widget.productbuynowl[0].quantity})',
                                      style: const TextStyle(
                                          color: Color(0xFF5D5D5D),
                                          fontSize: 15,
                                          fontFamily: 'noto_regular')),
                                  Text(
                                      nFormat(widget.productbuynowl[0].price *
                                              widget
                                                  .productbuynowl[0].quantity) +
                                          '  ฿',
                                      style: TextStyle(
                                          color: Color(0xFF5D5D5D),
                                          fontSize: 15,
                                          fontFamily: 'noto_regular')),
                                ],
                              ),
                            ],
                          ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: screen,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('ລວມມູນຄ່າ:',
                                style: TextStyle(
                                    color: Color(0xFF5D5D5D),
                                    fontSize: 17,
                                    fontFamily: 'noto_bold')),
                            widget.productbuynowl.isEmpty
                                ? GetBuilder<CartController>(
                                    init: CartController(),
                                    builder: (context) => Row(
                                          children: [
                                            Text(
                                                nFormat(
                                                    cartController.totalAmount),
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    color: Color.fromARGB(
                                                        255, 50, 83, 89),
                                                    fontFamily: 'noto_bold')),
                                            SizedBox(width: 8),
                                            const Text('฿',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    color: Color.fromARGB(
                                                        255, 50, 83, 89),
                                                    fontFamily: 'noto_bold')),
                                          ],
                                        ))
                                : Row(
                                    children: [
                                      Text(
                                          nFormat(
                                              widget.productbuynowl[0].price *
                                                  widget.productbuynowl[0]
                                                      .quantity),
                                          style: const TextStyle(
                                              fontSize: 17,
                                              color: Color.fromARGB(
                                                  255, 50, 83, 89),
                                              fontFamily: 'noto_bold')),
                                      SizedBox(width: 8),
                                      const Text('฿',
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Color.fromARGB(
                                                  255, 50, 83, 89),
                                              fontFamily: 'noto_bold')),
                                    ],
                                  )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: screen,
                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 50, 83, 89)),
                              child: Text('ສັ່ງຊື້',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFFFFFFFF),
                                      fontFamily: 'noto_me')),
                              onPressed: () {
                                if (widget.productbuynowl.isEmpty) {
                                  List.generate(
                                      cartController.items.length,
                                      (index) => {
                                            orderController.addItem(
                                                Random()
                                                    .nextInt(1000000000 + 1),
                                                cartController.items.values
                                                    .toList()[index]
                                                    .id,
                                                cartController.items.values
                                                    .toList()[index]
                                                    .price,
                                                cartController.items.values
                                                    .toList()[index]
                                                    .name,
                                                cartController.items.values
                                                    .toList()[index]
                                                    .image,
                                                cartController.items.values
                                                    .toList()[index]
                                                    .quantity,
                                                cartController.items.values
                                                    .toList()[index]
                                                    .discription,
                                                cartController.items.values
                                                    .toList()[index]
                                                    .size)
                                          });
                                  cartController.clear();
                                  print(orderController.items.length);
                                } else {
                                  orderController.addItem(
                                      Random().nextInt(1000000000 + 1),
                                      widget.productbuynowl[0].id,
                                      widget.productbuynowl[0].price,
                                      widget.productbuynowl[0].name,
                                      widget.productbuynowl[0].image,
                                      widget.productbuynowl[0].quantity,
                                      widget.productbuynowl[0].discription,
                                      widget.productbuynowl[0].size);
                                  print(orderController.items.length);
                                }
                                cartController.clear();
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => homepage()),
                                    (route) => false);
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      Future.delayed(Duration(seconds: 2), () {
                                        Navigator.of(context).pop(true);
                                      });
                                      return AlertDialog(
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        content: Container(
                                          alignment: Alignment.center,
                                          width: 201,
                                          height: 90,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                'icons/check.png',
                                                width: 40,
                                              ),
                                              SizedBox(height: 10),
                                              const Text(
                                                'ທ່ານສັ່ງຊື້ເລັດແລ້ວ',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: 'branding4',
                                                    color: Color(0xFF4D4D4F)),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )),
        body: Stack(
          children: [
            SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('ທີ່ຢູ່ຈັດສົ່ງ',
                          style: TextStyle(
                              color: Color(0xFF5D5D5D),
                              fontSize: 15,
                              fontFamily: 'noto_semi')),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditAddress()));
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.edit_outlined,
                              color: Color.fromARGB(255, 50, 83, 89),
                              size: 20,
                            ),
                            Text('_ ແກ້ໄຂ',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 50, 83, 89),
                                    fontSize: 15,
                                    fontFamily: 'noto_semi')),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: screen,
                    height: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 15),
                  address_controller.items.isEmpty
                      ? SizedBox()
                      : Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                    'ບ້ານ:  ' +
                                        address_controller.items.values
                                            .toList()[0]
                                            .villege,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black)),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                    'ເມືອງ:  ' +
                                        address_controller.items.values
                                            .toList()[0]
                                            .districk,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black)),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                    'ແຂວງ:  ' +
                                        address_controller.items.values
                                            .toList()[0]
                                            .province,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black)),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                    'ຂໍ່ມູນເພີ່ມເຕີມ:  ' +
                                        address_controller.items.values
                                            .toList()[0]
                                            .note,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black)),
                              ],
                            ),
                          ],
                        ),
                  SizedBox(height: screen1 * 0.12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('ວິທີຈ່າຍເງິນ',
                          style: TextStyle(
                              color: Color(0xFF5D5D5D),
                              fontSize: 15,
                              fontFamily: 'noto_semi')),
                      GestureDetector(
                        onTap: () {
                          Get.to(ditMoney());
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.edit_outlined,
                              color: Color.fromARGB(255, 50, 83, 89),
                              size: 20,
                            ),
                            Text('_ ແກ້ໄຂ',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 50, 83, 89),
                                    fontSize: 15,
                                    fontFamily: 'noto_semi')),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: screen,
                    height: 1,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 15),
                  paymentController.items.isEmpty
                      ? SizedBox()
                      : GetBuilder<PaymentController>(
                          init: PaymentController(),
                          builder: (context) => Row(
                                children: [
                                  Image.asset(
                                    paymentController.items[0]!.paymentname
                                                .toString() ==
                                            'ຈ່າຍເງິນສົດປາຍທາງ'
                                        ? 'icons/money.png'
                                        : 'icons/onepay.jpg',
                                    width: paymentController
                                                .items[0]!.paymentname
                                                .toString() ==
                                            'ຈ່າຍເງິນສົດປາຍທາງ'
                                        ? 25
                                        : 35,
                                  ),
                                  const SizedBox(width: 15),
                                  Text(
                                      paymentController.items[0]!.paymentname
                                          .toString(),
                                      style: const TextStyle(
                                          color: Color(0xFF5D5D5D),
                                          fontSize: 15,
                                          fontFamily: 'noto_me'))
                                ],
                              )),
                ],
              ),
            )),
          ],
        ));
  }
}
