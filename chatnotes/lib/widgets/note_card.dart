// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chatnotes/controllers/pallete.dart';

Widget noteCard(Function()? onTap,QueryDocumentSnapshot doc){
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Pallete.cardsColor[doc['color_id']],
        borderRadius: BorderRadius.circular(12),  
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 4,),
          Text(doc['note_titles'],
          style: Pallete.mainTitle,),
          SizedBox(height: 4,),
          Text(doc['notes-date'],
          style: Pallete.dateTitle,),
          SizedBox(height: 8,),
          Text(doc['note_content'],
          style: Pallete.mainContent,
          overflow :TextOverflow.ellipsis,
          ),
        ],
      ),
      
    ),
  );
}