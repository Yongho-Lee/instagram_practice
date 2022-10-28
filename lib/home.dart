//home .dart
import 'package:flutter/material.dart';

var contents = ListView.builder(
    itemCount: 3,
    itemBuilder: (context, i){
  return ListTile(
    title: Text('Home - Title Text'),

    // Image.asset(
    //     height: 50,
    //     width: 50,
    //     'water.jpg'),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text('Home - subtitle Text1'),
      Text('Home - subtitle Text2'),
      Text('Home - subtitle Text3'),
    ]),
  );
});

//Text('Home 사진');



