import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:to_do/Plan%20B/Data/Habitmodel.dart';
import 'package:to_do/Plan%20B/UI/HomeHabit.dart';

class Tapedhabit extends StatelessWidget{
  
  HabitModel _habitModel;
  Tapedhabit(this._habitModel);
 String _starttime=DateFormat('MMM d,yyy').format(DateTime.now()).toString();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
     //backgroundColor: Colors.blueGrey,
  backgroundColor:  _habitModel.color,
     body: Padding(
      padding: EdgeInsets.only(top: 50,left: 30,right: 20,bottom: 20),
       child: Column(
        children: [
          Row( 
            children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
                
              }, icon:Icon (Icons.arrow_back_ios,color: Colors.grey,)),
              Spacer(),
              CircleAvatar(radius: 23,backgroundImage: AssetImage('assets/images/catprofilepn.png'),)
              
     
          ],
          ),
          Center(
            child: Image.asset(_habitModel.image,width: 500,height: 300,)
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
               
                child: Column(
                  children: [
                    
                    Container(
                      width: double.infinity,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: Alignment(-1,3),
                                  
                               child:      Container(
                    width: 50,
                    height: 50,
                    child: Icon(Icons.calendar_month_rounded, size: 23,color: Color.fromARGB(255, 159, 201, 237),),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white),
                  )
                                   
                                 
                                ),
                              
                             
                                 
                                  Padding(
                                    padding: const EdgeInsets.only(left:60.0),
                                    child: Column(

                                      children:[
                                        
                                        Text("Date & time",style: GoogleFonts.ubuntuCondensed(),),
                                        SizedBox(height: 10,),
                                      Text(_starttime,style: GoogleFonts.ubuntuCondensed(),)
                                    ] ),
                                  ),
                                 
                               
                              ],
                            ),
                            

                          ],
                        ),
                      ),
                  //   color: Colors.blue,
                     decoration: BoxDecoration(
                      color: Color.fromRGBO(198, 235, 251 ,100),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20) ),
                     ),
                 
                    ),
                    SizedBox(height: 10,),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 20,),
        new CircularPercentIndicator(
                  radius: 60.0,
                  lineWidth: 7.0,
                  percent:0,
                  center: new Text("0%"),
                  progressColor:Colors.pink[100],
                ),



                          ],
                        ),
  SizedBox(height: 90,),
  ElevatedButton(onPressed: (){
    Provider.of<HabitModel>(context,listen: false).isComplete;
  }, child:Padding(
        padding:EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 20,
          right: 20
        ),
        child:Text("Complete Task",style:GoogleFonts.taviraj(color: Colors.white,
           fontSize: 18)),
      ),style: ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(22.0),
      side: BorderSide(color: Color.fromARGB(255, 56, 120, 143))
    )
  )
))
                      ],
                    
                    )
             
                    

                  ],
                ),
                //color: Colors.white,
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
               
              ),
            )
            )
        ],
       ),
     ),
     
    );
  }

}
void main(List<String> args) {
  
//  runApp(MaterialApp(home:Tapedhabit()));
}