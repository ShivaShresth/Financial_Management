import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:financeapp/Screens/login_screen.dart';
import 'package:financeapp/widgets/tap_effect.dart';
import 'package:financeapp/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sign_UP extends StatefulWidget {
  const Sign_UP({super.key});

  @override
  State<Sign_UP> createState() => _Sign_UPState();
}

class _Sign_UPState extends State<Sign_UP> {
  File? image;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final bioController = TextEditingController();

  //for selecting image
  void selectImage() async {
    image = await pickImage(context);
    setState(() {});
  }
final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    bioController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Material(
                        child: InkWell(
                          onTap: () => selectImage(),
                          child: image == null
                              ? CircleAvatar(
                                  backgroundColor: Colors.purple,
                                  radius: 50,
                                  child: Icon(
                                    Icons.account_circle,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                )
                              : CircleAvatar(
                                  backgroundImage: FileImage(image!),
                                  radius: 50,
                                ),
                                
                        ),
                      ),
                        Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding:
                                        EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                    margin: EdgeInsets.only(top: 20),
                                    child: Column(
                                      children: [
                                        //name field
                                        textFeild(
                                            hintText: "Name",
                                            icon: Icons.account_circle,
                                            inputType: TextInputType.name,
                                            maxLines: 1,
                                            controller: nameController,  
                                               validator: (value){  
                                            if(value==null || value==""){  
                                              return "Enter the name";
                                            }else{  
                                              return null;
                                            }
                                          }
                                            ),
                            
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
                                        onPressed: ()async{
                                          if(_formKey.currentState!.validate()){ 
                                                    SharedPreferences sp=await SharedPreferences.getInstance();
                                                    sp.setString("name", nameController.text.toString());
                                                    sp.setString("email", emailController.text.toString());
                                                    sp.setString("password", bioController.text.toString());
                                                    setState(() {
                                                      
                                                    });
                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Screen()));
                                                    
                                                    
                                          };
                                        },
                                        child: Text("Sign UP",style: TextStyle(color: Colors.white,),),
                                      ),
                                    )
                                  ),
                                  SizedBox(height: 30,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [  
                                      Text("Already have account?"),
                                      SizedBox(width: 5,),
                                    Material(
                                      color: Colors.white,
                                      child: GestureDetector(onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Screen()));
                                      }, child: Text("Login",style: TextStyle(decoration: TextDecoration.underline,fontSize: 15,color: Colors.blue),)),
                                    )
                
                                    ],
                                  )
                    ],
                  ),
                ),
              ],
            ),
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
          hintStyle: TextStyle(fontWeight: FontWeight.w400),
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