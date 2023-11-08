import 'package:financeapp/Screens/sign_up.dart';
import 'package:financeapp/data/bottom_navigation.dart';
import 'package:financeapp/homepage.dart';
import 'package:financeapp/widgets/tap_effect.dart';
import 'package:flutter/material.dart';

class Create_Profile extends StatefulWidget {
  const Create_Profile({super.key});

  @override
  State<Create_Profile> createState() => _Create_ProfileState();
}

class _Create_ProfileState extends State<Create_Profile> {
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
                Image.asset('images/book_bird.png'),
                Text("Time to create a profile!",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                Text("Create a profile to save your progress and continue learning for free.",style: TextStyle(color: Colors.grey[800],fontSize: 16),),
               
               SizedBox(height: 210,),
                TapEffect(
                  child: MaterialButton(
                     shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0), // Adjust the radius as needed
                          ),
                        
                    color: Color.fromRGBO(32, 177, 249, 1),
                    minWidth: MediaQuery.of(context).size.width,
                    
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Sign_UP()));
                    },  
                  child: Text("CREATE PROFILE",style:TextStyle(color: Colors.white),),),
                ),
              
                TapEffect(
                  child: TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom()),);
                  }, child: Text("LATER")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}