import 'package:financeapp/Screens/sign_up.dart';
import 'package:financeapp/data/bottom_navigation.dart';
import 'package:financeapp/homepage.dart';
import 'package:financeapp/widgets/tap_effect.dart';
import 'package:flutter/material.dart';

class First_Screen extends StatefulWidget {
  const First_Screen({super.key});

  @override
  State<First_Screen> createState() => _First_ScreenState();
}

class _First_ScreenState extends State<First_Screen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              
              children: [  
                SizedBox(height: 60,),
                Image.asset('images/jump_bird.png'),
                Text("Take a test to jump a head!",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                Text("It takes about 5 minutes, and adapts to your level by getting harder (or easier) based on your answers.",style: TextStyle(color: Colors.grey[800],fontSize: 16),),
               
               SizedBox(height: 210,),
                TapEffect(
                  child: TapEffect(
                    child: MaterialButton(
                       shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0), // Adjust the radius as needed
                            ),
                          
                      color: Color.fromRGBO(32, 177, 249, 1),
                      minWidth: MediaQuery.of(context).size.width,
                      
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom()));
                      },  
                    child: Text("START",style:TextStyle(color: Colors.white),),),
                  ),
                ),
              
                TapEffect(
                  child: TextButton(onPressed: (){
                  }, child: Text("CANCEL")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}