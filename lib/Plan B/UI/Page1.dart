import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:to_do/Plan%20B/Data/model.dart';
import 'package:to_do/Plan%20B/Provider/HabitProvider.dart';
import 'package:to_do/Plan%20B/UI/HomeHabit.dart';
import 'package:to_do/Plan%20B/UI/Pagetask.dart';
import 'package:to_do/Plan%20B/UI/Tasks.dart';


import 'package:to_do/Plan%20B/UI/upcoming.dart';
import 'package:provider/provider.dart';
import '../Provider/db_provider.dart';
import 'Createhabit.dart';

import 'Newtask.dart';
import 'pAGE2.dart';



class Page1 extends StatefulWidget {
  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {

  
    // TODO: implement build
 
  return  Scaffold(
      
        // appBar: AppBar(
        //   backgroundColor:Color.fromARGB(206, 212, 181, 231), 
        // ),
        // drawer: Drawer(),
        backgroundColor: Color.fromRGBO(237, 208, 255,50),
        body:  Padding(
          padding:EdgeInsets.only(top:20) ,
          child: SingleChildScrollView(
          //  physics: ScrollPhysics(),
            child: ScreenUtilInit(
               designSize: const Size(360, 690),
                   minTextAdapt: true,
                   splitScreenMode: true, builder: (BuildContext context, Widget? child) { 
                    return  Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        
                children: [
                  Row(children: [
                    Text("Hi,dreamer",style: GoogleFonts.ubuntu(fontSize: 18),
                    ),
                    Spacer(),
                      CircleAvatar(radius: 23,backgroundImage: AssetImage('assets/images/catprofilepn.png'),)
                  ],),
                  SizedBox(height: 10.h,),
                  Row(
          
                      children: [
                        Text('Welcome back,'.tr(),style: TextStyle(fontSize: 13,color: Color.fromRGBO(78, 73, 87, 100)),)
                      ],
                  ),
                  SizedBox(height:6.h ,),
                  Row(
                      children: [
                        Text('Create your goal for '.tr(),style: GoogleFonts.playfairDisplay(fontSize: 24,fontWeight:FontWeight.w400 ),)
                      ],
                  ),
                   Row(
                      children: [
                        Text('your future'.tr(),style: GoogleFonts.playfairDisplay(fontSize: 24,fontWeight:FontWeight.w400 ),)
                      ],
                  ),
                  SizedBox(height: 20.h,),
                  TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: Icon(Icons.search),
                        hintStyle: TextStyle(color: Color.fromARGB(255, 164, 162, 162)),
                        hintText: 'Search your task...',
                        border: OutlineInputBorder(
                          
                          borderRadius: BorderRadius.circular(30),
                          
                          )
                       ),
                  ),
                  SizedBox(height: 20.h,),
                  SingleChildScrollView(
                            physics: ScrollPhysics(),

                    child: Column(children: [
                     Row(children: [
                      Text("Habits",style: GoogleFonts.radley(fontSize: 20),),
   
                     ],) ,SizedBox(height: 10,),
                    ListView.builder(
                      shrinkWrap: true,
                       physics: NeverScrollableScrollPhysics(),
            itemCount: Provider.of<HabitProvider>(context).selectedHabit.length,
            itemBuilder: (context, index) {
              return HomeHabit(Provider.of<HabitProvider>(context).selectedHabit[index]);
            }),
                   
     
   
                    ]),
                  ),
                 
                  SingleChildScrollView(
                  physics: ScrollPhysics(),
                    child: Column(children: [
                        Row(children: [
                        
                        SizedBox(height: 10,),
                        
               
     
        //  ListView.builder(
        //    shrinkWrap: true,
        //                physics: NeverScrollableScrollPhysics(),
        //     itemCount: Provider.of<DbProvider>(context).allTasks.length,
        //     itemBuilder: (context, index) {
        //       return PageTask(Provider.of<DbProvider>(context).allTasks[index]);
        //     }),
     
    
                     
                       ],) ,//SizedBox(height: 10,),
                    
                                 
                       
                        
                     
                        
                     
                      ],
                    ),
                  )
                 
                      
          
          
                   
                   
            
             ],
              
              ),
                    )
                    ;
          
                    
                    },
          
             
            ),
          ),
        ),
      
        bottomNavigationBar:ClipRRect(
             borderRadius: BorderRadius.all( Radius.circular(20.0),                                            
      
   
      ),   
      child:  BottomAppBar(
          //clipBehavior:Clip.antiAlias ,
          color:Colors.white,
      
          child:
          Padding(padding: EdgeInsets.only(left: 15,right: 15),child:  Row(
              
               mainAxisSize: MainAxisSize.max,
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           //   iconSize : 28.0,
   
          // type: BottomNavigationBarType.fixed,
          children: [
           // SizedBox(width: .2,),
           IconButton(icon: Icon(Icons.home_outlined,size: 35,color:Colors.grey[500]),onPressed: (){},
            
            
            ),
          
            IconButton(icon: Icon(Icons.calendar_month_rounded,size: 35,color: Colors.grey[500],),onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: ((context) => upcoming())));
                 
          
            },
            
            ),
             IconButton(icon: Icon(Icons.radar_outlined,size: 35,color: Colors.grey[500],
           ),
           onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder: ((context) => Tasks())));
           },
            
                     //  backgroundColor: Colors.blue,
   
            ),
              FloatingActionButton(child: Icon(Icons.add),
            // backgroundColor: Colors.blue,
         onPressed: (){
          openDialog(context);
                   
         },
            ),
             
   
          ],
        ),)
           
        ))
        
      );

 
   
   
  
  }
}
Future openDialog(BuildContext Context){
  return showDialog(context: Context, 
  builder: (context){
    return AlertDialog(
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.all(Radius.circular(32.0))),
  contentPadding: EdgeInsets.only(bottom: 30.0),

      actions: [
      ElevatedButton(onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Addhabit()), 
  );
}, child: Text(" Create Habit",style: GoogleFonts.raleway(fontSize: 20),),
style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 124, 27, 116),
 fixedSize: const Size(300, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))
),
),
SizedBox(height: 10,),

ElevatedButton(onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AddTask ()), 
  );
}, child: Text(" Create Task",style: GoogleFonts.raleway(fontSize: 20),),
style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 124, 27, 116),
 fixedSize: const Size(300, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))
),
),
    ],title: Text("Create"),
    );
  });
}