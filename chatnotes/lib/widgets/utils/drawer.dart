// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import '../../screens/note_editor.dart';
import '../../screens/recent_notes.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const ImageUrl="https://media.istockphoto.com/id/1409839764/vector/cute-little-robot-smiling-robotics-and-technology-kawaii-robot.jpg?s=612x612&w=0&k=20&c=qV3NO5VjN6UWdqWXDaKoFEAxt2o0ak0_jQRmM_JVGV4=";
    return Drawer(

      
      width: 250,
       child: Container(
        color: Colors.white,
         child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 30,
            ),
            ZoomIn(
              child: SizedBox(
                height: 150,
                child: Center(
                  child: CircleAvatar(  
                     radius: 70, 
                     backgroundImage: NetworkImage(ImageUrl) 
                     ),),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
                thickness: 2,
                color: Colors.blue,
                
            ),
            SizedBox(
              height: 20,
            ),
            SlideInLeft(
              child: ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> NoteEditorScreen()));
                },
                leading: Icon(CupertinoIcons.plus,
                size: 30,
                color: Color.fromARGB(255, 4, 45, 105),
                ),
                title: Text(
                  "Create a Note",
                  textScaleFactor: 1.4,
                style: TextStyle(
                  color:Color.fromARGB(255, 15, 70, 153),
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
            ),
            SlideInLeft(
              child:ListTile(
                onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> Recentnotes()));
                },
                leading: Icon(CupertinoIcons.paperclip,
                size: 30,
                color: Color.fromARGB(255, 4, 45, 105),
                ),
                title: Text(
                  "Check Notes",
                  textScaleFactor: 1.4,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:Color.fromARGB(255, 15, 70, 153),
                ),
                ),
              ),
            ),
          ],
         ),
       ),

    );
  }
}