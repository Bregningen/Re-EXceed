import 'package:flutter/material.dart';

class Premiumfeture extends StatelessWidget {
  const Premiumfeture({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Center(
            child: Stack(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('Assets/stjerner.png'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Du  har fundet en premiun Feature',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 50,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          color: Colors.yellow,
                          child: Text(
                            'Køb premium!',
                            style: TextStyle(fontSize: 50),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ))
                ],
              ),
            ]),
          )),
    );
  }
}
