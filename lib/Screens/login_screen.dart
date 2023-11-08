import 'dart:io';

import 'package:financeapp/data/bottom_navigation.dart';
import 'package:financeapp/widgets/tap_effect.dart';
import 'package:financeapp/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  String name="";
  String email="";
  String password="";
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final bioController = TextEditingController();


  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    bioController.dispose();
    super.dispose();
  }
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  @override
  void initState() {
    isLogin();
    // TODO: implement initState
    super.initState();
  }
  void isLogin()async{  
    SharedPreferences sp=await SharedPreferences.getInstance();
    name=sp.getString('name')??'';
    email=sp.getString('email')??'';
    password=sp.getString('password')??'';
    setState(() {
      
    });

  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                 Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 60,color: Colors.purple),),
                      Form(
                        key: _formKey,
                        child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                    margin: EdgeInsets.only(top: 20),
                                    child: Column(
                                      children: [
                                      
                            
                                        //email
                                        textFeild(
                                            hintText: "abc@example.com",
                                            icon: Icons.email,
                                            inputType: TextInputType.emailAddress,
                                            maxLines: 1,
                                            controller: emailController,
                                            validator: (value){  
                                              if(value==null || value==""){  
                                                return "Enter the Email";
                                              }else if(EmailValidator.validate(value)){  
                                                return null;
                                              }else{  
                                                return "please Enter valid email address";
                                              }
              
                                            }
                                            ),
                            
                                     //bio
                                          textFeild(
                                              hintText: "Enter the Password",
                                              icon: Icons.lock,
                                              suffixIcon: Icons.remove_red_eye,
                                              obscureText: true,
                                              inputType: TextInputType.text,
                                              maxLines: 1,
                                              controller: bioController,
                                              validator: (value){  
                                              if(value==null|| value==""){  
                                                return "Enter the Password";
                                              }else if(value.length<8){  
                                              return "Password must be greater than 8 character";
                                              }else {  
                                                return null;
                                              }
                                            }
                                              ),
                                      ],
                                    ),
                                  ),
                      ),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  
                                  height: 50,
                                  width: MediaQuery.of(context).size.width * 0.9,
                                  child: TapEffect(
                                    child: MaterialButton(
                                      shape:RoundedRectangleBorder(  
                                        borderRadius: BorderRadius.circular(130),
                                      ),
                                      color: Colors.purple,   
                                      onPressed: (){
                                        if(_formKey.currentState!.validate()){
                                           if(emailController.text==email && bioController.text==password){  
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom()));
                                           }else{  
                                            showSnackBar(context, "Enter the valid Field");
                                           }
                                           }
                                      },
                                      child: Text("Login ",style: TextStyle(color: Colors.white,),),
                                    ),
                                  )
                                )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  Widget textFeild(
      {required String hintText,
      required IconData icon,
      IconData? suffixIcon,
      required inputType,
      required validator,
      required int maxLines,
      required TextEditingController controller,
      bool obscureText=false,
      bool isPass=false,
      }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextFormField(
        cursorColor: Colors.purple,
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        decoration: InputDecoration(
          suffixIcon:IconButton(
            icon: Icon(suffixIcon),
            onPressed: (){  
              if(isPass){  
                isPass=false;
                print(isPass);
              }else{  
                isPass=true;
              }
            },
            ) ,
          prefixIcon: Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.purple,
            ),
            child: Icon(
              icon,
              size: 20,
              color: Colors.white,
            ),
          ),
          
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.green),
          ),
          errorBorder: OutlineInputBorder(  
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red)
          ),
          hintText: hintText,
          alignLabelWithHint: true,
          border: InputBorder.none,
          fillColor: Colors.purple.shade50,
          filled: true,
        ),
        validator:validator,
        autovalidateMode:AutovalidateMode.onUserInteraction,
        onChanged: (value){  

        },
        obscureText: obscureText,
      ),
    );
  }