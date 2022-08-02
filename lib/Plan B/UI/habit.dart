import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:path/path.dart';

import 'input_field.dart';

class habit extends StatefulWidget{
  Color colors;
  String image;
  String text;
  int index;
  habit({required this.colors,required this.image,required this.text,required this.index});

  @override
  State<habit> createState() => _habitState();
}

class _habitState extends State<habit> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

  return Container(
    width: 175,
    height:230,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: widget.colors
    ),
    
    child: Column(
      children: [
        SizedBox(height: 35,),
        Center(
          child: CircleAvatar(backgroundImage: AssetImage(widget.image,),
          radius: 45,
          ),
        ),
        SizedBox(height: 20,),
        Center(child: Text(widget.text,style: GoogleFonts.ubuntu(fontSize: 16,fontWeight: FontWeight.w500),),),
        SizedBox(height: 15,),
        Center(
          
          child: Container(width: 100,
          height:33,
          child:InkWell(
             onTap: () {
              AddDIALOG(context);

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
  return showDialog(context: context, 
  builder: (context){
    return AlertDialog(
      shape: RoundedRectangleBorder(
borderRadius: BorderRadius.all(Radius.circular(32.0))),
      title: Text("Start  30 days of building a habit",style: GoogleFonts.ubuntu(fontSize: 18),),
      actions: [
        TextButton(onPressed: (){
// add it to home screen
        }, child:Text("Add")),
        TextButton(onPressed: (){
          Navigator.pop(context);
          
        }, child: Text("Cancel"))

      ],

    );

  }
  );
}