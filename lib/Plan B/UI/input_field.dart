import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class input_field extends StatelessWidget{
  final String title;
  final String hint;
  final TextEditingController?controller;
  final Widget? widget;

  const input_field({Key?key,
  required this.title,
  required this.hint,
   required this.controller,
  this.widget
  }):super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.only(left: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Container(
            height: 52,
            margin: EdgeInsets.only(top: 8.0),
            padding: EdgeInsets.only(left: 14),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0
              ),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Row(children: [
              Expanded(child: TextFormField(
                readOnly: widget==null?false:true,
                autofocus: false,
                controller: controller,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,

                  ),
                 
                ),
                 decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                 
                  

                  )
              )
              ),
              widget==null?Container():Container(child: widget,)
            ]
            ),
          )
        ],
      ),
    );
  }

}