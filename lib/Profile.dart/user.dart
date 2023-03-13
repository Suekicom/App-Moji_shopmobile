import 'package:flutter/material.dart';
import 'package:moji_appmb/Profile.dart/editname.dart';

class user extends StatefulWidget {
  const user({Key? key}) : super(key: key);

  @override
  State<user> createState() => _logInState();
}

class _logInState extends State<user> {
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
        title: const Text('ໂປຼຟາຍ',
            style: TextStyle(
                color: Color(0xFF293275),
                fontSize: 18,
                fontFamily: 'noto_semi')),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Container(
          width: screen,
          child: Column(
            children: [
              Container(
                width: 86,
                height: 86,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(43),
                    child:
                        Image.asset('images/profile.png', fit: BoxFit.cover)),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  //getimage1();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.edit_outlined,
                      color: Color(0xFF293275),
                      size: 20,
                    ),
                    Text('_ ແກ້ໄຂ',
                        style: TextStyle(
                            color: Color(0xFF293275),
                            fontSize: 15,
                            fontFamily: 'noto_semi')),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(10),
                width: screen * 0.90,
                height: 73,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(color: Color(0xFFEBEBEB), width: 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('ຊື່',
                            style: TextStyle(
                                color: Color(0xFFA8A8A8),
                                fontSize: 15,
                                fontFamily: 'noto_regular')),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const EditName()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.edit_outlined,
                                color: Color(0xFF293275),
                                size: 20,
                              ),
                              Text('_ ແກ້ໄຂ',
                                  style: TextStyle(
                                      color: Color(0xFF293275),
                                      fontSize: 15,
                                      fontFamily: 'noto_semi')),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: 6),
                    // Text(controller.photoList[0].name.toString(),
                    //     style: TextStyle(
                    //         color: Color(0xFF5D5D5D),
                    //         fontSize: 18,
                    //         fontFamily: 'copo_regular'))
                  ],
                ),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(10),
                width: screen * 0.90,
                height: 73,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(color: Color(0xFFEBEBEB), width: 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('ເບີໂທລະສັບ',
                            style: TextStyle(
                                color: Color(0xFFA8A8A8),
                                fontSize: 15,
                                fontFamily: 'noto_regular')),
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const EditPhone()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.edit_outlined,
                                color: Color(0xFF293275),
                                size: 20,
                              ),
                              Text('_ ແກ້ໄຂ',
                                  style: TextStyle(
                                      color: Color(0xFF293275),
                                      fontSize: 15,
                                      fontFamily: 'noto_semi')),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    // Text(controller.photoList[0].phone.toString(),
                    //     style: TextStyle(
                    //         color: Color(0xFF5D5D5D),
                    //         fontSize: 18,
                    //         fontFamily: 'copo_regular'))
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
