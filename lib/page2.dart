import 'package:flutter/material.dart';
import 'package:flutter_class/cart_demo.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print(OrderNumberWidget.of(context)?.runtimeType ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop('from page2'),
        ),
      ),
      body: const Text('Page 2'),
    );
  }
}
