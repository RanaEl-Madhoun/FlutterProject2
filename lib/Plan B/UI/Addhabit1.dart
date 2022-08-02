import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'habit.dart';

class Addhabit extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return Scaffold(
   backgroundColor:
     Color.fromRGBO(239, 236, 255,20),
  body: SingleChildScrollView(
    child: Padding(
      padding:EdgeInsets.all(20),
     
      child: Column(
        children: [
           SizedBox(height: 30,),
            Row(children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
                
              }, icon: Icon(Icons.arrow_back_ios_new_rounded,color: Color.fromARGB(255, 137, 136, 136),))
            ],),
          Row(
            children: [
              Expanded(
                child: Center(
                child:  Text("“What you do every day matters more than\n  what you do every once in awhile”",style: GoogleFonts.squarePeg(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w700))
                ),
              )
            ],
          ),
                    SizedBox(height: 20,),

          Row(
        children:[
          Text("Add Habit",style: GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.w600,color: Color.fromARGB(255, 133, 131, 131)),)
        ]    
          ),SizedBox(height: 10,),

          Row(
            children: [
              habit(colors: (const Color.fromRGBO(216, 245, 223, 100)), image: 'assets/images/nature.jpg',text: "Get outside".tr(), index: 0,),
              SizedBox(width: 20,),
           habit(colors: (Color.fromRGBO(255, 236, 237, 100)), image: 'assets/images/yogapn.png',text: "Morning exercies".tr(),index: 1,),
                    
  
  
            ],
  
          ),
                 SizedBox(height: 15,),
  
          Row(
            children: [
                                habit(colors: (Color.fromRGBO(251, 214, 198, 100)), image: 'assets/images/photo1659102598.jpeg',text: "Dont smoke".tr(),index: 2,),
                                 SizedBox(width: 20,),
                                  habit(colors: (Color.fromRGBO(221, 243, 253, 100)), image: 'assets/images/drinkwaterpn.png',text: "Drink water".tr(),index: 3,),
  
  
            ],
          ),
             SizedBox(height: 15,),
            Row(
            children: [
                                habit(colors: (Color.fromARGB(255, 240, 196, 179)), image: 'assets/images/reading.png',text: "Read book".tr(),index: 4,),
                                 SizedBox(width: 20,),
                                  habit(colors: (Color.fromARGB(156, 231, 231, 208)), image: 'assets/images/skincare2.jpg',text: "Skin care".tr(),index: 5,),
  
  
            ],
          ),
           SizedBox(height: 15,),
            Row(
            children: [
                                habit(colors: (Color.fromARGB(119, 205, 201, 243)), image: 'assets/images/learninglang.jpg',text: "Learn language ".tr(),index: 6,),
                                 SizedBox(width: 20,),
                                  habit(colors: (Color.fromRGBO(207, 164, 181, 100)), image: 'assets/images/cleaning.jpg',text: "Clean the house".tr(),index: 7,),
  
  
            ],
          ),
           SizedBox(height: 15,),
            
          
        ],
      ),
    ),
  ),

);  }

}