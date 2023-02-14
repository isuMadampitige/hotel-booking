import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_stream/View/HomePage.dart';
import 'package:video_stream/blocs/Auth_bloc.dart';
import 'package:video_stream/models/ThemeModel.dart';
import 'package:video_stream/transitions/fade_route.dart';
import 'package:video_stream/widgets/texts.dart';

class SignInScreen extends StatefulWidget {
  final AuthBloc bloc;

  const SignInScreen({Key? key, required this.bloc}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernamecotroller = TextEditingController();
  TextEditingController passwordcotroller = TextEditingController();

  String email = '';
  String password = '';
  // bool _value = false;
  bool obsucuretext = true;
  Map? _info;
  String deviceName = '';
  String deviceVersion = '';
  String identifier = '';

  @override
  void initState() {
    super.initState();
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
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
                width: size.width,
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.2,
                    ),
                    SizedBox(
                      height: size.height * 0.26,
                      child: const Center(
                        child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/logo.jpg'),
                          width: 300,
                        ),
                      ),
                    ),
                    Container(
                      // color: Colors.red,
                      height: size.height * 5 / 10,
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      // color: Colors.blue,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: size.height * 0.1,
                            ),
                            SizedBox(
                              height: size.height * 0.055,
                              width: size.width * 0.9,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue[800],
                                  onPrimary: Colors.blue[100],
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                ),
                                onPressed: () async {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  UserCredential user = await widget.bloc
                                      .authenticateUser(context);
                                  print(user);
                                  if (user != null) {
                                    // ignore: use_build_context_synchronously
                                    Navigator.pushReplacement(
                                        context,
                                        FadeRoute(
                                            page: const HomePageScreen()));
                                  }
                                },
                                child: Texts.headline3(
                                    'Login', themeModel.textColorwhite),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
