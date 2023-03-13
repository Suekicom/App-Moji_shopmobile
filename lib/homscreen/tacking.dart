
import 'package:flutter/material.dart';
import 'package:moji_appmb/formate/formate.dart';
import 'package:moji_appmb/model/order_model.dart';


class OrderSatatus extends StatefulWidget {
  final List<OrderItem > order;
  const OrderSatatus({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderSatatus> createState() => _OrderSatatusState();
}

class _OrderSatatusState extends State<OrderSatatus> {
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
        title: const Text('ສະຖານະລາຍການສັ່ງຊື້',
            style: TextStyle(
                color: Color(0xFF293275),
                fontSize: 18,
                fontFamily: 'noto_semi')),
        centerTitle: true,
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 24, right: 24, bottom: 20),
          height: 210,
          width: screen,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 110,
                child: Column(
                     mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // ignore: prefer_interpolation_to_compose_strings
                        Text(
                            widget.order[0].name +
                                '  ' +
                                widget.order[0].size +
                                ' ' +
                                '(x${widget.order[0].quantity})',
                            style: const TextStyle(
                                color: Color(0xFF5D5D5D),
                                fontSize: 15,
                                fontFamily: 'noto_regular')),
                        Text(
                            nFormat(widget.order[0].price *
                                    widget.order[0].quantity) +
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('ລວມມູນຄ່າ:',
                      style: TextStyle(
                          color: Color(0xFF5D5D5D),
                          fontSize: 15,
                          fontFamily: 'noto_bold')),
                  Row(
                    children: [
                      Text(
                          nFormat(
                              widget.order[0].price * widget.order[0].quantity),
                          style: const TextStyle(
                              fontSize: 17,
                              color: Color(0xFF293275),
                              fontFamily: 'noto_bold')),
                      SizedBox(width: 8),
                      const Text('฿',
                          style: TextStyle(
                              fontSize: 17,
                              color: Color(0xFF293275),
                              fontFamily: 'noto_bold')),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Container(
          width: screen,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('ລະຫັດການສັ່ງຊື້: ',
                  style: TextStyle(
                      color: Color(0xFF5D5D5D),
                      fontSize: 13,
                      fontFamily: 'noto_regular')),
              const Text('ພຸດ, 4/5/2022 12:49: ',
                  style: TextStyle(
                      color: Color(0xFF5D5D5D),
                      fontSize: 13,
                      fontFamily: 'noto_regular')),
              const SizedBox(height: 15),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'icons/check.png',
                                width: 25,
                              ),
                           
                            ],
                          ),
                          const SizedBox(width: 15),
                          const Text('ຮັບອໍເດີ້',
                              style: TextStyle(
                                  color: Color(0xFF293275),
                                  fontSize: 18,
                                  fontFamily: 'noto_me'))
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: const Text('10:00',
                            style: TextStyle(
                                color: Color(0xFF293275),
                                fontSize: 13,
                                fontFamily: 'copo_regular')),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'icons/check.png',
                                width: 25,
                              ),
                            
                            ],
                          ),
                          const SizedBox(width: 15),
                          const Text('ກຳລັງກະກຽມ',
                              style: TextStyle(
                                  color: Color(0xFF293275),
                                  fontSize: 18,
                                  fontFamily: 'noto_me'))
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text('11:00',
                            style: TextStyle(
                                color: Color(0xFF293275),
                                fontSize: 13,
                                fontFamily: 'copo_regular')),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'icons/check.png',
                                width: 25,
                              ),
                          
                            ],
                          ),
                          const SizedBox(width: 15),
                          const Text('ກຳລັງຈັດສົ່ງ',
                              style: TextStyle(
                                  color: Color(0xFF293275),
                                  fontSize: 18,
                                  fontFamily: 'noto_me'))
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: const Text('12:00',
                            style: TextStyle(
                                color: Color(0xFF293275),
                                fontSize: 13,
                                fontFamily: 'copo_regular')),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                'icons/check.png',
                                width: 25,
                              ),
                            ],
                          ),
                          const SizedBox(width: 15),
                          const Text('ຈັດສົ່ງສຳເລັດ',
                              style: TextStyle(
                                  color: Color(0xFF293275),
                                  fontSize: 18,
                                  fontFamily: 'noto_me'))
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: const Text('13:00',
                            style: TextStyle(
                                color: Color(0xFF293275),
                                fontSize: 13,
                                fontFamily: 'copo_regular')),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
