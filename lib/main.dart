import 'package:flutter/material.dart';
import './style.dart' as style;
import './shop.dart' as shopTab;
import './home.dart' as homeTab;

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
      body: mainItems(tabNum : tab),
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


class mainItems extends StatefulWidget {
  const mainItems({Key? key,
    required this.tabNum

  }) : super(key: key);

  final tabNum;

  @override
  State<mainItems> createState() => _mainItemsState();
}

class _mainItemsState extends State<mainItems> {
  @override
  Widget build(BuildContext context) {

    final tabNum = widget.tabNum;

    return
      Container(
          child: [homeTab.contents, shopTab.contents][tabNum]
      );

  }
}
