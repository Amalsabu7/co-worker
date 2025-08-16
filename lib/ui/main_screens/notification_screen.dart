import 'package:co_working/components/colors.dart';
import 'package:co_working/components/size_config.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  List<Map<String,dynamic>> notificationList = [
    {
      "title": "Booking is confirmed",
      "desc" : "Dear user your booking has been confirmed on 09/09/2025"
    },
    {
      "title": "Space is ready",
      "desc" : "Dear user your working has been confirmed on 09/09/2025"
    },
    {
      "title": "File uploaded",
      "desc" : "Dear user your file has been uploaded on 09/09/2025"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.whiteDark,
      body: SafeArea(
          child: Container(
              margin: EdgeInsets.only(top: SizeConfig.blockHeight * 2),
              child: ListView.builder(
                  itemCount: notificationList.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      width: SizeConfig.blockWidth * 100,
                      margin: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockWidth * 4,
                          vertical: SizeConfig.blockHeight * 1.5),
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.blockWidth * 4,
                          vertical: SizeConfig.blockHeight * 2),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${notificationList[index]["title"]}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: COLORS.black,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.blockWidth * 4.4),
                          ),
                          SizedBox(
                            height: SizeConfig.blockHeight * 1,
                          ),
                          Text(
                            "${notificationList[index]["desc"]}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: COLORS.whiteMedium,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                                fontSize: SizeConfig.blockWidth * 3.5),
                          )
                        ],
                      ),
                    );
                  })))
      ),
    );
  }
}
