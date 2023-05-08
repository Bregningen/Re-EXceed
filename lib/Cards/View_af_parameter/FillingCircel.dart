import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rexceed/Helpers/appColors.dart';

class FillingCircel extends StatefulWidget {
  final double progress;
  final double size;
  final Color backgroundColor;
  final Color progressColor;
  const FillingCircel(
      {super.key,
      required this.backgroundColor,
      required this.progress,
      required this.progressColor,
      required this.size});

  @override
  State<FillingCircel> createState() => _FillingCircelState();
}

class _FillingCircelState extends State<FillingCircel> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.size),
      child: SizedBox(
        height: widget.size,
        width: widget.size,
        child: Stack(children: [
          Container(
            color: widget.backgroundColor,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: widget.size * widget.progress,
              color: widget.progressColor,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.25,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: AutoSizeText(
                  '${(widget.progress * 100).toStringAsFixed(2)}%',
                  maxLines: 1,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      fontSize: 250, color: AppColors.textColor),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
