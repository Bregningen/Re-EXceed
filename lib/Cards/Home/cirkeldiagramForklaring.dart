import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CirkelDiagramForklaring extends StatelessWidget {
  Color color;
  String text;
  CirkelDiagramForklaring({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.042,
            child: AutoSizeText(
              this.text,
              textAlign: TextAlign.center,
              style: TextStyle(color: this.color, fontSize: 250),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
            width: MediaQuery.of(context).size.width * 0.06,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: this.color,
                  borderRadius: BorderRadius.all(Radius.circular(50))),
            ),
          )
        ],
      ),
    );
  }
}
