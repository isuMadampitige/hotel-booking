import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_stream/View/BookingPage.dart';
import 'package:video_stream/models/RoomModel.dart';
import 'package:video_stream/models/ThemeModel.dart';
import 'package:video_stream/transitions/fade_route.dart';
import 'package:video_stream/widgets/texts.dart';

class RoomCard extends StatefulWidget {
  final RoomModel room;

  const RoomCard({Key? key, required this.room}) : super(key: key);

  @override
  State<RoomCard> createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> {
  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeModel>(context);
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.pink[50],
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
                child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SizedBox(
                        // width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Texts.headline3(
                                widget.room.type, themeModel.textColor),
                            Card(
                              elevation: 2,
                              color: Colors.amber,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 8),
                                child: Row(
                                  children: [
                                    Texts.subheads(
                                        "${widget.room.price.toString().padLeft(2, '0')} LKR",
                                        themeModel.textColor),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    FadeRoute(
                                        page: BookingPage(
                                      room: widget.room,
                                    )));
                              },
                              child: Card(
                                elevation: 2,
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 8),
                                  child: Row(
                                    children: [
                                      Texts.subheads(
                                          "Book", themeModel.textColor),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(
                          children: [
                            Flexible(
                              child: Texts.descriptionText(
                                  widget.room.desc, themeModel.textColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
