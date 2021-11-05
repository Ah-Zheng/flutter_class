import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  String imgUrl =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ31GsebfFGNwmym23ZbTcVE-V59_nfq7uDaw&usqp=CAU';
  Map<String, String?> product = <String, String?>{
    'name': '頻果汁',
    'price': '100',
    'desc': null,
  };
  List<Map<String, String?>?> products = [
    {
      'name': '頻果汁',
      'price': '100',
      'desc': null,
    },
    null
  ];

  Widget _cell() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Image.network(
            imgUrl,
            height: 80,
            width: 80,
          ),
        ),
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${product['name']}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'NT\$${product['price']}',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8),
          child: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '快樂分享',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => _cell(),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 10,
      ),
    );
  }
}
