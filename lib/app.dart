import 'dart:math';
import 'package:flutter/material.dart';
import 'models/product.dart';
import './components/card_list.dart';

class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  final List<Product> _items = [
    for (var i = 0; i < 100; ++i)
      Product(title: "Product $i", price: Random().nextInt(1000), count: 0)
  ];

  void _addItem(int index) {
    setState(() {
      _items[index].increaseNumItem();
    });
  }

  void _removeItem(int index) {
    if (_items[index].count > 0) {
      setState(() {
        _items[index].decreaseNumItem();
      });
    }
  }

  int _getTotalCount() {
    int sum = 0;
    for (var item in _items) {
      sum += item.count;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Card App",
        home: Scaffold(
            appBar: AppBar(
                title: Title(
                    child: const Text("Shopping Cart"), color: Colors.white),
                actions: [
                  Container(
                    margin: const EdgeInsets.only(right: 20, top: 8),
                    child: MyBadge(
                      totalItemCount: _getTotalCount(),
                    ),
                  )
                ]),
            body: CardList(
                items: _items, addItem: _addItem, removeItem: _removeItem)));
  }
}

class MyBadge extends StatelessWidget {
  const MyBadge({Key? key, required this.totalItemCount}) : super(key: key);
  final int totalItemCount;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(),
      const Icon(IconData(0xf37d, fontFamily: 'MaterialIcons'), size: 40),
      Positioned(
        top: 0,
        right: 0,
        child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10000), color: Colors.red),
            child: Center(
                child: Text('$totalItemCount',
                    style: const TextStyle(fontSize: 10)))),
      ),
    ]);
  }
}
