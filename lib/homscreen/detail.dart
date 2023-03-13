import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:moji_appmb/Cartproducts/Cartproduct.dart';
import 'package:moji_appmb/confirmorder/confrimorder.dart';
import 'package:moji_appmb/controller/cart_controller.dart';
import 'package:moji_appmb/formate/formate.dart';
import 'package:moji_appmb/model/buynow_model.dart';
import 'package:moji_appmb/productfiles/product_api.dart';
import 'package:moji_appmb/productfiles/service.dart';

class detail extends StatefulWidget {
  int price;
  String name, category, image, description, size;
  int index;
  int id;
  final List<Products> product;

  int qty = 1;
  detail({
    Key? key,
    required,
    required this.category,
    required this.image,
    required this.name,
    required this.price,
    required this.index,
    required this.description,
    required this.id,
    required this.product,
    required this.size,
  }) : super(key: key);

  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {
  final controller = Get.put(Controller());

  final controller1 = Get.put(Controller());

  Map<int, BuynowItem> productbuynow = {};

  CartController cartController = Get.put(CartController());
  void addItembuy(
    int productId,
    int price,
    String title,
    String image,
    int quantity,
    String discription,
    String size,
  ) {
    clear();
    productbuynow.putIfAbsent(
      productId,
      () => BuynowItem(
        id: productId,
        image: image,
        name: title,
        price: price,
        quantity: quantity,
        discription: discription,
        size: size,
      ),
    );
  }

  void clear() {
    productbuynow = {};
  }

  int qty = 0;
  @override
  Widget build(BuildContext context) {
    double screenw = MediaQuery.of(context).size.width;
    double screenh = MediaQuery.of(context).size.height;
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
        title: Text(
          'Detail',
          style: TextStyle(
              fontSize: 18,
              fontFamily: 'noto_me',
              color: Color.fromARGB(255, 50, 83, 89)),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Cartproducts()));
                },
                icon: Stack(children: [
                  Icon(
                    Icons.shopping_cart,
                    color: Color.fromARGB(255, 50, 83, 89),
                    size: 30,
                  ),
                  GetBuilder<CartController>(
                      init: CartController(),
                      builder: (context) =>
                          cartController.itemCount.toString() == '0'
                              ? Text('')
                              : Positioned(
                                  right: 0,
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 15,
                                    height: 15,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.red),
                                    child: Text(
                                      cartController.itemCount.toString(),
                                      style: TextStyle(
                                          fontSize: 8, fontFamily: 'noto_me'),
                                    ),
                                  )))
                ])),
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 5,
                  top: 20,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),
                  child: Column(children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        height: screenh * 0.40,
                        width: screenw * 0.85,
                        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            widget.image.toString(),
                          ),
                        )),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('ລາຄາ ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 50, 83, 89),
                            )),
                        Text(
                          nFormat(widget.price),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 50, 83, 89),
                          ),
                        ),
                        Text(' ฿',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 50, 83, 89),
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: Text(
                        widget.description.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 50, 83, 89),
                        ),
                      ),
                    ),
                    SizedBox(height: 100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              child: Container(
                                margin: EdgeInsets.only(right: 3),
                                width: screenw * 0.43,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 50, 83, 89)),
                                child: Center(
                                  child: Text(
                                    'Addtocart',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              onTap: () {
                                cartController.addItem(
                                  widget.id,
                                  widget.id,
                                  widget.price,
                                  widget.name,
                                  widget.image,
                                  qty,
                                  widget.description,
                                  '',
                                );
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) {
                                      Future.delayed(Duration(seconds: 1), () {
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
                                                'ເພີ່ມເຂົ້າກະຕ່າສຳເລັດແລ້ວ',
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
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            child: Container(
                              margin: EdgeInsets.only(right: 3),
                              width: screenw * 0.43,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromARGB(255, 50, 83, 89)),
                              child: Center(
                                child: Text(
                                  'Buynown',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            onTap: () {
                              addItembuy(
                                  widget.id,
                                  widget.price,
                                  widget.name,
                                  widget.image,
                                  widget.qty,
                                  widget.description,
                                  widget.size);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ConfirmOrder(
                                            productbuynowl:
                                                productbuynow.values.toList(),
                                          )));
                            },
                          ),
                        ),
                      ],
                    )
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
