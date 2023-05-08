import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class OwnNote extends StatefulWidget {
  String Note;
  OwnNote({required this.Note});

  @override
  State<OwnNote> createState() => _OwnNoteState();
}

class _OwnNoteState extends State<OwnNote> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.024,
            child: const AutoSizeText(
              'Din note fra denne træning',
              style: TextStyle(fontSize: 200),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.064,
            child: AutoSizeText(
              widget.Note,
              style: const TextStyle(fontSize: 250),
            ),
          ),
        ],
      ),
    );
  }
}
