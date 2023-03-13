import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moji_appmb/sigin/constan.dart';


import 'homscreen/Homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kBackGroundColor,
          textTheme: const TextTheme(
            headline4: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            headline6:
                TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
            button: TextStyle(
              color: kPrimaryColor,
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
            ),
          ),
          primarySwatch: Colors.blue,
        ),
        home: screenpage());
  }
}

class screenpage extends StatefulWidget {
  const screenpage({super.key});

  @override
  State<screenpage> createState() => _screenpageState();
}

class _screenpageState extends State<screenpage> {
  @override
  Widget build(BuildContext context) {
    double screen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(235, 120, 119, 119),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: Container(
                width: screen,
                margin: EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "images/logoaccess.png",
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => homepage()),
                        (route) => false);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: kPrimaryColor,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "SHOPPING NOW ...!",
                          style: Theme.of(context).textTheme.button!.copyWith(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 10),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
