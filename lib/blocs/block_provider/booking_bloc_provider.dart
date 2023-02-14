import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:video_stream/models/RoomModel.dart';

class BookingProvider with ChangeNotifier {
  int totalDays = 0;
  int total = 0;

  void setToatalDays(int days, RoomModel room) {
    totalDays = days;
    total = days * room.price;
    notifyListeners();
  }
}
