import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do/Plan%20B/Data/DbHelper.dart';
import 'package:to_do/Plan%20B/Data/model.dart';
import 'package:to_do/Plan%20B/Provider/db_provider.dart';
import 'package:to_do/Plan%20B/UI/Pagetask.dart';
import 'package:to_do/Plan%20B/UI/Tasks.dart';


import 'input_field.dart';

class AddTask extends StatefulWidget{
// final TextEditingController titlecont=TextEditingController();

  @override
  State<AddTask> createState() => _AddTask();
}

class _AddTask extends State<AddTask> {
  
  final TextEditingController  titlecont=TextEditingController();
  final TextEditingController descecont=TextEditingController();
  final TextEditingController dateecont=TextEditingController();
  final TextEditingController startlecont=TextEditingController();
  final TextEditingController endlecont=TextEditingController();
  final TextEditingController remilecont=TextEditingController();
  final TextEditingController repeatcont=TextEditingController();
  GlobalKey <FormState>navkey =GlobalKey();
  

  String?isEmpty(String v){
   if (v.isEmpty){
      return "This field required";
    }
  }
           @override
  DateTime _dateTime=DateTime.now();
  DateTime _selectedDate=DateTime.now();
  String _endtime='9:30';
  String _starttime=DateFormat("hh:mm a").format(DateTime.now()).toString();
  int _selectedtime=5;
  List<int>reminder=[5,10,15,20];
   String _selectedrepet="None";
  List<String>repeat=["None"
  ,"Daily"
  ,"Weekly",
  "Monthly"
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
    backgroundColor:
     Color.fromRGBO(239, 236, 255,20),
    body: Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child:Form(
          key: navkey,
          child: Column(
            children: [
              SizedBox(height: 30,),
              Row(children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                  
                }, icon: Icon(Icons.arrow_back_ios_new_rounded,color: Color.fromARGB(255, 137, 136, 136),))
              ],),
              Text('“Live your story before it’s over”',style: GoogleFonts.squarePeg(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w700),),
              SizedBox(height: 30 ,),
              Row(
                children: [
                  Text("   Add Task",style: GoogleFonts.bitter(fontSize: 20),).tr(),
                  //Image(image: AssetImage('assets/images/pleaf.jpg'),)
                ],),
             // Text('ADD TASK'),
              input_field(title: 'Title'.tr(),hint: 'Enter the title'.tr(),controller: titlecont,valdite: isEmpty,),
             input_field(title: 'Note'.tr(),hint: 'Enter your Note here '.tr(),controller: descecont,valdite: isEmpty,),
             input_field(title: 'Date'.tr(),hint: DateFormat.yMd().format(_selectedDate),
             widget: IconButton(icon: Icon(Icons.calendar_today_rounded,color: Colors.grey,)
             ,onPressed: (() {
              _getDateFromuser();
              // showDatePicker(context: context, 
              // initialDate: _dateTime, 
              // firstDate: DateTime(2005), 
              // lastDate: DateTime(2121)).then((date) {
              //   setState(() {
              //    _selectedDate=_dateTime;
              //     print(_dateTime);
              //   });
        
              // }
             // );
             
             }
             )
             ,)
             ,controller: dateecont,),
             Row(
              children: [
                Expanded(
                  child: input_field(title: "Start Date",
                  hint: _starttime,
                  widget: IconButton(icon: Icon(Icons.access_alarm_rounded,color: Colors.grey,),onPressed: () {
               _getTimeFromuser(isStartTime: true);
        
                    
                  },),controller: startlecont,)
                  ),
                  Expanded(
                  child: input_field(title: "End Date",
                  hint:_endtime,
                  widget: IconButton(icon: Icon(Icons.access_alarm_rounded,color: Colors.grey,),onPressed: () {
                    _getTimeFromuser(isStartTime: false);
                    
                  },), controller: endlecont,)
                  )
              ],
             ),
            
        input_field(title: "Remind", hint: "$_selectedtime minutes early",
        widget: DropdownButton(
          icon:Icon(Icons.keyboard_arrow_down,color: Colors.grey,) ,
          iconSize: 32,
          elevation: 4,
          underline: Container(height: 0),
          onChanged: (String? newValue){
            setState(() {
              _selectedtime=int.parse(newValue!);
            });
          },
          items: reminder.map<DropdownMenuItem<String>>((int value) {
            return DropdownMenuItem<String>(
              value: value.toString(),
              child:Text(value.toString()) 
              ,);
        
            
        
            
          }
          ).toList()
          
           ), controller: remilecont,
          ),
          input_field(title: "Repeat", hint: "$_selectedrepet",
        widget: DropdownButton(
          icon:Icon(Icons.keyboard_arrow_down,color: Colors.grey,) ,
          iconSize: 32,
          elevation: 4,
          underline: Container(height: 0),
          onChanged: (String? newValue){
            setState(() {
              _selectedrepet=newValue!;
            });
          },
          items: repeat.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child:Text(value,style: TextStyle(color: Colors.grey),) 
              ,);
        
            
        
            
          }
          ).toList()
          
           ), controller: repeatcont,
          ),
          
          SizedBox(height: 30,),
          //  ElevatedButton(
           
          //       onPressed: () async {
                  
          //         TaskModel taskModel=TaskModel(title: titlecont.text,description: descecont.text);
          //         await Provider.of<DbProvider>(context, listen: false)
          //             .createNewTask(taskModel);
          //         Navigator.of(context).pop();
          //       },
          //       child: Text('Add New Task')),
          // InkWell(
          //   onTap: ()async { 
             
          
          //     TaskModel taskModel=TaskModel(title: titlecont.text,description: descecont.text);
          //    await  Provider.of<DbProvider>(context,listen: false).createNewTask(taskModel);
          //     Navigator.of(context).pop;
              
          //    },
          //   child: Container(
          //     width: 250,
          //     height: 50,
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment.topRight,
          //         end: Alignment.bottomLeft,
          //         colors: [
          //           Color.fromARGB(255, 179, 79, 230),
          //           Color.fromARGB(255, 199, 26, 153),
          //         ],
          //       ),
          //       borderRadius: BorderRadius.circular(30)
          //     ),
          //     child:Center(child: Text('Create Task',style: GoogleFonts.taviraj(
          // color: Colors.white,
          // fontSize: 20
          
          //     ),),) 
          //   // width: 320,height: 55,
          //   ),
          // )
           DecoratedBox(
    decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
               Color.fromARGB(255, 179, 79, 230),
                  Color.fromARGB(255, 199, 26, 153),
              //add more colors
            ]),
          borderRadius: BorderRadius.circular(5),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                blurRadius: 5) //blur radius of shadow
          ]
      ),
    child:ElevatedButton(
      
      style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          onSurface: Colors.transparent,
          shadowColor: Colors.transparent,
          //make color or elevated button transparent
      ),
      
      onPressed: () async {
              
                 TaskModel taskModel=TaskModel(title: titlecont.text,description: descecont.text);
                  await Provider.of<DbProvider>(context, listen: false)
                      .createNewTask(taskModel);
                       Navigator.push(context, MaterialPageRoute(builder: ((context) => Tasks())));

             
                 
               
                },
      child: Padding(
        padding:EdgeInsets.only(
          top: 15,
          bottom: 15,
          left: 15,
          right: 15
        ),
        child:Text("Create Task",style:GoogleFonts.taviraj(color: Colors.white,
           fontSize: 18)),
      )
    )  
)
        
        
            ],
          ),
        )
         ),
    ),
   );
  }
  _getDateFromuser()async{

    DateTime? _pickedDate=await showDatePicker(context: context, 
    initialDate: DateTime.now(), 
    firstDate: DateTime(2015), 
    lastDate: DateTime(2030));
    if(_pickedDate!=null){
   setState(() {
     _selectedDate=_pickedDate ;
     
   });
   
    }else{
      print('There is somthing wrong');
    }
  }
 _getTimeFromuser({required bool isStartTime})async{
  var pickedTime= await _showTimePicker();
  String _formatedTime=pickedTime.format(context);
  if(pickedTime==null){
    print("Time canceld");
  }
  else if(isStartTime==true){
    _starttime=_formatedTime;

  }
  else if(isStartTime==false){
    _endtime=_formatedTime;

  }
 }
 _showTimePicker(){
  return showTimePicker(context: context, 
  initialTime: TimeOfDay(
    hour: int.parse(_starttime.split(":")[0]), 
    minute: int.parse(_starttime.split(":")[1].split(" ")[0])
    )
    );
 }

}

void main(List<String> args) {
  runApp(MaterialApp(home:AddTask()));
}