import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:to_do/Plan%20B/Data/Habitmodel.dart';
import 'package:to_do/Plan%20B/UI/Page1.dart';

import '../Provider/HabitProvider.dart';
import 'input_field.dart';



class habit extends StatelessWidget{
  Color colors;
  String image;
  String text;
  int index=0;
  String pic;
  static int  ig=4;
  habit? hab;
  habit({required this.colors,required this.image,required this.text,required this.index,required this.pic});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

  return Container(
    width: 175,
    height:230,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
     color: colors
    ),
    
    child: Column(
      children: [
        SizedBox(height: 35,),
        Center(
          child: CircleAvatar(backgroundImage: AssetImage(image,),
          radius: 45,
          ),
        ),
        SizedBox(height: 20,),
        Center(child: Text(text,style: GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.w500),),),
        SizedBox(height: 15,),
        Center(
          
          child: Container(width: 100,
          height:33,
          child:InkWell(
             onTap: () async{
              HabitModel habitModel=HabitModel(text: text, image: pic, color: colors);
            
              await Provider.of<HabitProvider>(context,listen: false).addHabitlist(habitModel);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Page1()));
            

             },
            child: Center(child:Text("Add",style: GoogleFonts.ubuntu(fontSize: 15,color: Color.fromRGBO(45, 63, 48, 100)
            ),
            )
            ),
          
            ) ,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
          color: Colors.white
          ),
          ),
        )
      ],
      
    ),

  
);  }
}

Future AddDIALOG(BuildContext context){
  habit? hab;
  return showDialog(context: context, 
  builder: (context){
    return AlertDialog(
      shape: RoundedRectangleBorder(
borderRadius: BorderRadius.all(Radius.circular(32.0))),
      title: Text("Start  30 days of building a habit",style: GoogleFonts.ubuntu(fontSize: 18),),
      actions: [
        TextButton(onPressed: ()async{

//  HabitModel habitModel=HabitModel(color: null, text: '', image: pic);
//                   await Provider.of<DbProvider>(context, listen: false)
//                       .createNewTask(taskModel);
//                        Navigator.push(context, MaterialPageRoute(builder: ((context) => Tasks())));
        }, child:Text("Add")),
        TextButton(onPressed: (){
         
          
          Navigator.pop(context);
          
        }, child: Text("Cancel"))

      ],

    );

  }
  );
}