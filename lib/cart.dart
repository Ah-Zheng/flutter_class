import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  String imgUrl =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ31GsebfFGNwmym23ZbTcVE-V59_nfq7uDaw&usqp=CAU';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('購物車'),
        centerTitle: true,
        backgroundColor: Colors.green[400],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10),
            height: 50,
            color: Colors.blue[200],
            child: Row(
              children: const [
                Icon(
                  Icons.ac_unit_outlined,
                  color: Colors.blue,
                ),
                Text(
                  '冷凍商品',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.network(
                        imgUrl,
                        height: 150,
                        width: 150,
                      ),
                    ),
                    const Text(
                      '我是蘋果汁，我很好喝',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        '-',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    const Text(
                      '99',
                      style: TextStyle(fontSize: 25),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        '+',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
