import 'package:flutter/material.dart';
import 'package:video_stream/blocs/booking_bloc.dart';
import 'package:video_stream/models/RoomModel.dart';
import 'package:video_stream/widgets/Room_card.dart';
import 'package:video_stream/widgets/texts.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  BookingBloc bloc = BookingBloc();
  late Future<List<RoomModel>> myfuture;
  late Future<int> totalbookings;

  @override
  void initState() {
    super.initState();
    myfuture = bloc.getRooms(context);
    totalbookings = bloc.getAllBookingdForPerson("isuru");
    // Future.delayed(Duration.zero, () async {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hotel Booking"),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: Column(
                  children: [
                    FutureBuilder<List<RoomModel>>(
                        future: myfuture,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.isEmpty) {
                              ///If no product
                              return Center(
                                child: Column(
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(top: 30),
                                      child: Text('Nothing found!',
                                          textAlign: TextAlign.center),
                                    )
                                  ],
                                ),
                              );
                            } else {
                              return Expanded(
                                child: SizedBox(
                                  height: MediaQuery.of(context).size.height,
                                  child: Container(
                                    child: snapshot.data!.isNotEmpty
                                        ? ListView.builder(
                                            shrinkWrap: true,
                                            // itemExtent: MediaQuery.of(context).size.width * 0.3,
                                            itemCount: snapshot.data!.length,
                                            // scrollDirection: Axis.vertical,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return RoomCard(
                                                room: snapshot.data![index],
                                              );
                                            },
                                          )
                                        : Container(),
                                  ),
                                ),
                              );
                            }
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.blue),
                              ),
                            );
                          }
                        }),
                  ],
                ),
              ),
              FutureBuilder<int>(
                  future: totalbookings,
                  builder: (context, snapshot) {
                    print(snapshot.data);
                    if (snapshot.data == null) {
                      ///If no product
                      return Center(
                        child: Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Text('Nothing found!',
                                  textAlign: TextAlign.center),
                            )
                          ],
                        ),
                      );
                    } else {
                      return Expanded(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Texts.subheads(
                                  "Total bookings have made from user - ",
                                  Colors.green),
                              Container(
                                child: snapshot.data != null
                                    ? Texts.subheads(
                                        "${snapshot.data} ", Colors.green)
                                    : Container(),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
