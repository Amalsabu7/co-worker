import 'package:co_working/components/colors.dart';
import 'package:co_working/components/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';


class ShimmerHomePage extends StatelessWidget {
  const ShimmerHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth * 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: SizeConfig.blockHeight * 3,),
                  shimmerCard(
                    height: SizeConfig.blockHeight * 4,
                    width: SizeConfig.blockWidth * 80,
                  ),
                  SizedBox(height: SizeConfig.blockHeight * 3,),

                  Expanded(
                    child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return  Container(
                            width: SizeConfig.screenWidth,
                            margin: EdgeInsets.only(bottom: SizeConfig.blockHeight * 3),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: SizeConfig.blockHeight * 2,
                                ),
                                shimmerCard(
                                  height: SizeConfig.blockHeight * 27,
                                  width: SizeConfig.blockWidth * 100,
                                ),
                                SizedBox(
                                  height: SizeConfig.blockHeight * 2,
                                ),

                                shimmerCard(
                                  height: SizeConfig.blockHeight * 3.5,
                                  width: SizeConfig.blockWidth * 60,
                                ),
                                SizedBox(
                                  height: SizeConfig.blockHeight * 1,
                                ),
                                shimmerCard(
                                  height: SizeConfig.blockHeight * 3,
                                  width: SizeConfig.blockWidth * 60,
                                ),
                              ],
                            ),
                          );

                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: SizeConfig.blockWidth * 4,
                          );
                        },
                        itemCount: 3),


                  )
                ],
              )),
        ),
      ),
    );
  }
}

Widget shimmerCard({required double height, required double width}) {
  return Shimmer(
    color: COLORS.greenLight,
    colorOpacity: 0.3,
    enabled: true,
    direction: const ShimmerDirection.fromLTRB(),
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
        borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 3),
      ),
    ),
  );
}