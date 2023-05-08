import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rexceed/sider/evaluate.dart';

import '../../Helpers/appColors.dart';

class EVSliderQ extends StatefulWidget {
  String question;
  int number;
  bool viewside;

  EVSliderQ(
      {super.key,
      required this.question,
      required this.number,
      required this.viewside});
  @override
  State<EVSliderQ> createState() => _EVSliderState();
}

class _EVSliderState extends State<EVSliderQ> {
  double rating = 0;

  List<String> pics = [
    'Emoji_smile',
    'Slightly_smile',
    'meh_emoji',
    'sad',
    'Crying_emoji'
  ];
  @override
  Widget build(BuildContext context) {
    if (widget.viewside) {
      rating = widget.number.toDouble();
    }
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.95,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: AutoSizeText(
            widget.question,
            group: AutoSizeGroup(),
            style: const TextStyle(color: AppColors.textColor, fontSize: 25),
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width * 0.95,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: false,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.width * 0.172,
                              width: MediaQuery.of(context).size.width * 0.172,
                              decoration: BoxDecoration(
                                  color: rating == index
                                      ? AppColors.Main_color
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Image.asset(
                                    'Assets/Evaluate/${pics[index]}.png'),
                              )),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
        Visibility(
            visible: widget.viewside,
            child: SizedBox(height: MediaQuery.of(context).size.height * 0.02)),
        Visibility(
          visible: !widget.viewside,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Slider(
              thumbColor: AppColors.Main_color,
              activeColor: AppColors.clarit,
              inactiveColor: AppColors.Main_color,
              value: rating,
              onChanged: (newrating) {
                if (widget.viewside == false) {
                  if (widget.number == 0) {
                    setState(() {
                      rating = newrating;
                      Overall = newrating.toInt();
                    });
                  }
                  if (widget.number == 1) {
                    setState(() {
                      rating = newrating;
                      ConIndex = newrating.toInt();
                    });
                  }
                  if (widget.number == 2) {
                    setState(() {
                      rating = newrating;
                      Desireindex = newrating.toInt();
                    });
                  }
                }
              },
              divisions: 4,
              min: 0,
              max: 4,
            ),
          ),
        )
      ]),
    );
  }
}
