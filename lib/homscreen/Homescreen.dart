
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moji_appmb/controller/cart_controller.dart';
import 'package:moji_appmb/homscreen/detail.dart';
import 'package:moji_appmb/Profile.dart/User_drawer.dart';
import 'package:moji_appmb/model/order_model.dart';
import 'package:moji_appmb/productfiles/service.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import '../Cartproducts/Cartproduct.dart';
import '../formate/formate.dart';

List<String> images = ['images/baner.png', 'images/baner.png'];
var selected1 = images[0];

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);
  @override
  State<homepage> createState() => _testState();
}

class _testState extends State<homepage> {
  late ScrollController _scrollController;

//controller & is state functione improt//



  final controller = Get.put(Controller());
  String dropdownvalue = 'ENG';
  var items = [
    'ENG',
    'TH',
    'LA',
    'VN',
    'CHN',
  ];
  @override
  void initState() {
    // initialize scroll controllers
    _scrollController = ScrollController();

    super.initState();
  }

  Map<int, OrderItem> productbuynow = {};
  CartController addtocartcontroller = Get.put(CartController());
  CartController cartController = Get.put(CartController());
  void addItembuy(
    int productId,
    int price,
    String title,
    String image,
    int quantity,
    String description,
    String size,
  ) {
    clear();
    productbuynow.putIfAbsent(
      productId,
      () => OrderItem(
        id: productId.toString(),
        image: image,
        name: title,
        price: price,
        quantity: quantity,
        discription: description,
        size: size,
      ),
    );
  }

  void clear() {
    productbuynow = {};
  }
  int qty = 1;



  @override
  Widget build(BuildContext context) {
    double screen = MediaQuery.of(context).size.width;
    double screen1 = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        //  drawer: AppDrawer(),

   //appbar modle  function//     
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 50, 83, 89),
            toolbarHeight: 110,
            title: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [


     // appbar function search    //           
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 42,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          width: screen * 0.7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 44,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 5, right: 5)),
                                      Text(
                                        'Search',
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontFamily: 'copo_regular',
                                            color: Color(0xFF4D4D4F)),
                                      ),
                                      SizedBox(width: 5),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: Color.fromARGB(
                                                      255, 231, 225, 225))),
                                          width: 42,
                                          height: 42,
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      )
                                    ])),
                              ),
                              GestureDetector(
                                child: Container(
                                    height: 44,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Color(0xFFF2AF21)),
                                    child: Center(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.search,
                                          color: Colors.white,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Text(
                                            'Search',
                                            style: TextStyle(
                                                fontSize: 11,
                                                fontFamily: 'copo_regular',
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ))),
                               
                              )
                            ],
                          ),
                        ),
                      ],
                    ),


    // appbar function search end//
    // appbar function iconcart & person //
                    Row(
                      children: [
                        IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Cartproducts()));
                            },
                            icon: Stack(children: [
                              Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                                size: 25,
                              ),
                              GetBuilder<CartController>(
                                  init: CartController(),
                                  builder: (context) => cartController.itemCount
                                              .toString() ==
                                          '0'
                                      ? Text('')
                                      : Positioned(
                                          right: 0,
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 15,
                                            height: 15,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Colors.red),
                                            child: Text(
                                              cartController.itemCount
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 8,
                                                  fontFamily: 'noto_me'),
                                            ),
                                          )))
                            ])),
                        SizedBox(width: screen * 0.002),
                        GestureDetector(
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 25,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => AppDrawer())));
                          },
                        ),
                      ],
                    ),
// appbar function iconcart & person//



                    // DropdownButton(
                    //   // Initial Value
                    //   value: dropdownvalue,
                    //   // Down Arrow Icon
                    //   icon: const Icon(
                    //     Icons.keyboard_arrow_down,
                    //     color: Colors.white,
                    //     size: 12,
                    //   ),
                    //   // Array list of items
                    //   items: items.map((String items) {
                    //     return DropdownMenuItem(
                    //       value: items,
                    //       child: Text(items,
                    //           style: TextStyle(
                    //               fontSize: 11,
                    //               fontFamily: 'copo_regular',
                    //               color: Colors.grey)),
                    //     );
                    //   }).toList(),
                    //   // After selecting the desired option,it will
                    //   // change button value to selected value
                    //   onChanged: (String? newValue) {
                    //     setState(() {
                    //       dropdownvalue = newValue!;
                    //     });
                    //   },
                    // ),
                  ],
                ),
   // appbar function  menulist//             
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 20,
                  // margin: EdgeInsets.only( left: screen * 0.05, right: screen * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Promotion',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'copo_regular',
                              color: Color.fromARGB(255, 237, 194, 194))),
                      SizedBox(width: 10),
                      Text('Gift Cart',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'copo_regular',
                              color: Color.fromARGB(255, 237, 194, 194))),
                      // SizedBox(width: 10),
                      // Text('Sell on Bundo',
                      //     style: TextStyle(
                      //         fontSize: 12,
                      //          fontWeight: FontWeight.bold,
                      //         fontFamily: 'copo_regular',
                      //         color: Color.fromARGB(255, 237, 194, 194))),
                      SizedBox(width: 10),
                      Text('Track Order ',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'copo_regular',
                              color: Color.fromARGB(255, 237, 194, 194))),
                    ],
                  ),
                ),
    // appbar function  menulist end //              
              ],
            )),


     //************ */ body function app****************//         
        body: WebSmoothScroll(
          controller: _scrollController,
          scrollOffset: 100,
          animationDuration: 600,
          curve: Curves.easeInOutCirc,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Stack(
                    children: [



    //****** */ function  image slide baner**************//                   
                      Container(
                        height: 270,
                        width: screen,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: CarouselSlider(
                          options: CarouselOptions(
                              autoPlayInterval: const Duration(seconds: 5),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 1000),
                              viewportFraction: 1.0,
                              //enableInfiniteScroll: false,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  selected1 = images[index];
                                });
                              },
                              autoPlay: true
                              // autoPlay: false,
                              ),
                          items: images
                              .map((item) => Container(
                                  margin: EdgeInsets.only(
                                      left: screen * 0.05,
                                      right: screen * 0.05),
                                  width: screen,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      item,
                                      fit: BoxFit.values[0],
                                    ),
                                  )))
                              .toList(),
                        ),
                      ),
  //****** */ function  image slide baner end **************//  




                      SizedBox(height: 5),


//****** */ function  image slide category **************// 
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 225, left: 25, right: 25),
                        child: Center(
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 0, right: 0),
                                child: Container(
                                  height: 130,
                                  width: screen,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width: 120,
                                          margin: EdgeInsets.only(
                                              top: 20, bottom: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                'icons/clothing-store.png',
                                                width: screen * 0.1,
                                                height: 57,
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                'Fashion',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.grey),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 120,
                                          color: Colors.grey,
                                        ),
                                        Container(
                                          width: 120,
                                          margin: EdgeInsets.only(
                                              top: 20, bottom: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                'icons/Group18.png',
                                                width: screen * 0.1,
                                                height: 57,
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                'Accessories',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                '& Accessories',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.grey),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 120,
                                          color: Colors.grey,
                                        ),
                                        Container(
                                          width: 120,
                                          margin: EdgeInsets.only(
                                              top: 20, bottom: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                'icons/Group21.png',
                                                width: screen * 0.1,
                                                height: 57,
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                'Home Appliances',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.grey),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 120,
                                          color: Colors.grey,
                                        ),
                                        Container(
                                          width: 120,
                                          margin: EdgeInsets.only(
                                              top: 20, bottom: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                'icons/Group16.png',
                                                width: screen * 0.1,
                                                height: 57,
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                'Beauty',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.grey),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 120,
                                          color: Colors.grey,
                                        ),
                                        Container(
                                          width: 120,
                                          margin: EdgeInsets.only(
                                              top: 20, bottom: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                'icons/Group22.png',
                                                width: screen * 0.1,
                                                height: 57,
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                'Furniture',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.grey),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 120,
                                          color: Colors.grey,
                                        ),
                                        Container(
                                          width: 120,
                                          margin: EdgeInsets.only(
                                              top: 20, bottom: 10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                'icons/volleyball-ball.png',
                                                width: screen * 0.1,
                                                height: 57,
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                'Sport',
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.grey),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

  //****** */ function  product imager**************// 
                      Padding(
                        padding: const EdgeInsets.only(top: 210),
                        child: Container(
                          width: screen,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                images.length,
                                (index) => Container(
                                      margin: const EdgeInsets.all(4),
                                      width: selected1 == images[index]
                                          ? 25.0
                                          : 8.0,
                                      height: 8.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: selected1 == images[index]
                                            ? Color(0xFF293275)
                                            : Colors.grey.shade300,
                                      ),
                                    )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /// menu see all & products tione
                Container(
                  margin: EdgeInsets.only(left: 8, right: 8, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Featured Products',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'copo_regular',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF717171))),
                      // Row(
                      //   children: [
                      //     GestureDetector(
                      //       child: Text('SEE ALL',
                      //           style: TextStyle(
                      //               fontSize: 14,
                      //               fontFamily: 'copo_regular',
                      //               fontWeight: FontWeight.bold,
                      //               color: Color(0xFF60DFFF))),
                      //       onTap: (() {
                      //         print(controller.productList.length.toString());
                      //       }),
                      //     ),
                      //     Icon(
                      //       Icons.arrow_right,
                      //       color: Colors.green,
                      //       size: 18,
                      //     ),
                      //   ],
                      // )
                    ],
                  ),
                ),
                Container(
                  //  margin: EdgeInsets.only(left: 250, right: 260),
                  width: screen,
                  height: 1,
                  color: Colors.grey,
                ),
                SizedBox(height: 7),
                Container(
                    //  margin: EdgeInsets.only(left: 250, right: 260, top: 20),
                    width: screen,
                    height: screen1,
                    color: Colors.white,
                    child: Obx(() {
                      if (controller.isLoading.value) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return Center(
                          child: SingleChildScrollView(
                            child: Wrap(
                              spacing: 12,
                              runSpacing: 10,
                              // children: [

                              //   Image.network(controller.productList.length.toString())
                              // ],
                              children: List.generate(
                                  controller.productList.length,
                                  (index) => Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Wrap(
                                          children: [
                                            Container(
                                              //   height: screen ,
                                              width: 160,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Color(0xFFF8F8F8),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    GestureDetector(
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image.network(
                                                          controller
                                                              .productList[
                                                                  index]
                                                              .image
                                                              .toString(),
                                                          height: 100,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: ((context) => detail(
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
                                                                    product: []))));

                                                        print(controller
                                                            .productList[index]
                                                            .id);
                                                      },
                                                    ),
                                                    SizedBox(height: 10),
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                              controller
                                                                  .productList[
                                                                      index]
                                                                  .name
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .grey))
                                                        ]),
                                                    SizedBox(height: 20),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20,
                                                              right: 20),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                              nFormat(
                                                                controller
                                                                    .productList[
                                                                        index]
                                                                    .price,
                                                              ),
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .grey)),
                                                          Text(' ฿',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12)),
                                                          SizedBox(width: 30),
                                                          GestureDetector(
                                                            child: Icon(
                                                                Icons
                                                                    .shopping_cart,
                                                                color:
                                                                    Colors.pink,
                                                                size: 30),
                                                            onTap: () {
                                                              addtocartcontroller.addItem(
                                                                  controller
                                                                      .productList[
                                                                          index]
                                                                      .id!
                                                                      .toInt(),
                                                                  controller
                                                                      .productList[
                                                                          index]
                                                                      .id!
                                                                      .toInt(),
                                                                  controller
                                                                      .productList[
                                                                          index]
                                                                      .price!
                                                                      .toInt(),
                                                                  controller
                                                                      .productList[
                                                                          index]
                                                                      .name
                                                                      .toString(),
                                                                  controller
                                                                      .productList[
                                                                          index]
                                                                      .image
                                                                      .toString(),
                                                                  qty,
                                                                  controller
                                                                      .productList[
                                                                          index]
                                                                      .description
                                                                      .toString(),
                                                                  '');

                                                              showDialog(
                                                                  barrierDismissible:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    Future.delayed(
                                                                        Duration(
                                                                            seconds:
                                                                                1),
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop(
                                                                              true);
                                                                    });
                                                                    return AlertDialog(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white,
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(20)),
                                                                      content:
                                                                          Container(
                                                                        alignment:
                                                                            Alignment.center,
                                                                        width:
                                                                            201,
                                                                        height:
                                                                            90,
                                                                        child:
                                                                            Column(
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
                                                                              style: TextStyle(fontSize: 15, fontFamily: 'branding4', color: Color(0xFF4D4D4F)),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  });
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(height: 30)
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                            ),
                          ),
                        );
                      }
                    }))
              ],
            ),
          ),
        ));
  }
}
