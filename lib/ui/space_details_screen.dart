import 'package:co_working/components/colors.dart';
import 'package:co_working/components/size_config.dart';
import 'package:flutter/material.dart';

class SpaceDetailsScreen extends StatefulWidget {
  String desc;
  SpaceDetailsScreen({super.key,required this.desc});

  @override
  State<SpaceDetailsScreen> createState() => _SpaceDetailsScreenState();
}

class _SpaceDetailsScreenState extends State<SpaceDetailsScreen> {
  //Amenities
  bool meetingRooms = true;
  bool interNet = true;
  bool kitchenRefreshment = false;
  bool printingScanning = true;
  bool twentyFourAccess = false;

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
                    height: SizeConfig.blockHeight * 35,
                    width: SizeConfig.blockWidth * 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 3),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 3),
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
                          fontSize: SizeConfig.blockWidth * 4.2,
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
                          fontSize: SizeConfig.blockWidth * 4,
                          fontWeight: FontWeight.w500)
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 1,),
                  Text(
                      "Amenities",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: COLORS.black,
                          fontFamily: "Poppins",
                          fontSize: SizeConfig.blockWidth * 4,
                          fontWeight: FontWeight.w500)
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 1,),
                  amenities(title: "Meeting Rooms",
                      value: meetingRooms,
                      onChanged: (bool? newValue) {
                        setState(() {
                          meetingRooms = newValue ?? false;
                        });
                      }
                  ),

                  amenities(title: "High-Speed Internet",
                      value: interNet,
                      onChanged: (bool? newValue) {
                        setState(() {
                          interNet = newValue ?? false;
                        });
                      }
                  ),
                  amenities(title: "Meeting Rooms",
                      value: meetingRooms,
                      onChanged: (bool? newValue) {
                        setState(() {
                          meetingRooms = newValue ?? false;
                        });
                      }
                  ),
                  amenities(title: "Refreshment",
                      value: kitchenRefreshment,
                      onChanged: (bool? newValue) {
                        setState(() {
                          kitchenRefreshment = newValue ?? false;
                        });
                      }
                  ),
                  amenities(title: "Printing & Scanning",
                      value: printingScanning,
                      onChanged: (bool? newValue) {
                        setState(() {
                          printingScanning = newValue ?? false;
                        });
                      }
                  ),
                  amenities(title: "24/7 Access",
                      value: twentyFourAccess,
                      onChanged: (bool? newValue) {
                        setState(() {
                          twentyFourAccess = newValue ?? false;
                        });
                      }
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }


  Widget amenities({required String title,required bool value,required ValueChanged<bool?> onChanged}) {
    return Container(
      width: SizeConfig.screenWidth,
      alignment: Alignment.topLeft,
      child:  CheckboxListTile(
        contentPadding: EdgeInsets.zero,
        controlAffinity: ListTileControlAffinity.leading,
        title: SizedBox(
          width: SizeConfig.screenWidth,
          child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: COLORS.blackMedium,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Poppins",
                  fontSize: SizeConfig.blockWidth * 3.8)),
        ),
        visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity),
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
