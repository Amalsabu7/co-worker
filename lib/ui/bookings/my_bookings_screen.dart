import 'package:co_working/components/colors.dart';
import 'package:co_working/components/size_config.dart';
import 'package:flutter/material.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  List<Map<String,dynamic>> bookingList = [
    {
      "title": "Awis",
      "dateTime": "19-Aug 9AM to 10PM",
      "status": "Upcoming",
    },
    {
      "title": "Incuspaze",
      "dateTime": "16-Aug 9AM to 10PM",
      "status": "Upcoming",
    },
    {
      "title": "Dotspace",
      "dateTime": "17-Aug 9AM to 10PM",
      "status": "Upcoming",
    },
    {
      "title": "Space One",
      "dateTime": "10-Aug 9AM to 10PM",
      "status": "Completed",
    },
    {
      "title": "Co space",
      "dateTime": "09-Aug 9AM to 10PM",
      "status": "Completed",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.whiteDark,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockWidth*4,
                vertical: SizeConfig.blockHeight*3
            ),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: bookingList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(
                      vertical: SizeConfig.blockHeight * 2),
                  padding: EdgeInsets.only(
                      right: SizeConfig.blockWidth * 3,
                      left: SizeConfig.blockWidth * 2,
                      top: SizeConfig.blockHeight * 1,
                      bottom: SizeConfig.blockHeight * 1,
                  ),
                  decoration: BoxDecoration(
                    color: COLORS.whiteDark,
                    borderRadius: BorderRadius.circular(
                        SizeConfig.blockWidth * 2),
                    boxShadow: const [
                      BoxShadow(
                        color: COLORS.whiteBlue,
                        spreadRadius: 0,
                        blurRadius: 1,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(
                            Radius.circular(
                                SizeConfig.blockWidth * 2)),
                        child: Container(
                            height: SizeConfig.blockHeight * 8,
                            width: SizeConfig.blockWidth * 12,
                            decoration: BoxDecoration(
                              color: COLORS.whiteDark,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(SizeConfig.blockWidth * 2)),
                            ),

                            child: Image.asset(
                              "assets/images/coworking.jpg",
                              fit: BoxFit.fill,
                            )
                        ),
                      ),
                      SizedBox(
                          width: SizeConfig.blockWidth * 4
                      ),
                      SizedBox(
                        width: SizeConfig.blockWidth*46,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                          Text(
                          "${bookingList[index]["title"]}",
                          style: TextStyle(
                              color: COLORS.blueDark,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.blockWidth * 4.4),
                        ),
                                SizedBox(
                                    width: SizeConfig.blockWidth*2
                                ),
                            Text(
                              "${bookingList[index]["dateTime"]}",
                              style: TextStyle(
                                  color: COLORS.blueDark,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                  fontSize: SizeConfig.blockWidth * 4.2),
                            ),

                          ],
                        ),
                      ),
                      const Spacer(),
                      Text(
                        bookingList[index]["status"],
                        style: TextStyle(
                            color:  bookingList[index]["status"] == "Completed"
                                ? COLORS.green
                                : COLORS.redDark,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: SizeConfig.blockWidth * 4),
                      )
                    ],
                  ),
                );
              },),
          ),
        )
      ),
    );
  }
}
