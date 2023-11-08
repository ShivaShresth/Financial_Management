import 'package:financeapp/Screens/circleprogress.dart';
import 'package:financeapp/Screens/circleprogress2.dart';
import 'package:financeapp/widgets/tap_effect.dart';
import 'package:flutter/material.dart';

class Circle extends StatefulWidget {
  const Circle({super.key});

  @override
  State<Circle> createState() => _CircleState();
}

class _CircleState extends State<Circle> with SingleTickerProviderStateMixin {
  late AnimationController progressController;
  late Animation<double> animation;
  double a = 100;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    progressController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    animation = Tween<double>(begin: 0, end: a).animate(progressController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Center(
          child: Column(
            children: [
              CustomPaint(
                foregroundPainter: CircleProgress(
                    animation.value), //this will add custom painter ager child

                child: Container(
                  width: 200,
                  height: 200,
                  child: GestureDetector(
                      onTap: () {
                        if (animation.value == 100) {
                          progressController.reverse();
                        } else {
                          progressController.forward();
                        }
                      },
                      child: Center(child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${animation.value.toInt()}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 50),),
                       Text("day",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                        ],
                      ))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomPaint(
                    foregroundPainter: CircleProgress2(animation
                        .value), //this will add custom painter ager child

                    child: Container(
                      width: 45,
                      height: 90,
                      child: GestureDetector(
                          onTap: () {
                            if (animation.value == 100) {
                              progressController.reverse();
                            } else {
                              progressController.forward();
                            }
                          },
                          child: Center(
                              child: Text(
                            "T",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                                fontSize: 14),
                          ))),
                    ),
                  ),
                  CustomPaint(
                    foregroundPainter: CircleProgress2(animation
                        .value), //this will add custom painter ager child

                    child: Container(
                      width: 45,
                      height: 90,
                      child: GestureDetector(
                          onTap: () {
                            if (animation.value == 100) {
                              progressController.reverse();
                            } else {
                              progressController.forward();
                            }
                          },
                          child: Center(
                              child: Text(
                            "W",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                                fontSize: 14),
                          ))),
                    ),
                  ),
                  CustomPaint(
                    foregroundPainter: CircleProgress2(animation
                        .value), //this will add custom painter ager child

                    child: Container(
                      width: 45,
                      height: 90,
                      child: GestureDetector(
                          onTap: () {
                            if (animation.value == 100) {
                              progressController.reverse();
                            } else {
                              progressController.forward();
                            }
                          },
                          child: Center(
                              child: Text(
                            "T",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                                fontSize: 14),
                          ))),
                    ),
                  ),
                  CustomPaint(
                    foregroundPainter: CircleProgress2(animation
                        .value), //this will add custom painter ager child

                    child: Container(
                      width: 45,
                      height: 90,
                      child: GestureDetector(
                          onTap: () {
                            if (animation.value == 100) {
                              progressController.reverse();
                            } else {
                              progressController.forward();
                            }
                          },
                          child: Center(
                              child: Text(
                            "F",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                                fontSize: 14),
                          ))),
                    ),
                  ),
                  CustomPaint(
                    foregroundPainter: CircleProgress2(animation
                        .value), //this will add custom painter ager child

                    child: Container(
                      width: 45,
                      height: 90,
                      child: GestureDetector(
                          onTap: () {
                            if (animation.value == 100) {
                              progressController.reverse();
                            } else {
                              progressController.forward();
                            }
                          },
                          child: Center(
                              child: Text(
                            "S",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.brown,
                                fontSize: 14),
                          ))),
                    ),
                  ),
                ],
              ),
              Text(
                "Test Complete! 100XP",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                "You've met your daily goal! Practice every day to build your streak.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: SafeArea(
                      child: TapEffect(
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(   
                            borderRadius: BorderRadius.circular(10)
                          ),
                          color: Colors.blue,
                          minWidth: MediaQuery.of(context).size.width,
                          onPressed:(){ }, child: Text("CONTINUE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
                      ),
                    ),
                  ),
                ],
              ),
            )  
            ],
          ),
        ),
      ),
    );
  }
}
