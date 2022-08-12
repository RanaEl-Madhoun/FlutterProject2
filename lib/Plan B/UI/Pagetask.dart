import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:to_do/Plan%20B/Data/model.dart';
import 'package:to_do/Plan%20B/UI/Newtask.dart';

import '../Provider/db_provider.dart';


class PageTask extends StatelessWidget{
 
  
  TaskModel taskModel;
  PageTask(this.taskModel);
  @override
  Widget build(BuildContext context) {
     
         return  Padding(
     padding: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 20),
      child: Container(
            
              //padding: const EdgeInsets.symmetric(horizontal:20.0),
              child: Column(
                children: [
                  SizedBox(height: 10,)
               ,   Row(children: [
                  
                   Transform.scale(
        scale: 1.4,
        child: Checkbox(
        //  activeColor: Colors.orange,
          shape: CircleBorder(),
          tristate: false,
          value:taskModel.isComplete,
          
          splashRadius: 30,
            onChanged: ( value) {
               Provider.of<DbProvider>(context,listen: false).updateTask(taskModel);
              
            }
        ),
      ),
   Column(
      children: [
   Row(children: [
       Text( taskModel.title,style: GoogleFonts.sourceSansPro(fontWeight: FontWeight.bold,fontSize: 16),)
       ,
       ],)  ,
        SizedBox(height: 2,),
        Row(children: [ Text(taskModel.description,style: GoogleFonts.sourceSansPro(color: Color.fromARGB(255, 111, 110, 110),),),],)  
      ],
   ),Spacer(),
   IconButton(onPressed: (){
    Provider.of<DbProvider>(context,listen: false).deleteTask(taskModel);
   }, icon: Icon(Icons.delete,color: Colors.grey,))


                  ],),
               
                ],
                 
              ),
            
            decoration: BoxDecoration(
              color:  Colors.white,
              borderRadius: BorderRadius.circular(30)),
            
            width: double.infinity,
            height: 65,
        
          ),
    );
        
      
       
     
    


   
  }

}
void main(List<String> args) {
  
}
