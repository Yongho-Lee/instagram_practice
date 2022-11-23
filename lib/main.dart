import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



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


// **  MYAPP  **
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  // bottom tab selection variable
  var tab = 0;

  var datas = [];

  // Json Get 요청
  getData() async {
    var pureData = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    print(jsonDecode(pureData.body));
    var result = jsonDecode(pureData.body);
    setState(() {
      datas = result;
    });
  }

  @override
  // initstate 함수는 Myapp이 로드될 때 한 번 실행되는 라이브러리 함수임.
  void initState() {
    super.initState();
    getData();
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // ** AppBar
      appBar: AppBar(
        title: Text('instagram'),
        actions: [Icon(Icons.add_box_outlined)],
      ),

      // ** Body
      body:       Container(
          child: [Home(datas : datas), shopTab.contents][tab]
      ),

      // **Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        // this function changes the tab number ( [home, shop] [0,1 ...] ) by state.
        onTap: (i){
          setState(() {
            tab = i;
          });
        },
        items: [
          BottomNavigationBarItem(
              label : '홈',
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home,
              color: Colors.black,
              )
          ),
          BottomNavigationBarItem(
              label : '샵',
              icon: Icon(Icons.shopping_bag_outlined),
              activeIcon: Icon(Icons.shopping_bag,
              color: Colors.black
                )
          )
        ],

      // 내가 손으로 친 코드 (뭐가 문제인지 잘 모르겠음. 나중에 체크좀)
      //   items: [
      //   BottomNavigationBarItem(
      //     icon:IconButton(onPressed: (){},
      //       icon: Icon(Icons.home),
      //     ),
      //     label: 'Home',
      //     activeIcon: Icon(
      //       Icons.home,
      //       color: Colors.black,
      //     ),
      //
      //   ),
      //   BottomNavigationBarItem(
      //       icon:IconButton(onPressed: (){},
      //         icon: Icon(Icons.shopping_bag_outlined),
      //       ),
      //     label: 'Shop',
      //     activeIcon: Icon(
      //       Icons.shopping_bag,
      //       color: Colors.black,
      //     )
      //
      //   ),
      //
      // ],

      )



    );
  }
}

/// mainitems stful은 지움.
/// getData 이후에 파일이 계속 상속해서 문제가 발생함. 해결책을 찾지 못함.


// ** Home

class Home extends StatefulWidget {
  const Home({Key? key,
    required this.datas,
  })
      : super(key: key);

  final datas;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override



  Widget build(BuildContext context) {
    final datas = widget.datas;

    if(datas.isNotEmpty){
      return ListView.builder(
          itemCount: datas.length,
          itemBuilder: (context, i){
            return ListTile(
              title: Image.network(datas[i]['image']),

              // Image.asset(
              //     height: 50,
              //     width: 50,
              //     'water.jpg'),
              subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(datas[i]['content']),
                    Text(datas[i]['date']),
                    Text(datas[i]['user']),
                  ]),
            );
          });

    } else {
      return CircularProgressIndicator();
    }

//Text('Home 사진');


  }
}


