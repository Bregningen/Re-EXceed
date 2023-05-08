import 'package:flutter/material.dart';

class Kostplan extends StatefulWidget {
  const Kostplan({Key? key}) : super(key: key);

  @override
  State<Kostplan> createState() => _KostplanState();
}

class _KostplanState extends State<Kostplan> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.94,
      height: MediaQuery.of(context).size.height * 0.2,
      child: InkWell(
        onTap: () {},
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular((40))),
          elevation: 0,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text('Start en kostplan',
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.red,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }
}
