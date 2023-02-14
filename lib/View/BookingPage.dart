import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:video_stream/Utills/Uttils.dart';
import 'package:video_stream/blocs/block_provider/booking_bloc_provider.dart';
import 'package:video_stream/blocs/booking_bloc.dart';
import 'package:video_stream/models/RoomModel.dart';
import 'package:video_stream/models/ThemeModel.dart';
import 'package:video_stream/widgets/text_fields.dart';
import 'package:video_stream/widgets/texts.dart';

class BookingPage extends StatefulWidget {
  RoomModel room;
  BookingPage({Key? key, required this.room}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernamecotroller = TextEditingController();
  TextEditingController startDateC = TextEditingController();
  TextEditingController endDatec = TextEditingController();
  DateTime startDate = DateTime.now();
  DateTime? endDate;
  BookingBloc bloc = BookingBloc();

  Future<DateTime> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000, 8),
        lastDate: DateTime(2024),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
              primarySwatch: Colors.grey,
              splashColor: Colors.black,
              textTheme: const TextTheme(
                subtitle1: TextStyle(color: Colors.black),
                button: TextStyle(color: Colors.black),
              ),
              accentColor: Colors.black,
              colorScheme: const ColorScheme.light(
                  primary: Color(0xFF0063E8),
                  primaryVariant: Colors.black,
                  secondaryVariant: Colors.black,
                  onSecondary: Colors.black,
                  onPrimary: Colors.white,
                  surface: Colors.black,
                  onSurface: Colors.black,
                  secondary: Colors.black),
              dialogBackgroundColor: Colors.white,
            ),
            child: child ?? Text(""),
          );
        });

    // if (picked != null && picked != selectedDate) {
    //   // setState(() {
    //   //   selectedDate = picked;
    //   //   print(selectedDate);
    //   // });
    // }
    return picked!;
  }

  @override
  void initState() {
    super.initState();

    // Future.delayed(Duration.zero, () async {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final themeModel = Provider.of<ThemeModel>(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Make Booking"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12, left: 10),
                    child: Row(
                      children: [
                        Flexible(
                          child: Texts.subheads(
                              'You are going to make booking with ${widget.room.type}',
                              themeModel.priceColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12, left: 10),
                    child: Row(
                      children: [
                        Texts.subheads('Your Name', themeModel.secondTextColor),
                      ],
                    ),
                  ),
                  InputTextField(
                    controller: usernamecotroller,
                    hintText: "Your Name",
                    lableText: "Your Name",
                  ),
                  SizedBox(
                    height: size.height * 1 / 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12, left: 10),
                    child: Row(
                      children: [
                        Texts.subheads(
                            'Start Date', themeModel.secondTextColor),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28.0),
                            // color: const Color(0xfff2f2f2),
                          ),
                          child: TextFormField(
                            controller: startDateC,
                            validator: (input) =>
                                input!.trim().isEmpty ? "Can't be empty" : null,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 20.0),
                              suffixIcon: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                elevation: 1,
                                child: CircleAvatar(
                                    backgroundColor: Colors.white54,
                                    child: IconButton(
                                        onPressed: () async {
                                          DateTime startdate =
                                              await _selectDate(context);

                                          String stDate =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(startdate);
                                          setState(() {
                                            startDate = startdate;
                                            startDateC.text = stDate;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.calendar_month_outlined,
                                          color: Colors.black54,
                                        ))),
                              ),
                              hintText: "yyyy-MM-dd",
                              labelText: "Start Date",

                              // counterStyle: TextStyle(color: fontColor),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.black12,
                                  width: 2.0,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.redAccent,
                                  width: 2.0,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.redAccent,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            readOnly: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 1 / 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12, left: 10),
                    child: Row(
                      children: [
                        Texts.subheads('End Date', themeModel.secondTextColor),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28.0),
                            // color: const Color(0xfff2f2f2),
                          ),
                          child: TextFormField(
                            controller: endDatec,
                            validator: (input) =>
                                input!.trim().isEmpty ? "Can't be empty" : null,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 20.0),
                              suffixIcon: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                elevation: 1,
                                child: CircleAvatar(
                                    backgroundColor: Colors.white54,
                                    child: IconButton(
                                        onPressed: () async {
                                          DateTime enddate =
                                              await _selectDate(context);
                                          String enDate =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(enddate);
                                          setState(() {
                                            endDate = enddate;
                                            endDatec.text = enDate;
                                          });
                                          int difference = Utility.daysBetween(
                                              startDate, enddate);
                                          // ignore: use_build_context_synchronously
                                          Provider.of<BookingProvider>(context,
                                                  listen: false)
                                              .setToatalDays(
                                                  difference, widget.room);
                                        },
                                        icon: const Icon(
                                          Icons.calendar_month_outlined,
                                          color: Colors.black54,
                                        ))),
                              ),
                              hintText: "yyyy-MM-dd",
                              labelText: "End Date",

                              // counterStyle: TextStyle(color: fontColor),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.black12,
                                  width: 2.0,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.redAccent,
                                  width: 2.0,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                  color: Colors.redAccent,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            readOnly: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Consumer<BookingProvider>(
                      builder: (context, bookigProvider, _) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child:
                                Texts.subheads('Total', themeModel.priceColor),
                          ),
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
                                      "${bookigProvider.total.toString()} LKR",
                                      themeModel.textColor),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  SizedBox(
                    height: size.height * 0.055,
                    width: size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[800],
                        onPrimary: Colors.blue[100],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                      ),
                      onPressed: () async {
                        FocusScope.of(context).requestFocus(FocusNode());
                        await bloc.saveBooking(
                            context,
                            usernamecotroller.text.toString(),
                            startDateC.text.toString(),
                            endDatec.text.toString());
                      },
                      child:
                          Texts.headline3('Submit', themeModel.textColorwhite),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
