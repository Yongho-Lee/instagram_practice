import 'package:flutter/material.dart';
import './style.dart' as style;

void main() {
  runApp(MaterialApp(
      theme: style.theme,
      home: MyApp()
    )
  );
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('instagram'),
        actions: [Icon(Icons.add_box_outlined)],
      ),
      body: Row(children: [
        Container(
          child: Text('사진'),
        )
      ],
      ),
      bottomNavigationBar: BottomNavigationBar(

        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,

        items: [
        BottomNavigationBarItem(
          icon:IconButton(onPressed: (){},
            icon: Icon(Icons.home),
          ),
          label: 'Home',
          activeIcon: Icon(
            Icons.home,
            color: Colors.black,
          ),


        ),
        BottomNavigationBarItem(
            icon:IconButton(onPressed: (){},
              icon: Icon(Icons.shopping_bag_outlined),
            ),
          label: 'Shop',

        ),

      ],)



    );
  }
}
