import 'package:co_working/bloc/home_bloc/home_bloc.dart';
import 'package:co_working/components/size_config.dart';
import 'package:co_working/ui/main_screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () => Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => BlocProvider(
            create: (context) => HomeBloc()..add(const FetchCoworkerEvent()),
          child: const UserDashBoard(),
        ))));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth,
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 3),
            child: Center(
              child:Lottie.asset(
                'assets/lottie/office.json',
                width: SizeConfig.blockWidth * 58,
                height: SizeConfig.blockHeight * 34,
                fit: BoxFit.fill,
              ),
            )
          )
      ),
    );
  }
}
