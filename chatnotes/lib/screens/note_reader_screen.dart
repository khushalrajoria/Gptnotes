import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chatnotes/controllers/pallete.dart';
class NoteReaderScreen extends StatefulWidget {
  final QueryDocumentSnapshot doc;

  NoteReaderScreen(this.doc, {Key? key}) : super(key: key);

  @override
  State<NoteReaderScreen> createState() => NoteReaderScreenState();
}

class NoteReaderScreenState extends State<NoteReaderScreen> {
  // delete a thing document from firebase
  late DocumentReference _documentReference;
  late Future<DocumentSnapshot> _futureReference;

  @override
  void initState() {
    // delete a document from firebase
    super.initState();
    _documentReference =
        FirebaseFirestore.instance.collection('notes').doc(widget.doc.id);
    _futureReference = _documentReference.get();
  }

  @override
  Widget build(BuildContext context) {
    int colorId=widget.doc['color_id'];
    return Scaffold(
      backgroundColor: Pallete.cardsColor[colorId],
      appBar: AppBar(
      backgroundColor: Pallete.cardsColor[colorId],
      elevation: 1.0,
       actions: [
            IconButton(
              icon: Icon(Icons.delete),
              // delete a document from firebase
              onPressed: () async{
                AwesomeDialog(context: context,
          dialogType: DialogType.success,
          animType: AnimType.leftSlide,
          showCloseIcon: true,
          title: "Note Deleted",
          desc: "Your note has been Deleted",
          btnOkOnPress: ()async{
               await _documentReference.delete();
               Navigator.pop(context);
          },
          btnOkIcon: Icons.check,
          btnOkColor: Color.fromARGB(255, 243, 99, 74),
          ).show();
              })
              ]
      ,
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4,),
            Text(widget.doc['note_titles'],
            style: Pallete.mainTitle,),
            const SizedBox(height: 8,),
            Text(widget.doc['notes-date'],
            style: Pallete.dateTitle,),
            const SizedBox(height: 28,),
            Text(widget.doc['note_content'],
            style: Pallete.mainContent,
            overflow :TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}