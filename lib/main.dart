import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_class/list_view_demo.dart';
// import 'package:flutter_class/cart.dart';
import 'package:flutter_class/cart_demo.dart';

void main() {
  runApp(
    OrderNumberWidget(
      const MaterialApp(
        // home: MyApp(
        //   name: "Hello World",
        //   addr: "台中市",
        // ),
        // home: ListViewDemo(),
        home: CartDemo(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  final String name;
  final String addr;
  const MyApp({Key? key, required this.name, required this.addr})
      : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String name;
  late String addr;
  List<dynamic> myList = <dynamic>[];

  @override
  void initState() {
    super.initState();
    name = widget.name;
    addr = widget.addr;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print(name);
    print(addr);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
      ),
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) => Container(
          margin: const EdgeInsets.only(bottom: 1),
          height: 50,
          width: 50,
          color: Colors.blue,
        ),
      ),
      // body: ListView(
      //   children: [
      //     Container(
      //       height: 150,
      //       color: Colors.red,
      //     ),
      //     Container(
      //       height: 200,
      //       color: Colors.green,
      //     ),
      //     Container(
      //       height: 250,
      //       color: Colors.yellow,
      //     ),
      //     Container(
      //       height: 300,
      //       color: Colors.orange,
      //     ),
      //     Container(
      //       height: 350,
      //       color: Colors.brown,
      //     ),
      //   ],
      // ),
      // body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: <Widget>[
      //     // Text('QAQ'),
      //     Expanded(
      //       flex: 1,
      //       child: Container(
      //         color: Colors.green,
      //         alignment: Alignment.center,
      //         width: MediaQuery.of(context).size.width,
      //         height: 100,
      //         child: const Text(
      //           '測試',
      //           style: TextStyle(
      //             fontSize: 20,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ),
      //     ),
      //     Expanded(
      //       flex: 2,
      //       child: Stack(
      //         children: [
      //           Container(
      //             color: Colors.red,
      //             width: 300,
      //             height: 300,
      //           ),
      //           Container(
      //             color: Colors.blue,
      //             width: 200,
      //             height: 200,
      //           ),
      //           Positioned(
      //             left: 100,
      //             child: Container(
      //               color: Colors.grey,
      //               width: 150,
      //               height: 150,
      //             ),
      //           ),
      //           Container(
      //             color: Colors.orange,
      //             width: 100,
      //             height: 100,
      //           ),
      //         ],
      //       ),
      //     ),
      //     Expanded(
      //       child: Container(
      //         width: 100,
      //         height: 50,
      //         decoration: BoxDecoration(
      //           shape: BoxShape.circle,
      //           image: const DecorationImage(
      //             image: NetworkImage(
      //               'https://cdn0.techbang.com/system/excerpt_images/60224/original/bf32199b457a11764b1a72b18259ff61.jpg?1533265554',
      //             ),
      //             fit: BoxFit.cover,
      //           ),
      //           border: Border.all(
      //             color: Colors.blue,
      //             width: 2,
      //           ),
      //         ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
