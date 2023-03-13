import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:moji_appmb/confirmorder/confrimorder.dart';
import 'package:moji_appmb/controller/cart_controller.dart';
import 'package:moji_appmb/controller/payment_controller.dart';
import 'package:moji_appmb/formate/formate.dart';
import 'package:moji_appmb/model/buynow_model.dart';
import 'package:moji_appmb/model/order_model.dart';
import 'package:moji_appmb/productfiles/service.dart';

class Cartproducts extends StatefulWidget {
  Cartproducts({super.key});

  @override
  State<Cartproducts> createState() => _CartproductsState();
}

class _CartproductsState extends State<Cartproducts> {
  Map<int, BuynowItem> productbuynow = {};
  final Controller controller = Get.find();
  final CartController cartcontroller = Get.put(CartController());
  CartController cartController = Get.put(CartController());

  PaymentController paymentController = Get.put(PaymentController());
  bool edit = false;

  @override
  Widget build(BuildContext context) {
    double screen = MediaQuery.of(context).size.width;
    double screen1 = MediaQuery.of(context).size.height;
    return Scaffold(
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
        title: const Text('ກະຕ່າ',
            style: TextStyle(
                color: Color.fromARGB(255, 50, 83, 89),
                fontSize: 18,
                fontFamily: 'noto_semi')),
        centerTitle: true,
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        init: CartController(),
        builder: (context) => cartController.itemCount.toString() == '0'
            ? Container(
                height: 1,
              )
            : SafeArea(
                child: Container(
                  margin: EdgeInsets.only(left: 24, right: 24),
                  width: screen,
                  height: 120,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('ລວມມູນຄ່າ:',
                              style: TextStyle(
                                  color: Color(0xFF5D5D5D),
                                  fontSize: 17,
                                  fontFamily: 'noto_bold')),
                          GetBuilder<CartController>(
                              init: CartController(),
                              builder: (context) => Row(
                                    children: [
                                      Text(nFormat(cartController.totalAmount),
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Color.fromARGB(
                                                  255, 50, 83, 89),
                                              fontFamily: 'noto_bold')),
                                      SizedBox(width: 8),
                                      Text('฿',
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Color.fromARGB(
                                                  255, 50, 83, 89),
                                              fontFamily: 'noto_bold')),
                                    ],
                                  ))
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                            margin: EdgeInsets.only(top: 20),
                            width: screen,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 50, 83, 89),
                            ),
                            child: TextButton(
                              child: Text('ສັ່ງຊື້',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'noto_regular')),
                              onPressed: () {
                                Get.to(ConfirmOrder(productbuynowl: []));
                              },
                            )),
                      )
                    ],
                  ),
                ),
              ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: GetBuilder<CartController>(
              init: CartController(),
              builder: (context) => cartController.itemCount.toString() == '0'
                  ? Center(
                      child: Column(
                        children: [
                          SizedBox(height: 100),
                          Image.asset(
                            'icons/cart.png',
                            width: 70,
                          ),
                          SizedBox(height: 10),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: const Text('ທ່ານຍັງບໍ່ມິລາຍການໃນກະຕ່າ',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 50, 83, 89),
                                    fontSize: 12,
                                    fontFamily: 'noto_regular')),
                          )
                        ],
                      ),
                    )
                  : Column(
                      children: [
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'ທ່ານມີ  ' +
                                    cartController.itemCount.toString() +
                                    '  ລາຍການໃນກະຕ່າ',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 50, 83, 89),
                                    fontSize: 11,
                                    fontFamily: 'noto_semi')),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  edit = !edit;
                                });
                              },
                              child: Container(
                                  color: Colors.white,
                                  child: edit == false
                                      ? Row(
                                          children: const [
                                            Icon(
                                              Icons.edit_outlined,
                                              color: Color.fromARGB(
                                                  255, 50, 83, 89),
                                              size: 20,
                                            ),
                                            Text('_ ແກ້ໄຂ',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 50, 83, 89),
                                                    fontSize: 15,
                                                    fontFamily: 'noto_semi')),
                                          ],
                                        )
                                      : GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              edit = !edit;
                                            });
                                          },
                                          child: Container(
                                            child: const Icon(
                                              Icons.close,
                                              color: Color.fromARGB(
                                                  255, 50, 83, 89),
                                              size: 25,
                                            ),
                                          ),
                                        )),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        GetBuilder<CartController>(
                            init: CartController(),
                            builder: (context) => Column(
                                  children: List.generate(
                                      cartController.items.length,
                                      (index) => Container(
                                            margin: EdgeInsets.only(bottom: 19),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                        padding:
                                                            EdgeInsets.all(2),
                                                        width: 89,
                                                        height: 89,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            color: Color(
                                                                0xFFE5EFF9)),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          child: Image.network(
                                                              cartController
                                                                  .items.values
                                                                  .toList()[
                                                                      index]
                                                                  .image),
                                                        )),
                                                    SizedBox(width: 16),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            cartController
                                                                .items.values
                                                                .toList()[index]
                                                                .name,
                                                            style: const TextStyle(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        50,
                                                                        83,
                                                                        89),
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    'noto_bold')),
                                                        SizedBox(height: 13),
                                                        edit != false
                                                            ? Container(
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        if (cartController.items.values.toList()[index].quantity <=
                                                                            1) {
                                                                          // cartController.removeitem(int.parse(cartcontroller
                                                                          //     .items
                                                                          //     .values
                                                                          //     .toList()[index]
                                                                          //     .id));
                                                                        } else {
                                                                          cartController
                                                                              .delete(
                                                                            int.parse(cartcontroller.items.values.toList()[index].id),
                                                                            cartController.items.values.toList()[index].id,
                                                                            cartController.items.values.toList()[index].price,
                                                                            cartController.items.values.toList()[index].name,
                                                                            cartController.items.values.toList()[index].image,
                                                                            cartController.items.values.toList()[index].quantity,
                                                                            cartController.items.values.toList()[index].discription,
                                                                            cartController.items.values.toList()[index].size,
                                                                          );
                                                                        }
                                                                      },
                                                                      child: Image
                                                                          .asset(
                                                                        'icons/remove.png',
                                                                        width:
                                                                            28,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            12),
                                                                    Text(
                                                                        cartController
                                                                            .items
                                                                            .values
                                                                            .toList()[
                                                                                index]
                                                                            .quantity
                                                                            .toString(),
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                17,
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                50,
                                                                                83,
                                                                                89),
                                                                            fontFamily:
                                                                                'noto_bold')),
                                                                    const SizedBox(
                                                                        width:
                                                                            12),
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        cartController
                                                                            .addItem(
                                                                          int.parse(cartcontroller
                                                                              .items
                                                                              .values
                                                                              .toList()[index]
                                                                              .id),
                                                                          cartController
                                                                              .items
                                                                              .values
                                                                              .toList()[index]
                                                                              .id,
                                                                          cartController
                                                                              .items
                                                                              .values
                                                                              .toList()[index]
                                                                              .price,
                                                                          cartController
                                                                              .items
                                                                              .values
                                                                              .toList()[index]
                                                                              .name,
                                                                          cartController
                                                                              .items
                                                                              .values
                                                                              .toList()[index]
                                                                              .image,
                                                                          cartController
                                                                              .items
                                                                              .values
                                                                              .toList()[index]
                                                                              .quantity,
                                                                          cartController
                                                                              .items
                                                                              .values
                                                                              .toList()[index]
                                                                              .discription,
                                                                          cartController
                                                                              .items
                                                                              .values
                                                                              .toList()[index]
                                                                              .size,
                                                                        );
                                                                      },
                                                                      child: Image
                                                                          .asset(
                                                                        'icons/add.png',
                                                                        width:
                                                                            16,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              )
                                                            : Container(
                                                                height: 28,
                                                              )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                            nFormat(
                                                                cartController
                                                                    .items
                                                                    .values
                                                                    .toList()[
                                                                        index]
                                                                    .price),
                                                            style: const TextStyle(
                                                                fontSize: 17,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        50,
                                                                        83,
                                                                        89),
                                                                fontFamily:
                                                                    'noto_bold')),
                                                        const SizedBox(
                                                            width: 8),
                                                        const Text('฿',
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        50,
                                                                        83,
                                                                        89),
                                                                fontFamily:
                                                                    'noto_bold')),
                                                      ],
                                                    ),
                                                    SizedBox(height: 19),
                                                    edit != false
                                                        ? IconButton(
                                                            onPressed: () {
                                                              cartController.removeitem(int.parse(
                                                                  cartcontroller
                                                                      .items
                                                                      .values
                                                                      .toList()[
                                                                          index]
                                                                      .id));
                                                            },
                                                            icon: Image.asset(
                                                              'icons/datete.png',
                                                              width: 28,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      50,
                                                                      83,
                                                                      89),
                                                            ))
                                                        : Container()
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )),
                                ))
                      ],
                    ),
            )),
      ),
    );
  }
}
