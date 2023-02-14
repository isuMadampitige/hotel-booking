import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:video_stream/models/RoomModel.dart';
import 'package:video_stream/widgets/dailogs.dart';

class FirebaseService {
  static Future<List<RoomModel>> getHotelRooms(BuildContext context) async {
    List<RoomModel> rooms = [];
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("room")
          .get(); //get the data
      print(querySnapshot);
      rooms = querySnapshot.docs
          .map((e) => RoomModel.fromMap(e.data() as Map<String, dynamic>))
          .toList();
      print(rooms);
    } catch (e) {
      print(e);
    }

    return rooms;
  }

  static Future<bool> makeBooking(BuildContext context, String name,
      String startDate, String endDate) async {
    bool result = false;
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('booking');

      users.add({
        'name': name,
        'start_date': startDate,
        'end_date': endDate
      }).then((value) {
        result = true;
        showDialogMsg(context, "Successfully updated!", "Information");
      }).catchError((error) => print("Failed to add user: $error"));
    } catch (e) {
      print(e);
    }
    print(result);
    return result;
  }

  static Future<int> getAllBookingdForPerson(String name) async {
    QuerySnapshot<Map<String, dynamic>> documentList;
    documentList = await FirebaseFirestore.instance
        .collection("booking")
        .where("name", isEqualTo: name)
        .get();
    print(documentList.docs.length);
    return documentList.docs.length;
  }
}
