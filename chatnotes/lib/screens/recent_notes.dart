import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chatnotes/screens/note_reader_screen.dart';
import 'package:chatnotes/screens/note_editor.dart';
import "package:velocity_x/velocity_x.dart";
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../widgets/note_card.dart';

class Recentnotes extends StatefulWidget {
  const Recentnotes({super.key});

  @override
  State<Recentnotes> createState() => _RecentnotesState();
}

class _RecentnotesState extends State<Recentnotes> {
  Offset _tapPositon = Offset.zero;
  // Overlay? overlay;
  void _getTapPosition(TapDownDetails tapPosition){
      final RenderBox renderBox=context.findRenderObject() as RenderBox;
      setState(() {
        _tapPositon=renderBox.globalToLocal(tapPosition.globalPosition);
      });
  }


  void _showContextMenu(context)async{
  //     final RenderObject? overLay =Overlay.of(context)?.context.findRenderObject();

  //     final result =await showMenu(context: context,
  //      position: RelativeRect.fromRect(
  //       Rect.fromLTWH(_tapPositon.dx, _tapPositon.dy, 40, 30),
  //       Rect.fromLTWH(0, 0, 0,0)
  //      ),
  //       items: [
  //         const PopupMenuItem(value: "open",child: Text('Open'),),
  //         const PopupMenuItem(value:"liked",child: Text('Like'),),
  //         const PopupMenuItem(value: "del",child: Text('Delete'),)
          
  //       ]
  //       );

  //       switch (result) {
  //         case 'open': print("open");
  //           break;
  //         case 'Liked': print("Like");
  //           break;
  //         case 'del': print("del");
  //           break;
            
  //         default:
  //       }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BounceInDown(child: "NoteChats".text.make()),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTapDown: (position){
                            _getTapPosition(position);
                          },
                          onLongPress: (){
                              _showContextMenu(context);
                          },
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: "Your recent notes".text.xl3.fontFamily('roboto').color(Colors.blue).fontWeight(FontWeight.bold).make()),
      
                SizedBox(
                  height: 20,   
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection("notes").snapshots(),
                    builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
                      // checking the connection state, if we still load the data we can display a progress bar
                      if(snapshot.connectionState==ConnectionState.waiting){
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                        if(snapshot.hasData){
                          return GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2 ),
                                                 children: snapshot.data!.docs.map((note)=>noteCard((){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>NoteReaderScreen(note)));},note)).toList(),
                            );
                        }
                        return Center(child: "Let's start making notes".text.xl2.color(Colors.black).fontFamily('nunito').make());
                    },
                    ),
                )// itna karne se kuch nhi hoga we have to change our security setting as we don't have any authentication on our app
                  
            ],
            
      
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> NoteEditorScreen()));
        }, 
        label: "Add Note".text.color(Colors.white).make(),
        backgroundColor: Colors.blue.shade300,
        icon: Icon(Icons.add),
        ),

      );
  }
}