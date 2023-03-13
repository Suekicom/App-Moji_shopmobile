import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moji_appmb/controller/order_controller.dart';
import 'package:moji_appmb/formate/formate.dart';
import 'package:moji_appmb/homscreen/detail.dart';
import 'package:moji_appmb/homscreen/tacking.dart';
import 'package:moji_appmb/productfiles/service.dart';

List<String> images = [
  'images/baner.png',
];
var selected1 = images[0];

class orderproducts extends StatefulWidget {
  const orderproducts({Key? key}) : super(key: key);

  @override
  _orderproductsState createState() => _orderproductsState();
}

class _orderproductsState extends State<orderproducts> {
  OrderController orderController = Get.put(OrderController());

// Initial Selected Value

  final controller = Get.put(Controller());

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
                color: Color.fromARGB(255, 50, 83, 89),
              )),
        ),
        title: const Text('ປະຫວັດການສັ່ງຊື້',
            style: TextStyle(
                color: Color.fromARGB(255, 50, 83, 89),
                fontSize: 18,
                fontFamily: 'noto_semi')),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  orderController.items.length,
                  (index) => GestureDetector(
                        onTap: () {
                           Get.to(OrderSatatus(order: orderController.items.values.where((element) => element.id ==  orderController.items.values.toList()[index].id).toList(),));
                        },
                        child: Container(
                          width: screen,
                          color: Colors.white,
                          margin: EdgeInsets.only(bottom: 19),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(10),
                                      width: 89,
                                      height: 89,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Color(0xFFE5EFF9)),
                                      child: Image.network(orderController
                                          .items.values
                                          .toList()[index]
                                          .image)),
                                  SizedBox(width: 16),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          orderController.items.values
                                              .toList()[index]
                                              .name,
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 50, 83, 89),
                                              fontSize: 15,
                                              fontFamily: 'noto_bold')),
                                      SizedBox(height: 30),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                          nFormat(orderController.items.values
                                                  .toList()[index]
                                                  .price *
                                              orderController.items.values
                                                  .toList()[index]
                                                  .quantity),
                                          style: const TextStyle(
                                              fontSize: 17,
                                              color: Color.fromARGB(
                                                  255, 50, 83, 89),
                                              fontFamily: 'noto_bold')),
                                      const SizedBox(width: 8),
                                      const Text('฿',
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Color.fromARGB(
                                                  255, 50, 83, 89),
                                              fontFamily: 'noto_bold')),
                                    ],
                                  ),
                                  const SizedBox(height: 30),
                                  Container(
                                    width: 114,
                                    height: 26,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(7),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary:
                                              Color.fromARGB(255, 50, 83, 89),
                                        ),
                                        child: const Text('ສັ່ງຊື້ອີກຄັ້ງ',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Color(0xFFFFFFFF),
                                                fontFamily: 'noto_me')),
                                        onPressed: () {
                                          Get.to(detail(
                                                                    category: controller
                                                                        .productList[
                                                                            index]
                                                                        .category
                                                                        .toString(),
                                                                    image: controller
                                                                        .productList[
                                                                            index]
                                                                        .image
                                                                        .toString(),
                                                                    name: controller
                                                                        .productList[
                                                                            index]
                                                                        .name
                                                                        .toString(),
                                                                    price: controller
                                                                        .productList[index]
                                                                        .price!
                                                                        .toInt(),
                                                                    index: index,
                                                                    description: controller.productList[index].description.toString(),
                                                                    id: controller.productList[index].id!.toInt(),
                                                                    size: controller.productList[index].size.toString(),
                                                                    product: []) );
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
            ),
          ),
        ),
      ),
    );
  }
}
