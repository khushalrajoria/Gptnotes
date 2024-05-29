import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:chatnotes/screens/recent_notes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chatnotes/controllers/pallete.dart';
import 'package:velocity_x/velocity_x.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({super.key});

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  @override
  Widget build(BuildContext context) {
    int colorId=Random().nextInt(Pallete.cardsColor.length);
  String date =DateTime.now().toString();
    TextEditingController titleController =TextEditingController(); // inbuilt controllers
    TextEditingController mainController =TextEditingController();
    return Scaffold(
      backgroundColor: Pallete.cardsColor[colorId],
      appBar: AppBar(
        title: "Add a new note".text.make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Note Title'
              ),
              style: Pallete.mainTitle,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(date,style: Pallete.dateTitle,),
            const SizedBox(
              height: 28,
            ),
            TextField(
              controller: mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Write your notes here'
              ),
              style: Pallete.mainContent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade300,
        onPressed: (){
          AwesomeDialog(context: context,
          dialogType: DialogType.success,
          animType: AnimType.leftSlide,
          showCloseIcon: true,
          title: "Note created",
          desc: "Your note has been created please check Recent Notes",
          btnOkOnPress: ()async{
          FirebaseFirestore.instance.collection("notes").add({
            "note_titles":titleController.text,
            "notes-date":date,
            "note_content":mainController.text,
            "color_id":colorId,
          }).then((value){  print(value.id);
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const Recentnotes()));
         }).catchError((error)=>print("Failed to add note due to $error"));
          },
          btnOkIcon: Icons.check,
          btnOkColor: const Color.fromARGB(255, 25, 202, 233),
          ).show();
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}