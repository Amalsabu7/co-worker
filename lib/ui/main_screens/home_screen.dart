import 'package:co_working/bloc/home_bloc/home_bloc.dart';
import 'package:co_working/components/colors.dart';
import 'package:co_working/components/error_screen.dart';
import 'package:co_working/components/shimmer_animation.dart';
import 'package:co_working/components/size_config.dart';
import 'package:co_working/ui/bookings/booking_screen.dart';
import 'package:co_working/ui/space_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  //bloc
  late HomeBloc homeBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeBloc = BlocProvider.of<HomeBloc>(context);
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: homeBloc,
        builder: (context, state) {
          if(state is HomeLoading){
            return const ShimmerHomePage();
          }else if(state is FetchCoWorkerSuccess){
            return Scaffold(
              backgroundColor: COLORS.whiteDark,
              body: SafeArea(
                bottom: false,
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                      width: SizeConfig.screenWidth,
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: SizeConfig.blockHeight * 3,),
                          Text(
                            "Coworking Spaces",
                            style: TextStyle(
                                color: COLORS.blackMedium,
                                fontFamily: "Poppins",
                                fontSize: SizeConfig.blockWidth * 5,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: SizeConfig.blockHeight * 3,),
                          SizedBox(
                            height: SizeConfig.blockHeight * 7,
                            child: TextFormField(
                              controller: searchController,
                              style: TextStyle(
                                  color: COLORS.blueDark,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.3,
                                  fontSize: SizeConfig.blockWidth * 4),
                              onChanged: (value) {

                              },
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              cursorColor: COLORS.blueDark,
                              decoration: textFieldDecoration(hint: "Search space.."),
                            ),
                          ),
                          SizedBox(height: SizeConfig.blockHeight * 3,),
                          ListView.builder(
                            itemCount: state.coWorkerList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => BookingScreen(
                                      desc: state.coWorkerList[index].name!
                                  ),));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: SizeConfig.blockWidth * 1,
                                      vertical: SizeConfig.blockHeight * 2),
                                  margin: EdgeInsets.only(bottom: SizeConfig.blockHeight * 3),
                                  decoration: BoxDecoration(
                                    color: COLORS.whiteDark,
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.blockWidth * 4),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: COLORS.whiteLight,
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
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
                                      Text(
                                        state.coWorkerList[index].name!,
                                        style: TextStyle(
                                            color: COLORS.blueDark,
                                            fontFamily: "Poppins",
                                            fontSize: SizeConfig.blockWidth * 4.5,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: SizeConfig.blockHeight * 1,),
                                      Text(
                                        state.coWorkerList[index].email!,
                                        style: TextStyle(
                                            color: COLORS.blueSecondary,
                                            fontFamily: "Poppins",
                                            fontSize: SizeConfig.blockWidth * 4,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: SizeConfig.blockHeight * 1,),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: SizeConfig.blockWidth * 26,
                                            height: SizeConfig.blockHeight * 6,
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => SpaceDetailsScreen(
                                                      desc: state.coWorkerList[index].name!
                                                  ),));
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
                                                child: buttonTitle(title: "VIEW")),
                                          ),
                                          SizedBox(width: SizeConfig.blockWidth * 5,),
                                          SizedBox(
                                            width: SizeConfig.blockWidth * 26,
                                            height: SizeConfig.blockHeight * 6,
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => BookingScreen(
                                                      desc: state.coWorkerList[index].name!
                                                  ),));
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
                                                child: buttonTitle(title: "BOOK")),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    )
                ),
              )
            );
          }else if(state is FetchCoWorkerFailed){
            return errorScreen(
                onPressed: (){
                  homeBloc.add(const FetchCoworkerEvent());
                }
            );
          }
          return Container();
        },
    );
  }

  InputDecoration textFieldDecoration({required String hint}) {
    return InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.only(
        top: SizeConfig.blockHeight * 1.8,
        bottom: SizeConfig.blockHeight * 1.8,
        left: SizeConfig.blockWidth * 4,
        right: SizeConfig.blockWidth * 3,
      ),

      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: COLORS.blueLight,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 1.5)),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: COLORS.blueLight,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 1.5)),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: COLORS.blueLight,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 1.5)),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: COLORS.blueLight,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 1.5)),
      hintText: hint,
      hintStyle: TextStyle(
          color: COLORS.blueDark,
          fontWeight: FontWeight.w400,
          fontFamily: "Poppins",
          fontSize: SizeConfig.blockWidth * 3.8),
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
          fontSize: SizeConfig.blockWidth * 3.5),
    );
  }

}
