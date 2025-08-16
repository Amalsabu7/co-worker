import 'package:co_working/components/colors.dart';
import 'package:co_working/components/size_config.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  String desc;
  BookingScreen({super.key,required this.desc});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.whiteDark,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockWidth * 6,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.blockHeight * 3,),
                  Container(
                    height: SizeConfig.blockHeight * 27,
                    width: SizeConfig.blockWidth * 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 2),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 2),
                        child: Image.asset(
                          "assets/images/coworking.jpg",
                          fit: BoxFit.fill,
                        )
                    ),
                  ),

                  SizedBox(height: SizeConfig.blockHeight * 3,),
                  Text(
                      widget.desc,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: COLORS.black,
                          fontFamily: "Poppins",
                          fontSize: SizeConfig.blockWidth * 4.4,
                          fontWeight: FontWeight.w500)
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 1,),
                  Text(
                      "9 AM to 10 PM",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: COLORS.black,
                          fontFamily: "Poppins",
                          fontSize: SizeConfig.blockWidth * 4.4,
                          fontWeight: FontWeight.w500)
                  ),


                  SizedBox(height: SizeConfig.blockHeight * 1,),



                  Text(
                      "Details:",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: COLORS.black,
                          fontFamily: "Poppins",
                          fontSize: SizeConfig.blockWidth * 3.8,
                          fontWeight: FontWeight.w500)
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 1,),
                  Text(
                    "These spaces foster productivity and networking by bringing together people from diverse industries under one roof. Members can choose flexible plans—hourly, daily, or monthly—depending on their needs. With a focus on convenience, creativity",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: COLORS.blackLight,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.blockWidth * 3),
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 1,),
              /*    SizedBox(
                    width: SizeConfig.blockWidth * 100,
                    height: SizeConfig.blockHeight * 7,
                    child: ElevatedButton(
                        onPressed: () {

                        },
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(
                                COLORS.green),
                            foregroundColor:
                            MaterialStateProperty.all<Color>(
                                COLORS.green),
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.blockWidth * 2)))),
                        child: buttonTitle(title: "Book Now")),
                  ),*/
                ],
              ),
            ),
          )
      ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockWidth * 6,
              vertical: SizeConfig.blockHeight * 3),
          child: ElevatedButton(
              onPressed: () {
                const snackBar = SnackBar(content: Text("Booking is successful"));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(
                      COLORS.green),
                  foregroundColor:
                  MaterialStateProperty.all<Color>(
                      COLORS.green),
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all<
                      RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              SizeConfig.blockWidth * 2)))),
              child: buttonTitle(title: "Book Now"))),
      
    );
  }

  Widget buttonTitle({required String title}) {
    return Text(
      title,
      style: TextStyle(
          color: COLORS.whiteDark,
          fontWeight: FontWeight.w400,
          fontFamily: "Poppins",
          letterSpacing: 0.8,
          fontSize: SizeConfig.blockWidth * 4),
    );
  }
}
