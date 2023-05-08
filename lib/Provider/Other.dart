import 'package:flutter/material.dart';

class Other {
  List<String> TypeofTraining = [];
  Other({required this.TypeofTraining});
}

class OtherProvider with ChangeNotifier {
  Other OtherItems = Other(TypeofTraining: ['Springtræning', 'Løbetræning']);

  //funktion til at tilføje en træningstype
  void addTypeOfTrainging(item) {
    OtherItems.TypeofTraining.add(item);
    notifyListeners();
  }
}
