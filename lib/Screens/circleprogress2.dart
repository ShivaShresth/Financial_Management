import 'package:flutter/material.dart';

import 'dart:math';
class CircleProgress2 extends CustomPainter{  
 double currentProgress;
CircleProgress2(this.currentProgress);
  void paint(Canvas canvas, Size size){  
Paint outerCircle=Paint()  
..strokeWidth=4
..color=Colors.green
..style=PaintingStyle.stroke;

Paint completeArc=Paint()  
..strokeWidth=4
..color=Colors.redAccent
..style=PaintingStyle.stroke 
..strokeCap=StrokeCap.butt;

Offset center=Offset(size.width/2,size.height/2);
double radius=min(size.width/2,size.height/2)-10;
canvas.drawCircle(center,radius,outerCircle);
double angle= 2*pi*(currentProgress/100);

canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi/2, angle, false, completeArc);






  }
  bool shouldRepaint(CustomPainter oldDelegate){  
    return true;
  }


}