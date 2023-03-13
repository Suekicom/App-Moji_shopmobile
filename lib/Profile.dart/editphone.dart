import 'package:flutter/material.dart';

class EditPhone extends StatefulWidget {
  const EditPhone({Key? key}) : super(key: key);

  @override
  State<EditPhone> createState() => _EditPhoneState();
}

class _EditPhoneState extends State<EditPhone> {
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
        title: const Text('ເບີໂທລະສັບ',
            style: TextStyle(
                color: Color(0xFF293275),
                fontSize: 18,
                fontFamily: 'noto_semi')),
        centerTitle: true,
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          margin:const EdgeInsets.only(left: 24,right: 24,bottom: 20),
          width: screen,
          child:  Container(
                  width: screen,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Color(0xFF293275)),
                      child:const Text('ບັນທຶກ',style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFFFFFFFF),
                                  fontFamily: 'noto_me')),onPressed: (){
                           
                                  },),
                  ),
                ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: screen,
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Column(
              children: [
                SizedBox(height: 30),
                Row(
                  children: const [
                    Text('ເບີໂທລະສັບ',
                        style: TextStyle(
                            color: Color(0xFFB1B1B1),
                            fontSize: 15,
                            fontFamily: 'noto_regular')),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Container(
                      height: 43,
                      width: screen*0.20,
                     decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,border: Border.all(width: 1,color: Color(0xFFEBEBEB))),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(),
                                      child: Container(
                                       
                                          child: Image.asset(
                                        'icons/laos.png',
                                        width: 25,
                                      )),
                                    ),
                                    SizedBox(width: 5),
                                    Padding(
                                        padding: EdgeInsets.only(top: 0),
                                        child: Container(child: Text('+856', style: TextStyle(
                            color: Color(0xFF5D5D5D),
                            fontSize: 15,
                            fontFamily: 'noto_regular')))),
                                  ],
                                ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding:  EdgeInsets.only(left: 10,top: 20),
                      width: screen * 0.62,
                      height: 43,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,border: Border.all(width: 1,color: Color(0xFFEBEBEB))),
                      child: Container(
                        width: screen * 0.90,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(fontSize: 16),
                          decoration: const InputDecoration(
                              hintText: 'ເບີໂທລະສັບ',
                              hintStyle:
                                  TextStyle(fontSize: 14, color: Color(0xFF5D5D5D),fontFamily: 'noto_semi'),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}