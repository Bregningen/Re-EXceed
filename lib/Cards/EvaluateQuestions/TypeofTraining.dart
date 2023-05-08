import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexceed/Provider/Other.dart';
import 'package:rexceed/sider/evaluate.dart';
import '../../Helpers/appColors.dart';

class TypeOfTraining extends StatefulWidget {
  List<String> DropwodnItems;
  String dropdownvalue;
  TypeOfTraining({
    required this.dropdownvalue,
    required this.DropwodnItems,
    super.key,
  });

  @override
  State<TypeOfTraining> createState() => _TypeOfTrainingState();
}

@override
final NameOfTrainingType = TextEditingController();
String TheName = '';

class _TypeOfTrainingState extends State<TypeOfTraining> {
  bool ischanged = false;
  String dropdownValue = '';
  @override
  Widget build(BuildContext context) {
    List<String> items = widget.DropwodnItems;
    if (!ischanged) {
      dropdownValue = widget.DropwodnItems.first;
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: DropdownButton<String>(
        iconSize: 50,
        dropdownColor: AppColors.clarit.withOpacity(0.8),
        onChanged: (String? newvalue) {
          //This is called when the user selects an item.
          setState(() {
            TheName = newvalue!;
            ischanged = true;
            NameOftheTraining = newvalue;
          });
        },
        value: ischanged ? TheName : dropdownValue,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        style: const TextStyle(color: AppColors.white, fontSize: 35),
        isExpanded: true,
      ),
    );
  }
}
