import 'package:flutter/material.dart';

class EditName extends StatefulWidget {
  const EditName({Key? key}) : super(key: key);

  @override
  State<EditName> createState() => _EditNameState();
}

class _EditNameState extends State<EditName> {
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
        title: const Text('ຊື່ ແລະ ນາມສະກຸນ',
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
                             Navigator.pop(context);
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
                
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Text('ຊື່',
                        style: TextStyle(
                            color: Color(0xFFB1B1B1),
                            fontSize: 15,
                            fontFamily: 'noto_regular')),
                  ],
                ),
                SizedBox(height: 5),
                Container(
                      padding:  EdgeInsets.only(left: 10,top: 20),
                      width: screen * 0.90,
                      height: 43,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,border: Border.all(width: 1,color: Color(0xFFEBEBEB))),
                      child: Container(
                        width: screen * 0.90,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(fontSize: 16,color: Colors.black),
                          decoration: const InputDecoration(
                              hintText: 'ຊື່',
                              hintStyle:
                                  TextStyle(fontSize: 14, color: Color(0xFF5D5D5D),fontFamily: 'noto_semi'),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                SizedBox(height: 10),
                 Row(
                  children: [
                     Padding(padding: EdgeInsets.only(left: 20)),
                    Text('ນາມສະກຸນ',
                        style: TextStyle(
                            color: Color(0xFFB1B1B1),
                            fontSize: 15,
                            fontFamily: 'noto_regular')),
                  ],
                ),
                SizedBox(height: 5),
                Container(
                      padding:  EdgeInsets.only(left: 10,top: 20),
                      width: screen * 0.90,
                      height: 43,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,border: Border.all(width: 1,color: Color(0xFFEBEBEB))),
                      child: Container(
                        width: screen * 0.90,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(fontSize: 16,color: Colors.black),
                          decoration: const InputDecoration(
                              hintText: 'ນາມສະກຸນ',
                              hintStyle:
                                  TextStyle(fontSize: 14, color: Color(0xFF5D5D5D),fontFamily: 'noto_semi'),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
