import 'package:flutter/cupertino.dart';
class Presshold extends StatefulWidget {
  const Presshold({super.key});

  @override
  State<Presshold> createState() => _PressholdState();
}

class _PressholdState extends State<Presshold> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: CupertinoContextMenu(
        actions:[
          CupertinoContextMenuAction(
          child: Text("Open"),
          onPressed: (){
            Navigator.of(context).pop();
          },
          ),
          CupertinoContextMenuAction(
          child: Text("Like"),
          onPressed: (){
            Navigator.of(context).pop();
          },

      ),
          CupertinoContextMenuAction(
          child: Text("Delete"),
          onPressed: (){
            Navigator.of(context).pop();
          },

      )
        ,],
          child: Image.network(width: double.maxFinite,"https://img.icons8.com/?size=1x&id=83282&format=png"),
        )
      ),
    );
  }
}