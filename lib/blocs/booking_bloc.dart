import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:video_stream/models/RoomModel.dart';
import 'package:video_stream/services/Firebase_service.dart';

class BookingBloc {
  Future<List<RoomModel>> getRooms(BuildContext context) async {
    List<RoomModel> roomList = [];
    try {
      roomList = await FirebaseService.getHotelRooms(context);
      print("room list fetched.$roomList");
    } catch (e) {
      print(e);
    }
    return roomList;
  }

  Future<bool> saveBooking(BuildContext context, String name, String startDate,
      String endDate) async {
    bool result = false;
    try {
      result =
          await FirebaseService.makeBooking(context, name, startDate, endDate);
      print("room list fetched.$result");
    } catch (e) {
      print(e);
    }
    return result;
  }

  Future<int> getAllBookingdForPerson(String name) async {
    int? result;
    try {
      result = await FirebaseService.getAllBookingdForPerson(name);
      print("result$result");
    } catch (e) {
      print(e);
    }
    return result!;
  }
}
