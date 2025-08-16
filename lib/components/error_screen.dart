import 'package:co_working/components/colors.dart';
import 'package:co_working/components/size_config.dart' show SizeConfig;
import 'package:flutter/material.dart';


Widget errorScreen({required VoidCallback onPressed}){
  return Scaffold(
    body: SafeArea(
      child: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Oops!",
              style: TextStyle(
                  color: COLORS.greenLight,
                  fontFamily: "Poppins",
                  fontSize: SizeConfig.blockWidth * 8.5,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: SizeConfig.blockHeight * 6),
            Text(
              "Something went wrong.\nDont't worry let's try again.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: COLORS.blueLight,
                  fontFamily: "Poppins",
                  fontSize: SizeConfig.blockWidth * 4.5,
                  fontWeight: FontWeight.w500),
            ),

            Container(
              width: SizeConfig.blockWidth * 60,
              height: SizeConfig.blockHeight * 7.2,
              margin: EdgeInsets.only(top: SizeConfig.blockHeight * 4),
              child: ElevatedButton(
                onPressed: (){
                  onPressed();
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(COLORS.greenLight),
                    foregroundColor: MaterialStateProperty.all<Color>(COLORS.whiteDark),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 6)))),
                child: Text(
                  "TRY AGAIN",
                  style: TextStyle(
                      color: COLORS.whiteDark,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Poppins",
                      fontSize: SizeConfig.blockWidth * 4.5),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget loadingWidget(){
  return SizedBox(
    height: SizeConfig.screenHeight,
    width: SizeConfig.screenWidth,
    child: const Center(
      child: CircularProgressIndicator(
        color: COLORS.bluePrimary,
      ),
    ),
  );
}
