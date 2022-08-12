import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do/Plan%20B/UI/Pagetask.dart';

import '../Provider/HabitProvider.dart';
import '../Provider/db_provider.dart';

class Tasks extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       backgroundColor: Color.fromRGBO(237, 208, 255,50),
     
    // TODO: implement build
    // body: Padding(
    //   padding: const EdgeInsets.all(40),
    //   child: Column(
    //     children: [
    //       Row(
    //         children: [
    //           Text("Tasks",style: GoogleFonts.radley(fontSize: 20),),
    //         ],
    //       ),
    //       Consumer<DbProvider>(
    //   builder: (context,provider,x) {
    //     return ListView.builder(
    //         itemCount: provider.allTasks.length,
    //         itemBuilder: (context, index) {
    //           return PageTask(provider.allTasks[index]);
    //         });
    //   }
    // )
    //     ],
    //   ),
    // ),
   body: Consumer<DbProvider>(
      builder: (context,provider,x) {
        return ListView.builder(
            itemCount: provider.allTasks.length,
            itemBuilder: (context, index) {
              return PageTask(provider.allTasks[index]);
            });
      }
    )
  );}
}
    
  