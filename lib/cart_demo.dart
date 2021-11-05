import 'package:flutter/material.dart';
import 'package:flutter_class/page2.dart';
import 'package:rxdart/rxdart.dart';

class MyThemeData {
  static const Color fmGreen = Color(0xff009146);
  static const String imageUrl =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ31GsebfFGNwmym23ZbTcVE-V59_nfq7uDaw&usqp=CAU';
  static const Product product = Product(
    name: '我是蘋果汁我很好喝快點來買我！！',
    price: 99,
  );
}

class CartDemo extends StatefulWidget {
  const CartDemo({Key? key}) : super(key: key);

  @override
  _CartDemoState createState() => _CartDemoState();
}

class _CartDemoState extends State<CartDemo> {
  // int number = 0;
  // StreamController<int> numberStreamCtrl = StreamController.broadcast();
  // BehaviorSubject<int> numberBehaviorSubject = BehaviorSubject.seeded(0);

  // set number(int i) => numberBehaviorSubject.add(i);
  // int get number => numberBehaviorSubject.value;

  set number(int i) => OrderNumberWidget.of(context)!.number = i;
  int get number => OrderNumberWidget.of(context)!.number;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // numberStreamCtrl.close();
    // numberBehaviorSubject.close();
    super.dispose();
  }

  Widget _acIndicater() {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.blue[100],
      child: Row(
        children: const [
          Icon(
            Icons.ac_unit,
            color: Colors.blue,
          ),
          Text(
            "冷凍飲料",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }

  Widget _productBox() {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                MyThemeData.imageUrl,
                height: 150,
                width: 150,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 8),
                  alignment: Alignment.topLeft,
                  child: Text(
                    MyThemeData.product.name!,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  number--;
                  // numberStreamCtrl.add(number);
                  // numberBehaviorSubject.add(number);
                },
                child: const Text(
                  '-',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 60,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              StreamBuilder(
                // stream: numberStreamCtrl.stream,
                stream: OrderNumberWidget.of(context)!.numberStream,
                builder: (context, snap) => Text(
                  '${OrderNumberWidget.of(context)!.number}',
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  number++;
                  // numberStreamCtrl.add(number);
                  // numberBehaviorSubject.add(number);
                },
                child: const Text(
                  '+',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 40,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _amountArea() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                '商品金額小計：',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const Spacer(),
              Text(
                'NT\$${OrderNumberWidget.of(context)!.number * MyThemeData.product.price!}',
              )
              // StreamBuilder<int>(
              //   // stream: numberStreamCtrl.stream,
              //   stream: OrderNumberWidget.of(context)!.numberStream,
              //   builder: (context, snap) {
              //     if (snap.hasData) {
              //       return Text(
              //         'NT\$${snap.data! * MyThemeData.product.price!}',
              //       );
              //     }
              //     return const Text('error');
              //   },
              // ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              Text('共 ${OrderNumberWidget.of(context)!.number} 件商品：'),
              const Spacer(),
              StreamBuilder(
                // stream: numberStreamCtrl.stream,
                stream: OrderNumberWidget.of(context)!.numberStream,
                builder: (context, snap) {
                  return Text(
                    'NT\$${OrderNumberWidget.of(context)!.number * MyThemeData.product.price!}',
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '購物車',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: MyThemeData.fmGreen,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _acIndicater(),
                  _productBox(),
                  const Amount(),
                ],
              ),
            ),
            Container(
              height: 100,
              // color: Colors.blue,
              // decoration: BoxDecoration(
              //   boxShadow: BoxShadow(
              //     color: Colors.white.withOpacity(0.8),
              //   ),
              // ),
              child: Row(
                children: [
                  const MyElevatedButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String? name;
  final int? price;

  const Product({this.name, this.price});
}

class Amount extends StatelessWidget {
  const Amount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                '商品金額小計：',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const Spacer(),
              StreamBuilder(
                stream: OrderNumberWidget.of(context)!.numberStream,
                builder: (context, snap) => Text(
                  'NT\$${OrderNumberWidget.of(context)!.number * MyThemeData.product.price!}',
                ),
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              StreamBuilder(
                stream: OrderNumberWidget.of(context)!.numberStream,
                builder: (context, snap) => Text(
                  '共 ${OrderNumberWidget.of(context)!.number} 件商品：',
                ),
              ),
              const Spacer(),
              StreamBuilder(
                stream: OrderNumberWidget.of(context)!.numberStream,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return Text(
                    'NT\$${OrderNumberWidget.of(context)!.number * MyThemeData.product.price!}',
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OrderNumberWidget extends InheritedWidget {
  final BehaviorSubject<int> _numberBehaviorSubject = BehaviorSubject.seeded(0);

  get numberStream => _numberBehaviorSubject.stream;
  set number(int i) => _numberBehaviorSubject.add(i);
  int get number => _numberBehaviorSubject.value;

  OrderNumberWidget(Widget child, {Key? key}) : super(key: key, child: child);

  dispose() {
    _numberBehaviorSubject.close();
  }

  static OrderNumberWidget? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<OrderNumberWidget>()
          as OrderNumberWidget;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Page2(),
          ),
        ).then((value) => print(value));
      },
      child: const Text('下一步'),
    );
  }
}
