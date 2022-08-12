import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:to_do/Plan%20B/Data/Habitmodel.dart';


import 'Tapedhabit.dart';

class HomeHabit extends StatelessWidget{
  // Color concolor;
  // String image;
  // String title;
  // String Percent="0%";
  // Color Precentcolor=Color.fromARGB(255, 203, 99, 133);
  // double fill=0;
  
HabitModel habitModel;
  HomeHabit(
    this.habitModel

  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return   Container(
    margin: EdgeInsets.only(bottom:20),
                  child: InkWell(
                    onTap: () {
                      
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Tapedhabit(habitModel);
                    })
                    ) ;
                    
                    
                  },

                    child: Stack(children: [
                  
                      Align(alignment: Alignment(1.1,0),
                        child: Image(image: AssetImage(habitModel.image)
                        )
                        ),
                        
                         Align(
                          alignment: Alignment(-.8,-.5),
                           child: new CircularPercentIndicator(
                                           radius: 40.0,
                                           lineWidth: 8.0,
                                           percent: .7,
                                           center: new Text("0%"),
                                           progressColor: Colors.grey,
                                         ),
                         ),
                        Align(
                          alignment: Alignment(-.8,.5),
                  
                          child: Text(habitModel.text,
                          style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),),
                  
                        ),
                        // Align(
                        //   alignment: Alignment(-.8,.75),
                        //   child: Text('06:00 am - 06:00 pm',
                        //   style: TextStyle(color: Colors.white,
                        //   fontWeight: FontWeight.w300
                        //   ,fontSize: 11),),
                  
                        // ),
                        SizedBox(height: 20,)
                  
                    ]),
                  ),
                  width: 320.w,
                  height: 150.h,
                 //  borderRadius: BorderRadius.circular(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: habitModel.color
                    ),
                 
                 
                 //color: Color.fromRGBO(104, 67, 184, 80),
                );
  }

}
