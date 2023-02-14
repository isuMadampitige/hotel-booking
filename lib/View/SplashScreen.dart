import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_stream/View/HomePage.dart';
import 'package:video_stream/View/signInScreen.dart';
import 'package:video_stream/blocs/Auth_bloc.dart';
import 'package:video_stream/transitions/fade_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void pageMap() {
    Future.delayed(const Duration(milliseconds: 3000), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var isLogin = prefs.getBool('isLoggedIn') ?? false;

      if (isLogin) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context, FadeRoute(page: const HomePageScreen()));
      } else {
        // ignore: use_build_context_synchronously
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Provider<AuthBloc>(
            create: (context) => AuthBloc(),
            child: Consumer<AuthBloc>(
              builder: (context, bloc, _) {
                return SignInScreen(bloc: bloc);
                // return DashboardHome();
              },
            ),
          );
        }));
      }
    });
  }

  @override
  void initState() {
    pageMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        child: Center(
          child: Image(
            height: size.height / 4.2,
            width: size.width * 0.8,
            image: const AssetImage('assets/logo.jpg'),
          ),
        ),
      ),
    );
  }
}
