import 'package:co_working/components/colors.dart';
import 'package:co_working/components/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;



class MapViewScreen extends StatefulWidget {
  const MapViewScreen({super.key});

  @override
  State<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {
  String googleAPIKey = "AIzaSyBnbqwGq_qB6avn5I7VQmlW_hSBmdnpYas";
  LatLng fromLatLng = const LatLng(11.664079, 76.260510);
  LatLng currentCameraPosition = const LatLng(11.664079, 76.260510);
  late GoogleMapController _controller;
  int selectedIndex = 0;
  Set<Marker> markers = Set();

  List<Map<String,dynamic>> locationList = [
    {
      "title": "Awis",
      "lat": 11.679460,
      "long": 76.265539,
      "details": "Location is open"
    },
    {
      "title": "Incuspaze",
      "lat": 11.675029,
      "long": 76.265570,
      "details": "Location is closed"
    },
    {
      "title": "Dotspace",
      "lat": 11.666590,
      "long": 76.263031,
      "details": "Location is closed"
    },
    {
      "title": "Space One",
      "lat": 11.664079,
      "long": 76.260510,
      "details": "Location is open"
    },
    {
      "title": "Co space",
      "lat": 11.663268,
      "long": 76.258264,
      "details": "Location is open"
    },
    {
      "title": "Co work",
      "lat": 11.661509,
      "long": 76.256799,
      "details": "Location is closed"
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    setState(() {
      _controller = controller;
      getMarkers(context);
    });
  }


  //Adding markers

  Future<Set<Marker>> getMarkers(BuildContext context) async {
    final Uint8List markerIcon = await getBytesAsset("assets/images/location.png");


    for (int i = 0; i < locationList.length; i++) {
      final loc = locationList[i];
      print("______________________Entered marker location");
      markers.add(
        Marker(
          markerId: MarkerId(loc["title"]),
          position: LatLng(loc["lat"], loc["long"]),
          infoWindow: InfoWindow(title: loc["title"]),
          draggable: true,
          icon: BitmapDescriptor.fromBytes(markerIcon),
          onTap: () {
            selectedIndex = i;
            setState(() {});
          },
        ),
      );
    }
    print("______________________End");
    return markers;
  }


  Future<Uint8List> getBytesAsset(String path) async {
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: pixelRatio.round() * 30);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.whiteDark,
      body: SafeArea(
          child: Stack(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight,
                width: SizeConfig.screenWidth,
                child: GoogleMap(
                  initialCameraPosition:
                  CameraPosition(target: fromLatLng, zoom: 16),
                  onMapCreated: _onMapCreated,
                  onCameraIdle: () {},
                  onCameraMove: (cameraPosition) {
                    setState(() {
                      currentCameraPosition = cameraPosition.target;
                    });
                    print("The camera position is : ${cameraPosition.target} ");
                  },
                  compassEnabled: false,
                  mapType: MapType.normal,
                  zoomControlsEnabled: false,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  rotateGesturesEnabled: false,
                  tiltGesturesEnabled: false,
                  markers: markers,
                ),
              ),
              Positioned(
                  bottom: SizeConfig.blockHeight * 0,
                  left: SizeConfig.blockWidth * 0,
                  right: SizeConfig.blockWidth * 0,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 1),
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockHeight * 2,
                        horizontal: SizeConfig.blockWidth * 2,
                    ),
                    decoration: BoxDecoration(
                      boxShadow:  [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(SizeConfig.blockWidth * 3),
                        topLeft: Radius.circular(SizeConfig.blockWidth * 3),
                      ),
                      color: COLORS.whiteDark,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.location_city_sharp,color: Colors.blue,),
                            SizedBox(width: SizeConfig.blockWidth * 2,),
                            Text(
                              "${locationList[selectedIndex]["title"]}",
                              style: TextStyle(
                                  color: COLORS.blueDark,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                  fontSize: SizeConfig.blockWidth * 5),
                            ),
                          ],
                        ),
                        SizedBox(height: SizeConfig.blockHeight * 1,),
                        Text(
                          "${locationList[selectedIndex]["details"]}",
                          style: TextStyle(
                              color: COLORS.blueDark,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.blockWidth * 4.3),
                        ),
                      ],
                    ),
                  )
              )
            ],
          ),
      ),
    );
  }
}
