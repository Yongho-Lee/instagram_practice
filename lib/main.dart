
import 'package:flutter/material.dart';
import './style.dart' as style;

void main() {
  runApp(MaterialApp(
      theme: style.theme,
      home: MyApp()
    )
  );
}



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tab = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('instagram'),
        actions: [Icon(Icons.add_box_outlined)],
      ),
      body: Row(children: [
        Container(
          child: [Text('Home 사진'), Text('Shop 사진')][tab]
        ),
      ],
      ),
      bottomNavigationBar: BottomNavigationBar(

        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,

        onTap: (i){
          setState(() {
            tab = i;
          });
        },
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
